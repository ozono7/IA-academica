# Autor: Dr. José Juan Torres Martínez
# Docente de Ciencias Químicas
# Universidad Autónoma de San Luis Potosí (UASLP)
# México
#
# Material académico para estudiantes
# Repositorio IA-academica — Herramienta 11: Búsqueda automática de artículos

# Busca un tema en 7 repositorios, elimina duplicados por DOI, sugiere revistas
# (Scimago y Springer) y descarga los PDFs libres (máx. 120) a pdfs/.
# Genera tabla_articulos.csv, revistas_sugeridas.csv y articulos_por_anio.png.
# Paquetes: httr, jsonlite, dplyr, readr, ggplot2, xml2.

library(httr)
library(jsonlite)
library(dplyr)
library(readr)
library(ggplot2)
library(xml2)

# Operador "o si no": x %||% y devuelve x, salvo que x sea NULL o vacío,
# en cuyo caso devuelve y. Evita errores cuando una API no trae un campo.
`%||%` <- function(x, y) {
  if (is.null(x) || length(x) == 0) y else x
}

# ---------------------------------------------------------------------------
# Uso: edita el tema, tu correo y los límites en esta sección y corre el
# script completo. Tarda varios minutos porque consulta muchas APIs con
# pausas entre llamadas. Revisa tabla_articulos.csv y revistas_sugeridas.csv.

# CONFIGURACIÓN: edita estas líneas para cada búsqueda
# ---------------------------------------------------------------------------

# Tema de búsqueda (en inglés; la literatura científica está en inglés).
tema <- "Chlorella vulgaris blue light lipid accumulation"

# Tu correo (lo piden Unpaywall y las APIs de NCBI para identificar el uso).
correo <- "dnaozono@gmail.com"

# Cuántos resultados pedir a cada fuente (10 es suficiente para probar;
# sube a 50 o 100 cuando quieras una revisión amplia).
max_por_fuente <- 10

# Límite máximo de PDFs a descargar (Juan, 2026-11-09: 120 como máximo).
max_pdfs <- 120

# Carpeta donde se guardan los PDFs descargados.
carpeta_pdfs <- "pdfs"

# Claves gratuitas (opcionales; dejar en "" si no se tienen).
#   Semantic Scholar: https://www.semanticscholar.org/product/api#api-key-form
#   OpenAlex: https://api.openalex.org/api-keys (se pide con el correo)
#   Springer Nature: https://dev.springernature.com/ (registro gratuito)
clave_semantic_scholar <- ""
clave_openalex <- ""
clave_springer <- ""

# Áreas de Scimago para filtrar las revistas candidatas (texto que debe
# aparecer en la categoría del ranking) y cuartiles aceptados.
areas_scimago <- c("Biotechnology", "Plant Science", "Environmental Science")
cuartiles_aceptados <- c("Q1", "Q2")

# Archivo CSV del ranking de Scimago, descargado a mano desde
# https://www.scimagojr.com/journalrank.php (botón Download, formato CSV).
archivo_scimago <- "scimago_journalrank.csv"

# ---------------------------------------------------------------------------
# FUNCIONES AUXILIARES
# ---------------------------------------------------------------------------

# Limpia etiquetas HTML y entidades (&lt; &gt; &amp;) de títulos y resúmenes.
# Europe PMC devuelve los títulos con etiquetas como <i>...</i>.
limpiar_html <- function(texto) {
  if (is.null(texto) || length(texto) == 0 || is.na(texto)) return("")
  texto <- gsub("<[^>]+>", "", texto)
  texto <- gsub("&lt;", "<", texto)
  texto <- gsub("&gt;", ">", texto)
  texto <- gsub("&amp;", "&", texto)
  texto <- gsub("&quot;", "\"", texto)
  texto <- gsub("\\s+", " ", texto)
  trimws(texto)
}

# Normaliza un DOI para comparar: minúsculas, sin espacios, sin prefijo.
normalizar_doi <- function(doi) {
  if (is.null(doi) || length(doi) == 0 || is.na(doi)) return("")
  doi <- trimws(tolower(doi))
  doi <- sub("^https?://(dx\\.)?doi\\.org/", "", doi)
  doi
}

# Hace una petición GET con manejo de errores y del límite 429.
# Si el servidor responde 429, espera 60 segundos y reintenta una vez.
# Devuelve la respuesta httr o NULL si falló.
get_con_reintento <- function(url, ...) {
  respuesta <- tryCatch(
    GET(url, user_agent("B.M.O-research-tool/1.0"), ...),
    error = function(e) NULL
  )
  if (is.null(respuesta)) return(NULL)
  if (status_code(respuesta) == 429) {
    message("Límite de peticiones (429) en: ", substr(url, 1, 80),
            ". Esperando 60 segundos y reintentando una vez.")
    Sys.sleep(60)
    respuesta <- tryCatch(
      GET(url, user_agent("B.M.O-research-tool/1.0"), ...),
      error = function(e) NULL
    )
    if (is.null(respuesta)) return(NULL)
  }
  if (status_code(respuesta) != 200) {
    message("Petición fallida (HTTP ", status_code(respuesta), "): ",
            substr(url, 1, 80))
    return(NULL)
  }
  respuesta
}

# Convierte una lista de artículos a tibble con las columnas estándar.
# Cada fuente usa esta misma estructura para que se puedan juntar.
tabla_vacia <- function() {
  tibble(
    doi = character(),
    titulo = character(),
    anio = character(),
    revista = character(),
    autores = character(),
    abstract = character(),
    fuente = character(),
    pmid = character(),
    pdf_url = character()
  )
}

# ---------------------------------------------------------------------------
# 1. PUBMED (NCBI E-utilities: esearch + esummary + efetch)
#    Sin rentrez: se llama directo a la API con httr + jsonlite, como en el
#    Módulo 01 de la serie RNA-seq (que dejó de usar entrez_summary porque
#    fallaba). El DOI se toma de articleids o de elocationid.
# ---------------------------------------------------------------------------

buscar_pubmed <- function(tema, max_resultados = 10, correo = "") {
  message("Buscando en PubMed: ", tema)
  url_busqueda <- paste0(
    "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi",
    "?db=pubmed&term=", URLencode(tema),
    "&retmode=json&retmax=", max_resultados,
    if (correo != "") paste0("&email=", URLencode(correo)) else ""
  )
  resp <- get_con_reintento(url_busqueda)
  if (is.null(resp)) return(tabla_vacia())
  ids <- fromJSON(content(resp, "text", encoding = "UTF-8"),
                  simplifyVector = TRUE)$esearchresult$idlist
  if (length(ids) == 0) {
    message("PubMed no devolvió resultados para este tema.")
    return(tabla_vacia())
  }
  # Ficha de cada artículo (título, revista, año, autores, DOI).
  url_resumen <- paste0(
    "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi",
    "?db=pubmed&id=", paste(ids, collapse = ","),
    "&retmode=json"
  )
  resp2 <- get_con_reintento(url_resumen)
  if (is.null(resp2)) return(tabla_vacia())
  datos <- fromJSON(content(resp2, "text", encoding = "UTF-8"),
                    simplifyVector = FALSE)$result
  filas <- lapply(datos$uids, function(uid) {
    r <- datos[[uid]]
    doi <- ""
    for (a in r$articleids) {
      if (!is.null(a$idtype) && a$idtype == "doi") doi <- a$value
    }
    if (doi == "" && !is.null(r$elocationid)) {
      doi <- sub("^doi:\\s*", "", r$elocationid)
    }
    autores <- paste(
      vapply(r$authors, function(a) a$name, character(1)),
      collapse = "; "
    )
    tibble(
      doi = doi,
      titulo = limpiar_html(r$title %||% ""),
      anio = substr(r$pubdate %||% "", 1, 4),
      revista = r$fulljournalname %||% "",
      autores = autores,
      abstract = "",
      fuente = "PubMed",
      pmid = uid,
      pdf_url = ""
    )
  })
  tabla <- bind_rows(filas)
  # Resúmenes con efetch (XML): se añaden a la tabla por PMID.
  url_abstract <- paste0(
    "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi",
    "?db=pubmed&id=", paste(ids, collapse = ","),
    "&rettype=abstract&retmode=xml"
  )
  resp3 <- get_con_reintento(url_abstract)
  if (!is.null(resp3)) {
    xml <- read_xml(content(resp3, "text", encoding = "UTF-8"))
    articulos_xml <- xml_find_all(xml, ".//PubmedArticle")
    for (art in articulos_xml) {
      pmid <- xml_text(xml_find_first(art, ".//PMID"))
      nodo_abs <- xml_find_first(art, ".//Abstract")
      if (!is.na(nodo_abs)) {
        texto_abs <- paste(xml_text(xml_find_all(nodo_abs, ".//AbstractText")),
                           collapse = " ")
        tabla$abstract[tabla$pmid == pmid] <- limpiar_html(texto_abs)
      }
    }
  }
  Sys.sleep(1)  # Pausa para no saturar la API de NCBI.
  tabla
}

# ---------------------------------------------------------------------------
# 2. EUROPE PMC (API REST del EMBL-EBI)
#    Devuelve título, año, revista, autores, resumen, DOI y PMID, y el enlace
#    al texto completo cuando existe. resultType=core trae el resumen.
# ---------------------------------------------------------------------------

buscar_europe_pmc <- function(tema, max_resultados = 10) {
  message("Buscando en Europe PMC: ", tema)
  url <- paste0(
    "https://www.ebi.ac.uk/europepmc/webservices/rest/search",
    "?query=", URLencode(tema),
    "&format=json&resultType=core&pageSize=", max_resultados
  )
  resp <- get_con_reintento(url)
  if (is.null(resp)) return(tabla_vacia())
  datos <- fromJSON(content(resp, "text", encoding = "UTF-8"),
                    simplifyVector = FALSE)
  resultados <- datos$resultList$result
  if (length(resultados) == 0) return(tabla_vacia())
  filas <- lapply(resultados, function(r) {
    # Enlace al PDF cuando Europe PMC lo publica (no siempre funciona para
    # descarga automática; se intenta de todos modos en la fase de descarga).
    pdf <- ""
    if (!is.null(r$fullTextUrlList)) {
      for (u in r$fullTextUrlList$fullTextUrl) {
        if (!is.null(u$documentStyle) && u$documentStyle == "pdf") {
          pdf <- u$url
        }
      }
    }
    tibble(
      doi = r$doi %||% "",
      titulo = limpiar_html(r$title %||% ""),
      anio = as.character(r$pubYear %||% ""),
      revista = r$journalTitle %||% "",
      autores = r$authorString %||% "",
      abstract = limpiar_html(r$abstractText %||% ""),
      fuente = "Europe PMC",
      pmid = r$pmid %||% "",
      pdf_url = pdf
    )
  })
  bind_rows(filas)
}

# ---------------------------------------------------------------------------
# 3. SEMANTIC SCHOLAR (API gratuita)
#    Devuelve título, año, revista, autores, resumen, DOI y el enlace al PDF
#    de acceso abierto (openAccessPdf) cuando existe. Sin clave, el límite es
#    bajo y puede devolver 429: el script espera y reintenta una vez.
# ---------------------------------------------------------------------------

buscar_semantic_scholar <- function(tema, max_resultados = 10, clave = "") {
  message("Buscando en Semantic Scholar: ", tema)
  url <- paste0(
    "https://api.semanticscholar.org/graph/v1/paper/search",
    "?query=", URLencode(tema),
    "&fields=title,abstract,year,venue,authors,externalIds,openAccessPdf",
    "&limit=", max_resultados
  )
  encabezado <- if (clave != "") add_headers(`x-api-key` = clave) else NULL
  resp <- get_con_reintento(url, encabezado)
  if (is.null(resp)) return(tabla_vacia())
  datos <- fromJSON(content(resp, "text", encoding = "UTF-8"),
                    simplifyVector = FALSE)
  if (is.null(datos$data) || length(datos$data) == 0) return(tabla_vacia())
  filas <- lapply(datos$data, function(p) {
    doi <- ""
    if (!is.null(p$externalIds) && !is.null(p$externalIds$DOI)) {
      doi <- p$externalIds$DOI
    }
    autores <- paste(
      vapply(p$authors, function(a) a$name %||% "", character(1)),
      collapse = "; "
    )
    pdf <- ""
    if (!is.null(p$openAccessPdf) && !is.null(p$openAccessPdf$url)) {
      pdf <- p$openAccessPdf$url
    }
    tibble(
      doi = doi,
      titulo = limpiar_html(p$title %||% ""),
      anio = as.character(p$year %||% ""),
      revista = p$venue %||% "",
      autores = autores,
      abstract = limpiar_html(p$abstract %||% ""),
      fuente = "Semantic Scholar",
      pmid = "",
      pdf_url = pdf
    )
  })
  bind_rows(filas)
}

# ---------------------------------------------------------------------------
# 4. OPENALEX (API gratuita)
#    Devuelve título, año, revista, autores, DOI y si es de acceso abierto.
#    El resumen viene como índice invertido (palabra -> posiciones) y se
#    reconstruye con reconstruir_abstract_openalex(). Sin clave, el límite
#    diario es compartido por IP y puede agotarse: conviene pedir una clave
#    gratuita con el correo y ponerla en clave_openalex.
# ---------------------------------------------------------------------------

reconstruir_abstract_openalex <- function(indice_invertido) {
  if (is.null(indice_invertido) || length(indice_invertido) == 0) return("")
  posiciones <- c()
  for (palabra in names(indice_invertido)) {
    for (pos in indice_invertido[[palabra]]) {
      posiciones[as.character(pos + 1)] <- palabra
    }
  }
  orden <- sort(as.integer(names(posiciones)))
  paste(posiciones[as.character(orden)], collapse = " ")
}

buscar_openalex <- function(tema, max_resultados = 10, clave = "") {
  message("Buscando en OpenAlex: ", tema)
  url <- paste0(
    "https://api.openalex.org/works?search=", URLencode(tema),
    "&per-page=", max_resultados,
    if (clave != "") paste0("&api_key=", clave) else ""
  )
  resp <- get_con_reintento(url)
  if (is.null(resp)) return(tabla_vacia())
  datos <- fromJSON(content(resp, "text", encoding = "UTF-8"),
                    simplifyVector = FALSE)
  if (is.null(datos$results) || length(datos$results) == 0) {
    return(tabla_vacia())
  }
  filas <- lapply(datos$results, function(w) {
    doi <- sub("^https?://doi\\.org/", "", w$doi %||% "")
    autores <- paste(
      vapply(w$authorships, function(a) a$author$display_name %||% "",
             character(1)),
      collapse = "; "
    )
    revista <- ""
    if (!is.null(w$primary_location) && !is.null(w$primary_location$source)) {
      revista <- w$primary_location$source$display_name %||% ""
    }
    pdf <- ""
    if (!is.null(w$best_oa_location) &&
        !is.null(w$best_oa_location$pdf_url)) {
      pdf <- w$best_oa_location$pdf_url
    }
    tibble(
      doi = doi,
      titulo = limpiar_html(w$title %||% ""),
      anio = as.character(w$publication_year %||% ""),
      revista = revista,
      autores = autores,
      abstract = reconstruir_abstract_openalex(w$abstract_inverted_index),
      fuente = "OpenAlex",
      pmid = "",
      pdf_url = pdf
    )
  })
  bind_rows(filas)
}

# ---------------------------------------------------------------------------
# 5. CROSSREF (API gratuita)
#    Devuelve título, año, revista, autores y DOI de casi cualquier artículo
#    con DOI. El resumen casi nunca viene (los editores no siempre lo
#    depositan): se completa con el de otras fuentes al juntar los resultados.
# ---------------------------------------------------------------------------

buscar_crossref <- function(tema, max_resultados = 10, correo = "") {
  message("Buscando en Crossref: ", tema)
  url <- paste0(
    "https://api.crossref.org/works?query=", URLencode(tema),
    "&rows=", max_resultados,
    "&select=DOI,title,author,container-title,published,abstract,URL"
  )
  resp <- get_con_reintento(
    url,
    add_headers(`User-Agent` = paste0("B.M.O-research-tool/1.0 (mailto:",
                                       correo, ")"))
  )
  if (is.null(resp)) return(tabla_vacia())
  datos <- fromJSON(content(resp, "text", encoding = "UTF-8"),
                    simplifyVector = FALSE)
  items <- datos$message$items
  if (length(items) == 0) return(tabla_vacia())
  filas <- lapply(items, function(it) {
    anio <- ""
    if (!is.null(it$published) && !is.null(it$published$`date-parts`)) {
      anio <- as.character(it$published$`date-parts`[[1]][1])
    }
    autores <- paste(
      vapply(it$author, function(a) {
        trimws(paste(a$family %||% "", a$given %||% ""))
      }, character(1)),
      collapse = "; "
    )
    revista <- ""
    if (!is.null(it$`container-title`) && length(it$`container-title`) > 0) {
      revista <- it$`container-title`[[1]]
    }
    tibble(
      doi = it$DOI %||% "",
      titulo = limpiar_html(it$title[[1]] %||% ""),
      anio = anio,
      revista = revista,
      autores = autores,
      abstract = limpiar_html(it$abstract %||% ""),
      fuente = "Crossref",
      pmid = "",
      pdf_url = ""
    )
  })
  bind_rows(filas)
}

# ---------------------------------------------------------------------------
# 6. arXiv (API, https)
#    Preprints de física, matemáticas, computación y biología cuantitativa.
#    Muchos no tienen DOI: se deduplican por título. Cada registro trae el
#    enlace directo al PDF (arxiv.org/pdf/...), que sí se descarga.
#    Nota: usar https, no http (la versión http no responde).
# ---------------------------------------------------------------------------

buscar_arxiv <- function(tema, max_resultados = 10) {
  message("Buscando en arXiv: ", tema)
  consulta <- paste("all:", strsplit(tema, " ")[[1]], collapse = " AND all:")
  url <- paste0(
    "https://export.arxiv.org/api/query?search_query=",
    URLencode(consulta),
    "&max_results=", max_resultados
  )
  resp <- get_con_reintento(url)
  if (is.null(resp)) return(tabla_vacia())
  xml <- read_xml(content(resp, "text", encoding = "UTF-8"))
  ns <- c(a = "http://www.w3.org/2005/Atom")
  entradas <- xml_find_all(xml, ".//a:entry", ns)
  if (length(entradas) == 0) return(tabla_vacia())
  filas <- lapply(entradas, function(e) {
    titulo <- xml_text(xml_find_first(e, "./a:title", ns))
    publicado <- xml_text(xml_find_first(e, "./a:published", ns))
    resumen <- xml_text(xml_find_first(e, "./a:summary", ns))
    doi_nodo <- xml_find_first(e, "./a:doi", ns)
    doi <- if (!is.na(doi_nodo)) xml_text(doi_nodo) else ""
    autores <- paste(
      xml_text(xml_find_all(e, "./a:author/a:name", ns)),
      collapse = "; "
    )
    enlaces <- xml_find_all(e, "./a:link", ns)
    pdf <- ""
    for (l in enlaces) {
      if (!is.na(xml_attr(l, "title")) && xml_attr(l, "title") == "pdf") {
        pdf <- xml_attr(l, "href")
      }
    }
    tibble(
      doi = doi,
      titulo = limpiar_html(titulo),
      anio = substr(publicado, 1, 4),
      revista = "arXiv",
      autores = autores,
      abstract = limpiar_html(resumen),
      fuente = "arXiv",
      pmid = "",
      pdf_url = pdf
    )
  })
  bind_rows(filas)
}

# ---------------------------------------------------------------------------
# 7. CORE (API v3)
#    Agregador de acceso abierto (repositorios y revistas). Devuelve título,
#    autores, año, DOI (cuando lo tiene) y el enlace de descarga del PDF
#    (downloadUrl). Funciona sin clave para búsquedas pequeñas; para uso
#    intensivo conviene pedir una clave gratuita en https://core.ac.uk/api.
# ---------------------------------------------------------------------------

buscar_core <- function(tema, max_resultados = 10) {
  message("Buscando en CORE: ", tema)
  url <- paste0(
    "https://api.core.ac.uk/v3/search/works?q=", URLencode(tema),
    "&limit=", max_resultados
  )
  resp <- get_con_reintento(url)
  if (is.null(resp)) return(tabla_vacia())
  datos <- fromJSON(content(resp, "text", encoding = "UTF-8"),
                    simplifyVector = FALSE)
  if (is.null(datos$results) || length(datos$results) == 0) {
    return(tabla_vacia())
  }
  filas <- lapply(datos$results, function(r) {
    autores <- paste(
      vapply(r$authors, function(a) a$name %||% "", character(1)),
      collapse = "; "
    )
    tibble(
      doi = r$doi %||% "",
      titulo = limpiar_html(r$title %||% ""),
      anio = as.character(r$yearPublished %||% ""),
      revista = r$publisher %||% "",
      autores = autores,
      abstract = "",
      fuente = "CORE",
      pmid = "",
      pdf_url = r$downloadUrl %||% ""
    )
  })
  bind_rows(filas)
}

# ---------------------------------------------------------------------------
# 8. JUNTAR TODAS LAS FUENTES Y ELIMINAR DUPLICADOS POR DOI
#    Un mismo artículo aparece en varias fuentes: se junta en un solo renglón
#    y se anota en qué fuentes se encontró. La clave es el DOI normalizado
#    (minúsculas, sin prefijo). Los registros sin DOI se deduplican por el
#    título normalizado. Los campos vacíos se completan con los de otra
#    fuente cuando la tiene (por ejemplo, el resumen que Crossref no trae).
# ---------------------------------------------------------------------------

unir_y_dedup <- function(lista_tablas) {
  tabla <- bind_rows(lista_tablas)
  if (nrow(tabla) == 0) return(tabla)
  tabla <- tabla |>
    mutate(
      doi_norm = vapply(doi, normalizar_doi, character(1)),
      titulo_norm = tolower(trimws(titulo)),
      clave = ifelse(doi_norm != "", paste0("DOI:", doi_norm),
                     paste0("TITULO:", titulo_norm))
    )
  # Para cada clave única, quedarse con el renglón más completo y juntar
  # las fuentes y los enlaces a PDF.
  tabla_unica <- tabla |>
    group_by(clave) |>
    summarise(
      doi = first(doi[doi != ""] %||% ""),
      titulo = first(titulo[titulo != ""] %||% ""),
      anio = first(anio[anio != ""] %||% ""),
      revista = first(revista[revista != ""] %||% ""),
      autores = first(autores[autores != ""] %||% ""),
      abstract = first(abstract[abstract != ""] %||% ""),
      fuente = paste(unique(fuente), collapse = "; "),
      pmid = first(pmid[pmid != ""] %||% ""),
      pdf_url = first(pdf_url[pdf_url != ""] %||% ""),
      .groups = "drop"
    ) |>
    select(doi, titulo, anio, revista, autores, abstract, fuente, pmid,
           pdf_url)
  # Ordenar por año descendente (los más recientes primero).
  tabla_unica |>
    mutate(anio_num = suppressWarnings(as.integer(anio))) |>
    arrange(desc(anio_num)) |>
    select(-anio_num)
}

# ---------------------------------------------------------------------------
# 9. UNPAYWALL: ¿EL ARTÍCULO ES DE ACCESO ABIERTO? ¿DÓNDE ESTÁ SU PDF?
#    API gratuita, sin clave (pide un correo). Para cada DOI regresa si es
#    de acceso abierto y el enlace directo al PDF (url_for_pdf) cuando existe.
# ---------------------------------------------------------------------------

consultar_unpaywall <- function(doi, correo) {
  if (doi == "") return(list(es_oa = FALSE, url_pdf = ""))
  url <- paste0("https://api.unpaywall.org/v2/", URLencode(doi, reserved = TRUE),
                "?email=", URLencode(correo))
  resp <- get_con_reintento(url)
  if (is.null(resp)) return(list(es_oa = FALSE, url_pdf = ""))
  datos <- fromJSON(content(resp, "text", encoding = "UTF-8"),
                    simplifyVector = FALSE)
  url_pdf <- ""
  if (!is.null(datos$best_oa_location) &&
      !is.null(datos$best_oa_location$url_for_pdf)) {
    url_pdf <- datos$best_oa_location$url_for_pdf
  }
  if (url_pdf == "" && !is.null(datos$oa_locations)) {
    for (loc in datos$oa_locations) {
      if (!is.null(loc$url_for_pdf) && loc$url_for_pdf != "") {
        url_pdf <- loc$url_for_pdf
        break
      }
    }
  }
  list(es_oa = isTRUE(datos$is_oa), url_pdf = url_pdf)
}

# ---------------------------------------------------------------------------
# 10. DESCARGAR LOS PDFS LIBRES (MÁXIMO 120)
#     Se intentan las fuentes de PDF en este orden: Unpaywall (url_for_pdf),
#     arXiv, Semantic Scholar (openAccessPdf), OpenAlex, Europe PMC y CORE.
#     Solo se guarda el archivo si la respuesta es un PDF real
#     (Content-Type application/pdf y tamaño mayor que cero). Si un editor
#     bloquea la descarga (Wiley, MDPI y otros bloquean robots), se anota el
#     motivo y el script sigue con el siguiente artículo, sin fallar.
#     Límite: como máximo 120 PDFs (los más recientes primero). Si hay más
#     de 120 con PDF libre, los restantes quedan anotados como
#     "sin descargar (límite de 120 PDFs)".
# ---------------------------------------------------------------------------

descargar_pdfs <- function(tabla, carpeta = "pdfs", max_pdfs = 120,
                           correo = "") {
  dir.create(carpeta, showWarnings = FALSE, recursive = TRUE)
  tabla$es_oa <- FALSE
  tabla$url_pdf_libre <- ""
  tabla$pdf_descargado <- "no"
  tabla$archivo_pdf <- ""
  tabla$motivo_sin_pdf <- ""
  # 1. Consultar Unpaywall para cada DOI (una petición por artículo).
  for (i in seq_len(nrow(tabla))) {
    if (tabla$doi[i] == "") {
      tabla$motivo_sin_pdf[i] <- "sin DOI (no se puede verificar acceso abierto)"
      next
    }
    res <- consultar_unpaywall(tabla$doi[i], correo)
    tabla$es_oa[i] <- res$es_oa
    if (res$url_pdf != "") tabla$url_pdf_libre[i] <- res$url_pdf
    Sys.sleep(0.2)  # Pausa para no saturar la API de Unpaywall.
  }
  # 2. Completar el enlace al PDF con los que ya traen las fuentes.
  sin_url <- tabla$url_pdf_libre == "" & tabla$pdf_url != ""
  tabla$url_pdf_libre[sin_url] <- tabla$pdf_url[sin_url]
  # 3. Ordenar por año descendente y descargar hasta el límite.
  tabla <- tabla |> arrange(desc(suppressWarnings(as.integer(anio))))
  n_descargados <- 0
  for (i in seq_len(nrow(tabla))) {
    if (!tabla$es_oa[i] && tabla$url_pdf_libre[i] == "") {
      tabla$motivo_sin_pdf[i] <- "no es de acceso abierto (según Unpaywall)"
      next
    }
    if (tabla$url_pdf_libre[i] == "") {
      tabla$motivo_sin_pdf[i] <-
        "es de acceso abierto pero no se encontró enlace directo al PDF"
      next
    }
    if (n_descargados >= max_pdfs) {
      tabla$motivo_sin_pdf[i] <- paste0("sin descargar (límite de ",
                                         max_pdfs, " PDFs)")
      next
    }
    nombre_archivo <- paste0(gsub("/", "_", tabla$doi[i]), ".pdf")
    if (nombre_archivo == ".pdf") {
      nombre_archivo <- paste0("articulo_", i, ".pdf")
    }
    ruta <- file.path(carpeta, nombre_archivo)
    resultado <- tryCatch({
      GET(tabla$url_pdf_libre[i],
          user_agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36"),
          write_disk(ruta, overwrite = TRUE), timeout(120))
    }, error = function(e) NULL)
    if (is.null(resultado) || status_code(resultado) != 200) {
      tabla$motivo_sin_pdf[i] <- paste0(
        "la descarga falló (HTTP ",
        if (is.null(resultado)) "sin respuesta" else status_code(resultado),
        "; el editor puede bloquear descargas automáticas)"
      )
      if (file.exists(ruta)) file.remove(ruta)
      next
    }
    tipo <- headers(resultado)[["content-type"]] %||% ""
    tamano <- file.info(ruta)$size
    if (!grepl("application/pdf", tipo) || is.na(tamano) || tamano == 0) {
      tabla$motivo_sin_pdf[i] <-
        "el enlace no devolvió un PDF (página HTML o archivo vacío)"
      file.remove(ruta)
      next
    }
    tabla$pdf_descargado[i] <- "sí"
    tabla$archivo_pdf[i] <- nombre_archivo
    tabla$motivo_sin_pdf[i] <- ""
    n_descargados <- n_descargados + 1
    message("PDF descargado (", n_descargados, "/", max_pdfs, "): ",
            nombre_archivo)
    Sys.sleep(0.5)
  }
  message("PDFs descargados: ", n_descargados, " de ", max_pdfs,
          " como máximo.")
  tabla
}

# ---------------------------------------------------------------------------
# 11. REVISTAS CANDIDATAS EN SCIMAGO JOURNAL RANK
#     El archivo CSV se descarga a mano en
#     https://www.scimagojr.com/journalrank.php (botón Download, formato CSV)
#     porque el sitio bloquea las descargas automáticas (Cloudflare).
#     El script lee ese archivo, calcula el cuartil dentro de cada categoría
#     (Q1 = 25 % con SJR más alto de su categoría, y así sucesivamente) y
#     filtra por las áreas y los cuartiles que se pidan. Los valores de SJR,
#     cuartil e índice H se toman del archivo descargado.
# ---------------------------------------------------------------------------

buscar_revistas_scimago <- function(archivo, areas, cuartiles) {
  if (!file.exists(archivo)) {
    message("No se encontró el archivo de Scimago: ", archivo)
    message("Descárgalo a mano en https://www.scimagojr.com/journalrank.php ",
            "(botón Download, formato CSV) y guárdalo junto al script.")
    return(tibble())
  }
  datos <- read_csv(archivo, show_col_types = FALSE)
  # Normalizar los nombres de las columnas (minúsculas, sin puntos).
  names(datos) <- tolower(gsub("[. ]", "_", names(datos)))
  # Buscar las columnas por su nombre (varían un poco según el año).
  col_titulo <- names(datos)[grepl("^title$", names(datos))][1]
  col_sjr <- names(datos)[grepl("^sjr$", names(datos))][1]
  col_h <- names(datos)[grepl("^h_index$", names(datos))][1]
  col_editorial <- names(datos)[grepl("^publisher$", names(datos))][1]
  col_pais <- names(datos)[grepl("^country$", names(datos))][1]
  col_categorias <- names(datos)[grepl("categor", names(datos))][1]
  if (is.na(col_titulo) || is.na(col_sjr)) {
    stop("El archivo de Scimago no tiene las columnas esperadas ",
         "(Title, SJR). Revisa el archivo descargado.")
  }
  revistas <- datos |>
    transmute(
      revista = .data[[col_titulo]],
      sjr = as.numeric(.data[[col_sjr]]),
      h_index = if (!is.na(col_h)) as.integer(.data[[col_h]]) else NA_integer_,
      editorial = if (!is.na(col_editorial)) .data[[col_editorial]] else "",
      pais = if (!is.na(col_pais)) .data[[col_pais]] else "",
      categorias = if (!is.na(col_categorias)) .data[[col_categorias]] else ""
    ) |>
    filter(!is.na(sjr))
  # Cuartil dentro de cada categoría: se calcula sobre el archivo completo,
  # antes de filtrar, porque el cuartil depende de todas las revistas de la
  # categoría, no solo de las que nos interesan.
  revistas <- revistas |>
    filter(vapply(categorias, function(c) {
      any(vapply(areas, function(a) grepl(a, c, ignore.case = TRUE),
                 logical(1)))
    }, logical(1)))
  # Para el cuartil se usa la primera categoría del área pedida que tenga.
  revistas$cuartil <- NA_character_
  for (area in areas) {
    en_area <- grepl(area, revistas$categorias, ignore.case = TRUE)
    if (sum(en_area) == 0) next
    sjr_area <- revistas$sjr[en_area]
    cortes <- quantile(sjr_area, probs = c(0.75, 0.5, 0.25), na.rm = TRUE)
    cuartil_area <- ifelse(sjr_area >= cortes[1], "Q1",
                           ifelse(sjr_area >= cortes[2], "Q2",
                                  ifelse(sjr_area >= cortes[3], "Q3", "Q4")))
    revistas$cuartil[en_area & is.na(revistas$cuartil)] <-
      cuartil_area[is.na(revistas$cuartil[en_area])]
  }
  revistas |>
    filter(cuartil %in% cuartiles) |>
    mutate(
      enlace_springer = paste0(
        "https://link.springer.com/search?query=",
        URLencode(revista)
      )
    ) |>
    arrange(desc(sjr)) |>
    select(revista, sjr, cuartil, h_index, editorial, pais,
           categorias, enlace_springer)
}

# ---------------------------------------------------------------------------
# 12. REVISTAS DE SPRINGER
#     La página de listado (link.springer.com/journals) pide cookies y no se
#     puede leer desde R. Hay dos vías:
#       a) Con clave gratuita de la API de Springer Nature
#          (registro en https://dev.springernature.com/): el script busca
#          revistas por tema y regresa título, editorial e ISSN.
#       b) Sin clave: el script toma las revistas sugeridas de Scimago cuya
#          editorial es Springer y les añade el enlace de búsqueda de
#          Springer, para revisarlas a mano.
# ---------------------------------------------------------------------------

buscar_revistas_springer <- function(tema, clave = "", revistas_sugeridas = NULL) {
  if (clave != "") {
    message("Buscando revistas de Springer con la API de Springer Nature.")
    url <- paste0(
      "https://api.springernature.com/meta/v2/json?q=",
      URLencode(paste0("subject:", tema)),
      "&api_key=", clave, "&p=10"
    )
    resp <- get_con_reintento(url)
    if (!is.null(resp)) {
      datos <- fromJSON(content(resp, "text", encoding = "UTF-8"),
                        simplifyVector = FALSE)
      registros <- datos$records
      if (length(registros) > 0) {
        filas <- lapply(registros, function(r) {
          tibble(
            revista = r$publicationName %||% "",
            editorial = r$publisher %||% "",
            issn = r$issn %||% "",
            enlace_springer = r$url[[1]]$value %||% ""
          )
        })
        return(bind_rows(filas))
      }
    }
    message("La API de Springer no devolvió resultados; se usa la vía manual.")
  }
  # Vía sin clave: revistas de Springer entre las sugeridas de Scimago.
  if (is.null(revistas_sugeridas) || nrow(revistas_sugeridas) == 0) {
    message("Sin clave de Springer y sin revistas de Scimago: revisa las ",
            "revistas a mano en https://link.springer.com/journals")
    return(tibble())
  }
  revistas_sugeridas |>
    filter(grepl("Springer", editorial, ignore.case = TRUE)) |>
    transmute(
      revista = revista,
      editorial = editorial,
      issn = "",
      enlace_springer = enlace_springer
    )
}

# ---------------------------------------------------------------------------
# EJECUCIÓN PRINCIPAL
# ---------------------------------------------------------------------------

message("=== 1. Buscando artículos en todos los repositorios ===")
resultados <- list(
  buscar_pubmed(tema, max_por_fuente, correo),
  buscar_europe_pmc(tema, max_por_fuente),
  buscar_semantic_scholar(tema, max_por_fuente, clave_semantic_scholar),
  buscar_openalex(tema, max_por_fuente, clave_openalex),
  buscar_crossref(tema, max_por_fuente, correo),
  buscar_arxiv(tema, max_por_fuente),
  buscar_core(tema, max_por_fuente)
)
for (i in seq_along(resultados)) {
  message("  Fuente ", i, ": ", nrow(resultados[[i]]), " resultados.")
}

message("=== 2. Juntando resultados y eliminando duplicados por DOI ===")
tabla_articulos <- unir_y_dedup(resultados)
message("Artículos únicos tras deduplicar: ", nrow(tabla_articulos))

message("=== 3. Descargando los PDFs libres (máximo ", max_pdfs, ") ===")
tabla_articulos <- descargar_pdfs(tabla_articulos, carpeta_pdfs, max_pdfs,
                                  correo)

# Guardar la tabla final.
tabla_articulos <- tabla_articulos |>
  select(doi, titulo, anio, revista, autores, abstract, fuente, pmid,
         es_oa, url_pdf_libre, pdf_descargado, archivo_pdf, motivo_sin_pdf)
# Renombrar las columnas a nombres claros en español para el CSV.
names(tabla_articulos) <- c("doi", "titulo", "anio", "revista", "autores",
                            "abstract", "fuente", "pmid",
                            "tiene_pdf_libre", "url_pdf_libre",
                            "pdf_descargado", "archivo_pdf",
                            "motivo_sin_pdf")
write_csv(tabla_articulos, "tabla_articulos.csv")
message("Tabla guardada: tabla_articulos.csv (", nrow(tabla_articulos),
        " artículos).")

message("=== 4. Ideas de revistas en Scimago ===")
revistas_sugeridas <- buscar_revistas_scimago(archivo_scimago,
                                              areas_scimago,
                                              cuartiles_aceptados)
if (nrow(revistas_sugeridas) > 0) {
  write_csv(revistas_sugeridas, "revistas_sugeridas.csv")
  message("Revistas sugeridas guardadas: revistas_sugeridas.csv (",
          nrow(revistas_sugeridas), " revistas).")
} else {
  message("Sin revistas de Scimago (falta el archivo CSV descargado a mano).")
}

message("=== 5. Revistas de Springer ===")
revistas_springer <- buscar_revistas_springer(tema, clave_springer,
                                              revistas_sugeridas)
if (nrow(revistas_springer) > 0) {
  write_csv(revistas_springer, "revistas_springer.csv")
  message("Revistas de Springer guardadas: revistas_springer.csv (",
          nrow(revistas_springer), " revistas).")
}

# ---------------------------------------------------------------------------
# GRÁFICO: artículos encontrados por año
# ---------------------------------------------------------------------------

grafico_anio <- tabla_articulos |>
  filter(anio != "") |>
  count(anio, name = "n_articulos") |>
  ggplot(aes(x = anio, y = n_articulos)) +
  geom_col(fill = "#2E86AB") +
  geom_text(aes(label = n_articulos), vjust = -0.5) +
  labs(
    title = "Artículos encontrados por año",
    subtitle = paste("Tema:", tema),
    x = "Año de publicación",
    y = "Número de artículos (conteo)"
  ) +
  theme_minimal()

ggsave("articulos_por_anio.png", plot = grafico_anio,
       width = 20, height = 13, units = "cm", dpi = 300)

# Interpretación:
# - Eje X: año de publicación. No es una cantidad, son años (categorías).
# - Eje Y: número de artículos encontrados en ese año. Es un conteo, por lo
#   que no tiene unidades (adimensional).
# - Lo que se aprecia: cada barra es un año y su altura es cuántos artículos
#   de la búsqueda se publicaron ese año. Las barras más altas son los años
#   con más publicaciones sobre el tema.
# - Qué significa: el gráfico muestra en qué años se concentró la
#   investigación sobre el tema. Si las barras recientes son más altas, el
#   tema está activo; si las antiguas son más altas, el tema tuvo su auge
#   antes y conviene buscar qué cambió desde entonces.

# ---------------------------------------------------------------------------
# QUÉ APRENDIMOS
# ---------------------------------------------------------------------------
# - Un mismo artículo aparece en varias bases de datos: al juntarlas hay que
#   eliminar duplicados por DOI, porque el DOI es el identificador único del
#   artículo. Los registros sin DOI (muchos preprints de arXiv) se comparan
#   por el título.
# - Ninguna base de datos lo tiene todo: PubMed cubre biomedicina, Europe
#   PMC añade texto completo y preprints, Crossref tiene casi cualquier
#   artículo con DOI (pero casi nunca trae el resumen), OpenAlex y Semantic
#   Scholar cubren todas las áreas, arXiv trae preprints y CORE trae
#   repositorios de acceso abierto.
# - No todos los PDFs libres se pueden descargar automáticamente: algunos
#   editores bloquean las descargas de robots (Wiley y MDPI devolvieron
#   error en la verificación). Por eso el script anota el motivo cuando no
#   puede descargar un PDF, en lugar de fallar.
# - El cuartil de una revista se calcula dentro de su categoría (Q1 = el
#   25 % con SJR más alto de esa categoría). Por eso el script calcula el
#   cuartil sobre el archivo completo de Scimago antes de filtrar por área.
# - La página de listado de Springer pide cookies y no se puede leer desde
#   R: para Springer se usa su API (con clave gratuita) o el enlace de
#   búsqueda para revisar cada revista a mano.
