# Autor: Dr. José Juan Torres Martínez
# Docente de Ciencias Químicas
# Universidad Autónoma de San Luis Potosí (UASLP)
# México
#
# Material académico para estudiantes

# 11 — PubMed: buscar artículos por tema (título, año, revista, autores, resumen, DOI)

> Enlace oficial: <https://pubmed.ncbi.nlm.nih.gov/>
> Alternativa: Europe PMC: <https://europepmc.org/>

## 1. ¿Qué problema resuelve?

Cuando necesitas artículos sobre un tema concreto para la introducción de un manuscrito o para una revisión de literatura, los buscadores generales devuelven páginas sin arbitraje y las listas de referencias de un solo artículo no muestran todo lo publicado. PubMed resuelve eso: es la base de datos bibliográfica de la Biblioteca Nacional de Medicina de Estados Unidos (NLM), con más de 35 millones de citas de literatura biomédica y de ciencias de la vida. Cada registro trae lo que se necesita para citar y para decidir si vale la pena leer el artículo: título, año, revista, autores, resumen (abstract), DOI y PMID (el identificador de PubMed).

En las áreas de trabajo de este material sirve para:

- Buscar artículos sobre *Chlorella vulgaris* y *Scenedesmus acutus* bajo luz azul y luz roja: crecimiento, acumulación de lípidos y respuestas a nivel de transcriptoma (RNA-seq).
- Buscar trabajos sobre biorremediación de aguas residuales con microalgas, por ejemplo remoción de nutrientes (nitrógeno y fósforo).
- Buscar literatura sobre el ensamblaje de novo del genoma de *Chlorella vulgaris* y su anotación funcional.
- Encontrar revisiones recientes para el estado del arte de los artículos en curso, y filtrar solo por texto completo gratuito.
- Obtener la referencia completa de un artículo (título, año, revista, autores, resumen y DOI) para guardarla en Zotero y citarla en Word.

## 2. ¿Qué hace?

PubMed es una base de datos gratuita de la National Library of Medicine (NLM) de Estados Unidos. Da acceso gratuito a MEDLINE y a literatura de ciencias de la vida: medicina, enfermería, odontología, veterinaria, sistemas de salud y ciencias preclínicas, además de biología y biotecnología. No es un buscador de texto completo: busca en los registros de los artículos (cita, resumen, descriptores y otros campos), no dentro del PDF completo.

Sus funciones principales son:

- **Búsqueda por tema en lenguaje normal.** Escribes el tema en inglés y PubMed traduce tus palabras a términos MeSH (Medical Subject Headings, los descriptores controlados de la NLM) mediante el mapeo automático de términos. Así encuentra artículos aunque usen sinónimos distintos a los que escribiste.
- **MeSH (Medical Subject Headings).** El vocabulario controlado con el que la NLM indiza los artículos. Buscar por un término MeSH (por ejemplo `"Chlorella vulgaris"[MeSH]`) recupera todos los artículos indizados bajo ese concepto, incluidos los términos más específicos que cuelgan de él. El MeSH Browser (<https://meshb.nlm.nih.gov/search>) sirve para encontrar el término correcto antes de buscar.
- **Ficha completa de cada artículo.** Cada resultado muestra título, autores, revista, año, volumen y páginas, resumen (cuando el artículo lo tiene), DOI y PMID. Al abrir la ficha se ven también los términos MeSH asignados, el tipo de publicación y los enlaces al texto completo cuando existe.
- **Filtros en la columna izquierda.** Año de publicación, tipo de artículo (revisión, ensayo clínico, etc.), disponibilidad de texto (texto completo gratuito), idioma, especie y otros. Los filtros solo aparecen cuando son válidos para los resultados de tu búsqueda.
- **Búsqueda avanzada (Advanced Search).** Un constructor en <https://pubmed.ncbi.nlm.nih.gov/advanced/> para combinar campos con los operadores booleanos AND, OR y NOT (en mayúsculas), limitar la búsqueda a un campo concreto (título, resumen, autor, MeSH, fecha) y ver cómo PubMed traduce tu búsqueda (cuadro de traducción de la consulta).
- **Guardar y exportar.** Con **Send to** se pueden enviar los resultados a un gestor de citas (formato .nbib, compatible con Zotero, Mendeley y EndNote), guardarlos como archivo, copiarlos al portapapeles temporal (Clipboard) o enviarlos por correo. También se puede crear una bibliografía (My Bibliography) con una cuenta gratuita de NCBI.
- **Alertas y colecciones.** Con una cuenta gratuita de NCBI (My NCBI) se guardan búsquedas y colecciones, y se reciben alertas por correo cuando se publique algo nuevo sobre el tema.
- **API gratuita (E-utilities).** Para quien programa, la API de NCBI permite hacer estas mismas búsquedas desde R o Python y descargar los resultados en formato JSON. El Módulo 01 de la serie RNA-seq (repositorio <https://github.com/ozono7/RNA-seq>, archivo `01-busqueda-pubmed-genbank-uniprot.R`) ya usa PubMed desde R con el paquete `rentrez` y la API E-utilities (esummary en JSON) para buscar literatura sobre *Chlorella* y lípidos de forma programática.

**Europe PMC** (<https://europepmc.org/>) es la alternativa mantenida por el EMBL-EBI (European Bioinformatics Institute). Incluye todos los resúmenes de PubMed/MEDLINE, el texto completo de PubMed Central (PMC), preprints, patentes y registros de Agricola: más de 40 millones de registros. Busca tanto en los resúmenes como en el texto completo cuando está disponible, y también devuelve título, año, revista, autores, resumen y DOI. Es gratuita, sin registro ni clave. Sirve cuando PubMed no devuelve un artículo (porque busca también en texto completo y en preprints) o cuando se quiere el texto completo de acceso abierto.

## 3. Paso a paso para usarla

### Paso 1. Entrar al sitio

1. Abre el navegador y ve a <https://pubmed.ncbi.nlm.nih.gov/>.
2. No necesitas crear cuenta para buscar y leer. Para guardar colecciones y recibir alertas, crea una cuenta gratuita de NCBI (My NCBI) desde el enlace de la parte superior de la página.

### Paso 2. Escribir la búsqueda en lenguaje normal

1. En la barra de búsqueda de la página principal, escribe el tema en inglés. La literatura científica sobre microalgas y biorremediación está publicada en inglés, así que una búsqueda en español devuelve muy pocos resultados.
2. Escribe solo las palabras clave, sin puntuación ni operadores al principio. PubMed combina los términos con AND de forma automática y los traduce a términos MeSH.
3. Pulsa **Enter** o haz clic en **Search**.
4. Los resultados aparecen de 10 en 10, ordenados por Best Match (mejor coincidencia). En cada resultado verás el título, los autores, la revista, el año y el DOI.

### Paso 3. Leer la ficha de un artículo

1. Haz clic en el título de un resultado.
2. En la página del artículo verás, en orden: el título, los autores con sus afiliaciones, la revista, el año, el volumen y las páginas, el resumen (Abstract) y el DOI. El PMID aparece en la ficha y en la dirección de la página.
3. Si el artículo dice **Free PMC article**, haz clic para leer el texto completo gratuito en PubMed Central. Si no, el enlace **Full text links** te lleva a la página de la editorial.
4. Baja hasta la sección de términos MeSH para ver con qué descriptores está indizado el artículo: esos términos son los que debes usar si quieres buscar más artículos sobre el mismo concepto.
5. Usa los enlaces **Cited by** (citado por) y **Similar articles** (artículos similares) para ampliar la búsqueda a partir de un buen artículo.

### Paso 4. Afinar con los filtros

En la columna izquierda de la página de resultados encontrarás los filtros. Úsalos así:

- **Publication dates (fechas de publicación).** Escribe el año inicial y final, por ejemplo de 2020 a 2026, para ver solo lo reciente. Es útil para el estado del arte de un artículo en preparación.
- **Article Types (tipo de artículo).** Elige *Review* para revisiones que resumen un tema completo, o *Journal Article* para artículos de revista.
- **Text availability (disponibilidad de texto).** Activa **Free full text** para ver solo artículos con texto completo gratuito. Así evitas abrir artículos cuyo PDF está detrás de un muro de pago.
- **Languages (idioma).** Limita a inglés cuando los resultados mezclen otros idiomas.
- **Species (especie).** Este filtro distingue estudios en humanos y en animales; para microalgas no es útil, así que no lo uses en estos temas.
- **Sort by (ordenar por).** Cambia de *Best Match* a *Most Recent* para ver lo más nuevo, o a *Publication Date* para ordenar por fecha.

Para quitar los filtros, haz clic en **Clear all** o en el enlace de limpiar junto a cada categoría.

### Paso 5. Búsqueda avanzada con AND, OR, NOT y campos

1. Ve a **Advanced** (<https://pubmed.ncbi.nlm.nih.gov/advanced/>) o haz clic en **Advanced** debajo de la barra de búsqueda.
2. El constructor te deja añadir bloques: elige el campo (por ejemplo *Title/Abstract* para buscar solo en título y resumen, *MeSH Terms* para un descriptor, *Author* para un autor, *Journal* para una revista) y escribe el término.
3. Une los bloques con los operadores booleanos en mayúsculas: **AND** (los dos conceptos deben aparecer), **OR** (cualquiera de los dos) y **NOT** (excluye un concepto). Se procesan de izquierda a derecha.
4. Debajo del constructor aparece el cuadro de traducción de la consulta: ahí ves la búsqueda exacta que PubMed va a ejecutar, con los términos MeSH a los que tradujo tus palabras. Revísala antes de pulsar **Search**: si un término se tradujo mal, corrígelo ahí.
5. Etiquetas de campo útiles para escribir la búsqueda directamente en la barra:
   - `[ti]` título, `[ab]` resumen, `[au]` autor, `[mh]` término MeSH, `[majr]` tema principal MeSH, `[pt]` tipo de publicación, `[dp]` fecha de publicación, `[pmid]` PMID, `[doi]` DOI.
   - Ejemplos: `"Chlorella vulgaris"[mh]`, `lipid accumulation[tiab]`, `2020:2026[dp]`, `review[pt]`.
6. Usa comillas para frases exactas (`"lipid accumulation"`) y el asterisco `*` para variantes de una palabra (`bacter*` recupera *bacteria*, *bacterium*, *bacteriophage*).

### Paso 6. Guardar los resultados y pasarlos a Zotero

1. Marca con la casilla los artículos que te interesan (o no marques ninguno para tomar todos los de la página).
2. Haz clic en **Send to** y elige **Citation Manager**. Se descarga un archivo `.nbib` con las referencias completas.
3. En Zotero, usa **Archivo → Importar** y elige el archivo `.nbib` descargado (o arrástralo a la colección del proyecto). Las referencias quedan guardadas con título, año, revista, autores, resumen y DOI. El procedimiento completo está en la guía [06-zotero.md](06-zotero.md) de este repositorio.
4. Otras opciones de **Send to**: **File** (guardar como archivo en tu computadora), **Clipboard** (portapapeles temporal de la sesión, para juntar artículos de varias búsquedas antes de exportar), **E-mail** (enviar los resultados a un correo) y **My Bibliography** (guardar en tu bibliografía con cuenta NCBI).

### Paso 7. Repetir la búsqueda en Europe PMC cuando haga falta

1. Ve a <https://europepmc.org/> y escribe la misma búsqueda en inglés.
2. Europe PMC busca también en el texto completo de los artículos de acceso abierto, en preprints y en patentes, así que puede devolver artículos que PubMed no muestra.
3. Cada resultado muestra título, autores, revista, año, resumen y DOI, igual que en PubMed, y un enlace al texto completo cuando es de acceso abierto.
4. Para exportar, usa las opciones de descarga de la página de resultados (formatos de cita y de tabla, verificar en la página oficial).

## 4. Ejemplo trabajado: buscar artículos sobre *Chlorella vulgaris* bajo luz azul y acumulación de lípidos

Supón que estás preparando la revisión de literatura del trabajo sobre acumulación de lípidos en *Chlorella vulgaris* y *Scenedesmus acutus* bajo luz azul y roja.

### Búsqueda 1. El tema en lenguaje normal

Escribe exactamente esto en la barra de búsqueda de PubMed:

> `Chlorella vulgaris blue light lipid accumulation`

Traducción: *Chlorella vulgaris*, luz azul, acumulación de lípidos.

Qué esperar (verificado en PubMed el 2026-11-09): **3 resultados**. El primero es directamente útil:

- **Título:** "Enhanced photoautotrophic growth of *Chlorella vulgaris* in starch wastewater through photo-regulation strategy."
- **Autores:** Ren H, et al.
- **Revista:** *Chemosphere* (una de las revistas candidatas para el artículo del genoma).
- **Año:** 2022, volumen 307 (Pt 1), artículo 135533.
- **DOI:** 10.1016/j.chemosphere.2022.135533.
- **PMID:** 35787884.
- **Resumen:** el resumen indica que, con luz monocromática, la concentración máxima de biomasa (1.25 g/L) y el contenido de lípidos (32.2 %) de *Chlorella* se alcanzaron bajo luz azul, mientras que los valores mínimos se obtuvieron bajo luz roja.

Cómo interpretar la ficha: el título dice de qué trata el artículo; el año (2022) dice si es reciente; la revista (*Chemosphere*) dice dónde se publicó; los autores dicen quién lo hizo; el resumen dice el resultado principal sin abrir el texto completo; el DOI es el enlace permanente al artículo; el PMID es el identificador para buscarlo de nuevo en PubMed o citarlo en la API de NCBI. Este resultado confirma con datos publicados lo que el experimento propio muestra: la luz azul da más biomasa y más lípidos que la luz roja. Guárdalo en Zotero con **Send to → Citation Manager** y añádelo a la colección del proyecto.

### Búsqueda 2. Solo revisiones recientes

Para encontrar revisiones que resuman el tema, escribe en la búsqueda avanzada:

> `microalgae AND lipid accumulation AND LED light AND review[pt]`

Y aplica el filtro **Publication dates → 2020–2026**.

Traducción: microalgas y acumulación de lípidos y luz LED, solo revisiones, de 2020 a 2026.

Qué esperar: revisiones que resumen lo que se sabe del tema. Una buena revisión te da en un solo documento el panorama y decenas de referencias útiles para la introducción del manuscrito.

### Búsqueda 3. Por término MeSH

Para una búsqueda más precisa, usa el descriptor MeSH. Primero busca el término en el MeSH Browser (<https://meshb.nlm.nih.gov/search>) y luego escribe:

> `"Chlorella vulgaris"[mh] AND lipids[mh]`

Qué esperar: solo los artículos indizados por la NLM bajo esos dos descriptores. Es una búsqueda más cerrada que la de lenguaje normal, útil cuando la primera búsqueda devuelve demasiados resultados o resultados fuera de tema.

### Búsqueda 4. Biorremediación de aguas residuales con microalgas

Escribe:

> `Chlorella vulgaris wastewater bioremediation nutrient removal`

Traducción: *Chlorella vulgaris*, biorremediación de aguas residuales, remoción de nutrientes.

Activa el filtro **Free full text** para quedarte con los textos completos gratuitos. Lee el resumen de cada resultado y guarda en Zotero los que midan remoción de nitrógeno o fósforo, que son los datos que se comparan con los del trabajo de biorremediación en curso.

### Búsqueda 5. Ensamblaje de novo del genoma de *Chlorella vulgaris*

Escribe:

> `Chlorella vulgaris de novo genome assembly functional annotation`

Traducción: *Chlorella vulgaris*, ensamblaje de novo del genoma, anotación funcional.

Qué esperar: trabajos sobre el ensamblaje y la anotación del genoma de *Chlorella vulgaris*, con los métodos de secuenciación y ensamblaje que usaron. Compara los métodos y las métricas de calidad del ensamblaje (por ejemplo, N50 y completitud BUSCO) con los del borrador de genoma en preparación.

## 5. Consejos y limitaciones

- **Busca siempre en inglés.** La literatura científica sobre microalgas y biorremediación está publicada en inglés. Una búsqueda en español devuelve muy pocos resultados.
- **Empieza en lenguaje normal y afina después.** Escribe primero las palabras clave sin operadores. Si obtienes demasiados resultados, añade términos con AND o pasa a la búsqueda avanzada; si obtienes muy pocos, quita el término más específico o usa OR entre sinónimos.
- **Revisa el cuadro de traducción de la consulta.** En la búsqueda avanzada se ve cómo PubMed tradujo tus palabras a MeSH. Si un término se tradujo a un concepto equivocado, corrígelo ahí antes de buscar.
- **PubMed busca en los registros, no en el texto completo.** Si un dato está en el cuerpo del artículo pero no en el título, el resumen ni los descriptores, PubMed no lo encuentra. Para buscar dentro del texto completo usa Europe PMC, que sí indiza el texto de los artículos de acceso abierto.
- **No todas las revistas están en PubMed.** PubMed cubre literatura biomédica y de ciencias de la vida (MEDLINE y otras fuentes), pero no todas las revistas del área están indizadas. Por ejemplo, el artículo de Torres-Martínez (2025) en *Journal of Applied Phycology*, DOI 10.1007/s10811-024-03426-4, no aparece en PubMed con la búsqueda por DOI (verificado el 2026-11-09). Para localizar ese artículo y ver quién lo ha citado, usa Semantic Scholar (guía 01 de este repositorio).
- **Algunos registros no tienen resumen.** Si un resultado dice "No abstract available", no puedes saber de qué trata sin abrir el texto completo. Pasa al siguiente resultado o busca el texto en Europe PMC.
- **No es una revisión sistemática por sí sola.** PubMed devuelve lo que coincide con tu búsqueda, pero no garantiza haber encontrado todos los artículos sobre un tema. Para una revisión sistemática, registra tu estrategia de búsqueda (términos, filtros y fecha) y combínala con otras bases de datos.
- **Verifica siempre la fuente original.** La ficha de PubMed es un índice. Cuando cites un dato en tu artículo, lee el artículo original y cita desde ahí, no desde el resumen del buscador.
- **Guarda la estrategia de búsqueda.** En la búsqueda avanzada, el botón de URL te da un enlace con la búsqueda completa: guárdalo en tus notas para poder repetir la misma búsqueda meses después y ver qué se ha publicado desde entonces.
- **Crea alertas para tus temas.** Con la cuenta gratuita de NCBI, guarda la búsqueda (por ejemplo, *Chlorella vulgaris* y lípidos) y recibe un correo cuando se publique algo nuevo. Así el estado del arte se actualiza solo.

## 6. Costo

**Gratis, sin plan de pago.** PubMed es un recurso público gratuito de la National Library of Medicine: la búsqueda, las fichas de artículos, los resúmenes, los filtros, la búsqueda avanzada, la exportación a gestores de citas y las alertas con cuenta NCBI son gratuitas. No hay límite de búsquedas para el uso normal desde el navegador. La API gratuita E-utilities también es gratuita; para uso intensivo la NLM pide registrar una clave de API y un correo, y aplica límites de velocidad (verificar en la documentación oficial).

Europe PMC también es **gratuito, sin registro ni clave**: la búsqueda, los resúmenes, el texto completo de acceso abierto y la API son gratuitos.

Verificar en la página oficial si algo cambia: <https://pubmed.ncbi.nlm.nih.gov/about/>

## 7. Qué aprendimos

- PubMed es la base de datos gratuita de la NLM con más de 35 millones de citas, y cada registro trae título, año, revista, autores, resumen, DOI y PMID: todo lo que se necesita para decidir si un artículo vale la pena y para citarlo.
- Escribir el tema en inglés y en lenguaje normal basta para empezar, porque PubMed traduce las palabras a términos MeSH; la búsqueda avanzada con AND, OR, NOT y etiquetas de campo ([ti], [ab], [mh], [dp], [pt]) afina la búsqueda cuando hace falta.
- La búsqueda verificada sobre *Chlorella vulgaris*, luz azul y lípidos devuelve el artículo de Ren et al. en *Chemosphere* (2022, PMID 35787884), que reporta 32.2 % de lípidos bajo luz azul frente al mínimo bajo luz roja.
- Con **Send to → Citation Manager** los resultados se exportan en formato .nbib y se importan a Zotero (guía 06), donde quedan listos para citar en Word.
- Europe PMC es la alternativa cuando PubMed no alcanza: busca también en texto completo, preprints y patentes, y da el texto completo de acceso abierto.
- No todas las revistas están en PubMed: el artículo de Torres-Martínez (2025) en *Journal of Applied Phycology* no aparece ahí, así que para localizarlo y ver sus citas se usa Semantic Scholar (guía 01).

## 8. Enlaces y relación con otras herramientas del repo

- PubMed: <https://pubmed.ncbi.nlm.nih.gov/>
- Búsqueda avanzada de PubMed: <https://pubmed.ncbi.nlm.nih.gov/advanced/>
- MeSH Browser (para encontrar el descriptor correcto): <https://meshb.nlm.nih.gov/search>
- E-utilities, documentación de la API: <https://www.ncbi.nlm.nih.gov/books/NBK25501/>
- Europe PMC: <https://europepmc.org/>
- Sobre PubMed: <https://pubmed.ncbi.nlm.nih.gov/about/>

Relación con las demás guías:

- **01 Semantic Scholar:** PubMed es el paso 1 para buscar artículos por tema con la ficha completa (título, año, revista, autores, resumen, DOI). Semantic Scholar complementa: encuentra artículos que PubMed no indiza (como el de Torres-Martínez 2025), ordena por citas y muestra la cadena de citas.
- **06 Zotero:** los resultados de PubMed se exportan con **Send to → Citation Manager** (.nbib) y se importan a Zotero, donde se organizan por proyecto y se citan en Word.
- **07 scite:** una vez localizado un artículo en PubMed, scite dice si ha sido apoyado o refutado por citas posteriores.
- **08 Research Rabbit:** los artículos encontrados en PubMed sirven como semillas para descubrir literatura relacionada.
- **10 Flujo de trabajo:** la búsqueda en PubMed es el primer paso del flujo completo, antes de validar con Consensus y extraer datos con Elicit.
- **Serie RNA-seq (repo ozono7/RNA-seq):** el Módulo 01 (`01-busqueda-pubmed-genbank-uniprot.R`) hace esta misma búsqueda de PubMed desde R con `rentrez` y la API E-utilities, y guarda los resultados en una tabla con título, año, revista, autores, resumen y DOI: <https://github.com/ozono7/RNA-seq>
