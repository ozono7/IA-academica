# Autor: Dr. José Juan Torres Martínez
# Docente de Ciencias Químicas
# Universidad Autónoma de San Luis Potosí (UASLP)
# México
#
# Material académico para estudiantes

# 11 — Búsqueda automática de artículos, ideas de revistas y descarga de PDFs

> Script: [11-busqueda-automatica-articulos.R](11-busqueda-automatica-articulos.R)
> Archivos de ejemplo generados: [tabla_articulos.csv](tabla_articulos.csv), [revistas_sugeridas.csv](revistas_sugeridas.csv)

## 1. ¿Qué problema resuelve?

Buscar artículos a mano en cada base de datos, copiar título, año, revista, autores, resumen y DOI uno por uno, y luego descargar los PDFs libres de uno en uno, toma horas y deja duplicados: el mismo artículo aparece en PubMed, en Europe PMC, en Crossref y en Semantic Scholar, y es fácil guardarlo dos veces o perder el DOI. Además, elegir dónde enviar el manuscrito exige comparar revistas por área y cuartil, y eso obliga a entrar a Scimago y a Springer por separado.

Esta herramienta automatiza todo ese trabajo desde R: escribe el tema una sola vez y el script busca en siete repositorios a la vez, junta los resultados, elimina duplicados por DOI, anota en qué fuente se encontró cada artículo, busca revistas candidatas por área y cuartil en Scimago y en Springer, y descarga los PDFs libres a una carpeta, con un límite de 120 PDFs.

En las áreas de trabajo de este material sirve para:

- Armar la revisión de literatura de un tema (por ejemplo, *Chlorella vulgaris* bajo luz azul y acumulación de lípidos) con una sola corrida del script, en lugar de buscar a mano en cada base de datos.
- Obtener la ficha completa de cada artículo (título, año, revista, autores, resumen, DOI y PMID) en una tabla CSV lista para revisar, filtrar y pasar a Zotero.
- Descargar los PDFs de acceso abierto a una carpeta, para leerlos después o subirlos a Elicit o a NotebookLM.
- Generar ideas de revistas para enviar un manuscrito (por área y cuartil, con SJR, índice H, editorial y país) y revisar si están en Springer.

## 2. ¿Qué hace?

El script `11-busqueda-automatica-articulos.R` hace cuatro cosas, en orden:

### 2.1. Busca el tema en siete repositorios

| Fuente | Qué devuelve | Clave |
|---|---|---|
| PubMed (NCBI E-utilities) | Título, año, revista, autores, resumen, DOI, PMID | No |
| Europe PMC (EMBL-EBI) | Título, año, revista, autores, resumen, DOI, PMID | No |
| Semantic Scholar | Título, año, revista, autores, resumen, DOI, PDF libre | No (opcional, para más peticiones) |
| OpenAlex | Título, año, revista, autores, resumen, DOI | No (opcional, para más peticiones) |
| Crossref | Título, año, revista, autores, DOI (casi nunca trae resumen) | No |
| arXiv | Título, año, autores, resumen, PDF directo (muchos sin DOI) | No |
| CORE | Título, año, autores, DOI (cuando lo tiene), PDF | No |

Ninguna base de datos lo tiene todo: PubMed cubre biomedicina, Europe PMC añade texto completo y preprints, Crossref tiene casi cualquier artículo con DOI (pero casi nunca trae el resumen), OpenAlex y Semantic Scholar cubren todas las áreas, arXiv trae preprints y CORE trae repositorios de acceso abierto. Por eso se busca en todas y se juntan los resultados.

### 2.2. Junta los resultados y elimina duplicados por DOI

Un mismo artículo aparece en varias fuentes. El script lo junta en un solo renglón y anota en qué fuentes se encontró (por ejemplo, "PubMed; Europe PMC"). La clave es el DOI normalizado (minúsculas, sin prefijo). Los registros sin DOI (muchos preprints de arXiv) se comparan por el título. Los campos vacíos se completan con los de otra fuente cuando la tiene: por ejemplo, el resumen que Crossref no trae se toma de PubMed o de Europe PMC.

### 2.3. Busca ideas de revistas en Scimago y en Springer

- **Scimago Journal Rank** (https://www.scimagojr.com/journalrank.php): el script lee el archivo CSV del ranking (descargado a mano, ver el paso 2 de la sección 3) y filtra por las áreas y los cuartiles que se pidan. Regresa revista, SJR, cuartil, índice H, editorial, país y enlace de búsqueda en Springer. El cuartil se calcula dentro de cada categoría (Q1 = el 25 % con SJR más alto de esa categoría), sobre el archivo completo, antes de filtrar.
- **Springer** (https://link.springer.com/journals): la página de listado pide cookies y no se puede leer desde R. Hay dos vías: con clave gratuita de la API de Springer Nature (registro en https://dev.springernature.com/), el script busca revistas por tema; sin clave, toma las revistas sugeridas de Scimago cuya editorial es Springer y les añade el enlace de búsqueda para revisarlas a mano.

### 2.4. Descarga los PDFs libres (máximo 120)

Para cada artículo con DOI, el script consulta Unpaywall (API gratuita, sin clave) para saber si es de acceso abierto y obtener el enlace directo al PDF. Después descarga los PDFs a la carpeta `pdfs/`, en este orden de intento: Unpaywall, arXiv, Semantic Scholar, OpenAlex, Europe PMC y CORE. Solo guarda el archivo si la respuesta es un PDF real (Content-Type `application/pdf` y tamaño mayor que cero).

**Límite de 120 PDFs:** como máximo se descargan 120 PDFs, los más recientes primero (ordenados por año descendente). Si hay más de 120 artículos con PDF libre, los restantes quedan anotados en la tabla como "sin descargar (límite de 120 PDFs)". Los artículos sin PDF libre también quedan anotados, con el motivo (por ejemplo, "no es de acceso abierto" o "el editor bloquea descargas automáticas").

## 3. Paso a paso para usarla

### Paso 1. Instalar R y los paquetes

1. Abre R o RStudio (o Positron) en tu computadora.
2. Instala los paquetes una sola vez con:

   ```r
   install.packages(c("httr", "jsonlite", "dplyr", "readr", "ggplot2",
                      "xml2"))
   ```

### Paso 2. Descargar el ranking de Scimago (una sola vez, a mano)

1. Entra a https://www.scimagojr.com/journalrank.php en el navegador.
2. Haz clic en el botón **Download** y descarga el archivo en formato CSV.
3. Guarda el archivo con el nombre `scimago_journalrank.csv` en la misma carpeta donde está el script `11-busqueda-automatica-articulos.R`.
4. La descarga directa desde R no funciona porque el sitio bloquea robots (Cloudflare devuelve error 403). Por eso se descarga a mano una sola vez; el archivo sirve para muchas búsquedas.

### Paso 3. Editar la configuración del script

Abre el script y edita la sección CONFIGURACIÓN:

- `tema`: el tema de búsqueda, en inglés (por ejemplo, `"Chlorella vulgaris blue light lipid accumulation"`).
- `correo`: tu correo (lo piden Unpaywall y las APIs de NCBI para identificar el uso).
- `max_por_fuente`: cuántos resultados pedir a cada fuente (10 para probar; 50 o 100 para una revisión amplia).
- `max_pdfs`: el límite de PDFs a descargar (120 como máximo).
- `areas_scimago`: las áreas para filtrar las revistas (por ejemplo, `"Biotechnology"`, `"Plant Science"`, `"Environmental Science"`).
- `cuartiles_aceptados`: los cuartiles aceptados (por ejemplo, `c("Q1", "Q2")`).
- Claves gratuitas (opcionales, dejar en `""` si no se tienen): Semantic Scholar, OpenAlex y Springer Nature. Sin clave el script funciona, pero Semantic Scholar y OpenAlex tienen límite de peticiones por IP y pueden devolver error 429; con clave gratuita el límite es mayor.

### Paso 4. Correr el script

1. Corre el script completo en R (botón Source en RStudio, o `source("11-busqueda-automatica-articulos.R")`).
2. El script tarda varios minutos porque consulta muchas APIs con pausas entre llamadas. En la consola verás el avance: cuántos resultados dio cada fuente, cuántos artículos únicos quedaron tras deduplicar y cuántos PDFs se descargaron.
3. Si una fuente devuelve error 429 (Too Many Requests), el script espera 60 segundos y reintenta una vez; si sigue fallando, avisa y sigue con las demás fuentes, sin detener la búsqueda.

### Paso 5. Revisar los archivos generados

En la misma carpeta del script encontrarás:

| Archivo | Qué contiene |
|---|---|
| `tabla_articulos.csv` | Un renglón por artículo único: DOI, título, año, revista, autores, resumen, fuente, PMID, si tiene PDF libre, si se descargó y el motivo cuando no se descargó. |
| `revistas_sugeridas.csv` | Revistas candidatas por área y cuartil: revista, SJR, cuartil, índice H, editorial, país y enlace a Springer. |
| `revistas_springer.csv` | Revistas de Springer entre las sugeridas (o las de la API de Springer Nature si hay clave). |
| `pdfs/` | Los PDFs descargados (máximo 120). Esta carpeta es local y no se sube a GitHub. |
| `articulos_por_anio.png` | Gráfico de barras con los artículos encontrados por año. |

### Paso 6. Pasar los resultados a las demás herramientas

- **Zotero (guía 06):** importa `tabla_articulos.csv` o los PDFs de `pdfs/` a la colección del proyecto, y verifica cada referencia con su DOI antes de citarla en Word.
- **Elicit (guía 03):** sube los PDFs descargados y arma la tabla comparativa (especie, luz, lípidos, método, resultado).
- **Connected Papers (guía 04):** usa el DOI de un artículo clave de la tabla como semilla para mapear la literatura.
- **NotebookLM (guía 09):** sube los PDFs para el resumen y la guía de estudio.

## 4. Ejemplo trabajado

Tema del ejemplo: *Chlorella vulgaris* bajo luz azul y acumulación de lípidos (el tema del artículo de RNA-seq). Los archivos de ejemplo de este repositorio se generaron el 2026-11-09 con `max_por_fuente = 10`:

- **Búsqueda:** PubMed devolvió 3 artículos; Europe PMC, 1179 resultados (se tomaron 10); Crossref, más de 1.4 millones (se tomaron 10); arXiv, 5 preprints. Semantic Scholar, OpenAlex y CORE devolvieron error 429 en ese momento (límite compartido por IP), así que el script habría esperado y reintentado, y seguido con las demás fuentes.
- **Tras deduplicar por DOI:** 27 artículos únicos. El primero es de 2026 en *Bioresource Technology* (encontrado en PubMed y en Europe PMC a la vez). La tabla indica en qué fuente se encontró cada artículo.
- **PDFs libres:** 12 de los 27 son de acceso abierto según Unpaywall; 5 tenían enlace directo al PDF. Se descargaron 2 PDFs como prueba de la cadena (uno de Nature Portfolio y uno de Frontiers); los demás enlaces fallaron porque Wiley cerró la conexión y MDPI bloquea descargas automáticas (error 403). Esos casos quedaron anotados en la tabla con su motivo.
- **Revistas sugeridas:** 4 revistas Q1 con datos reales de Scimago (marzo 2026): Plant Biotechnology Journal (SJR 3.382, H 176), Bioresource Technology (SJR 1.983, H 404), Metabolic Engineering (SJR 1.842, H 165) y Chemosphere (SJR 1.648, H 353).

Segundo ejemplo corto: para biorremediación de aguas residuales con microalgas, cambia el tema en la configuración por `"microalgae wastewater bioremediation nutrient removal"` y corre el script de nuevo: la tabla y las revistas se regeneran para ese tema.

## 5. Consejos y limitaciones

- **La búsqueda va en inglés.** La literatura científica sobre microalgas y biorremediación está publicada en inglés; una búsqueda en español devuelve muy pocos resultados.
- **Los resúmenes de Crossref casi nunca vienen.** Crossref no trae el resumen de la mayoría de los artículos; el script lo completa con el de PubMed, Europe PMC o Semantic Scholar cuando el mismo artículo aparece ahí. Si un artículo solo aparece en Crossref, su resumen quedará vacío en la tabla: ábrelo por su DOI para leerlo.
- **Semantic Scholar, OpenAlex y CORE pueden devolver 429.** El límite es compartido por la IP de la red. Si te pasa con frecuencia, pide las claves gratuitas (Semantic Scholar y OpenAlex las dan gratis con el correo) y ponlas en la configuración. El script sigue funcionando sin ellas: avisa y continúa con las demás fuentes.
- **No todos los PDFs libres se descargan.** Algunos editores bloquean las descargas automáticas (Wiley cerró la conexión y MDPI devolvió 403 en la verificación del 2026-11-09). Esos artículos quedan anotados con su motivo; descárgalos a mano desde la página de la editorial o desde Europe PMC.
- **Europe PMC no sirve para descargar el PDF directamente.** El enlace `?pdf=render` devuelve 403 para robots y la descarga directa de PMC devuelve una página HTML, no el PDF. Por eso el script usa Unpaywall, arXiv, Semantic Scholar, OpenAlex y CORE para los PDFs, y Europe PMC solo para buscar y leer el resumen.
- **Scimago se descarga a mano.** El sitio bloquea robots (Cloudflare, error 403), así que el archivo CSV se descarga una vez desde el navegador y el script lo lee de forma local. El archivo sirve para muchas búsquedas; descárgalo de nuevo cuando quieras datos actualizados.
- **Springer necesita clave o revisión manual.** La página de listado de Springer pide cookies y no se puede leer desde R; la API de Springer Nature pide clave gratuita. Sin clave, el script genera el enlace de búsqueda de cada revista para revisarla a mano.
- **El artículo de Torres-Martínez (2025) no está indizado en PubMed.** La búsqueda por su DOI (10.1007/s10811-024-03426-4) en PubMed devuelve resultados no relacionados (verificado el 2026-11-09). Para localizarlo y ver sus citas, usa Semantic Scholar (guía 01) o Crossref.
- **Respeta los límites de las APIs.** El script hace pausas entre llamadas (1 segundo en PubMed, 0.2 en Unpaywall, 0.5 entre descargas). No quites las pausas: las APIs bloquean temporalmente a quien las satura.

## 6. Costo

Todas las APIs que usa el script son gratuitas: PubMed (E-utilities), Europe PMC, Semantic Scholar, OpenAlex, Crossref, arXiv, CORE y Unpaywall no cobran. Semantic Scholar, OpenAlex y Springer Nature dan claves gratuitas para subir el límite de peticiones. Scimago Journal Rank es gratuito para consultar y descargar el ranking. No hay que pagar nada para usar esta herramienta.

## 7. Qué aprendimos

- Un mismo artículo aparece en varias bases de datos: al juntarlas hay que eliminar duplicados por DOI, porque el DOI es el identificador único del artículo. Los registros sin DOI (muchos preprints de arXiv) se comparan por el título.
- Ninguna base de datos lo tiene todo: PubMed cubre biomedicina, Europe PMC añade texto completo y preprints, Crossref tiene casi cualquier artículo con DOI (pero casi nunca trae el resumen), OpenAlex y Semantic Scholar cubren todas las áreas, arXiv trae preprints y CORE trae repositorios de acceso abierto.
- No todos los PDFs libres se pueden descargar automáticamente: algunos editores bloquean las descargas de robots. Por eso el script anota el motivo cuando no puede descargar un PDF, en lugar de fallar.
- El cuartil de una revista se calcula dentro de su categoría (Q1 = el 25 % con SJR más alto de esa categoría). Por eso el script calcula el cuartil sobre el archivo completo de Scimago antes de filtrar por área.
- La página de listado de Springer pide cookies y no se puede leer desde R: para Springer se usa su API (con clave gratuita) o el enlace de búsqueda para revisar cada revista a mano.
- Esta herramienta extiende el Módulo 01 de la serie RNA-seq (repositorio https://github.com/ozono7/RNA-seq, archivo `01-busqueda-pubmed-genbank-uniprot.R`), que ya buscaba en PubMed desde R con la API E-utilities: aquí la idea se amplía a siete repositorios, con revistas y descarga de PDFs.

## 8. Enlaces y relación con otras herramientas del repo

- PubMed (NCBI E-utilities): https://pubmed.ncbi.nlm.nih.gov/ — documentación de la API: https://www.ncbi.nlm.nih.gov/books/NBK25497/
- Europe PMC: https://europepmc.org/ — API REST: https://www.ebi.ac.uk/europepmc/webservices/rest/search
- Semantic Scholar API: https://api.semanticscholar.org/ — clave gratuita: https://www.semanticscholar.org/product/api#api-key-form
- OpenAlex API: https://api.openalex.org/ — clave gratuita: https://api.openalex.org/api-keys
- Crossref API: https://api.crossref.org/
- arXiv API: https://export.arxiv.org/api/query
- CORE API: https://api.core.ac.uk/
- Unpaywall API: https://api.unpaywall.org/
- Scimago Journal Rank: https://www.scimagojr.com/journalrank.php
- Springer: https://link.springer.com/journals — API de Springer Nature (clave gratuita): https://dev.springernature.com/
- Relación con el repo: esta herramienta es el paso 1 del flujo completo ([10-flujo-de-trabajo.md](10-flujo-de-trabajo.md)). Sus resultados (la tabla y los PDFs) alimentan Zotero (guía 06), Elicit (guía 03), Connected Papers (guía 04) y NotebookLM (guía 09).
