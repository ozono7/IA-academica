# Autor: Dr. José Juan Torres Martínez
# Docente de Ciencias Químicas
# Universidad Autónoma de San Luis Potosí (UASLP)
# México
#
# Material académico para estudiantes

# Elicit: extraer datos de artículos a una tabla comparativa

> Enlaces oficiales: [elicit.com](https://elicit.com) · [Precios](https://elicit.com/pricing)
> Datos de esta guía verificados el 2026-11-09 en la página oficial de precios de Elicit.

## ¿Qué problema resuelve?

Cuando se prepara un artículo o una revisión de literatura, el trabajo más lento es abrir artículo por artículo y copiar a mano los mismos datos: qué especie se estudió, en qué condiciones de luz se cultivó, cuánto lípido acumuló, qué método se usó para medirlo. Con 10 o 15 artículos, esa copia manual toma días y es fácil equivocarse en un número o en una unidad.

Elicit resuelve ese problema en tres casos concretos de las áreas de trabajo de este repositorio:

- **Lípidos en microalgas bajo luz azul y roja:** comparar en una sola tabla qué porcentaje de lípidos acumularon *Chlorella vulgaris* y *Scenedesmus acutus* con luz azul, con luz roja y con luz blanca, y a qué velocidad crecieron en cada condición.
- **Biorremediación de aguas residuales con microalgas:** comparar qué contaminante eliminó cada estudio (nitrógeno, fósforo, metales, fármacos), con qué especie, en cuántos días y con qué porcentaje de remoción.
- **Ensamblaje de novo del genoma de *Chlorella vulgaris*:** comparar qué plataforma de secuenciación usó cada estudio, qué ensamblador, cuántos contigs obtuvo y qué valor de N50 reportó.

En los tres casos, la pregunta que Elicit contesta es la misma: "de estos 10 artículos, dame los mismos datos de cada uno, en columnas, para poder compararlos".

## ¿Qué hace?

Elicit es un asistente de investigación con IA que busca en una base de más de 138 millones de artículos académicos y hace tres cosas:

1. **Busca artículos con una pregunta en lenguaje natural.** Se escribe una pregunta, por ejemplo *"What is the effect of blue light on lipid accumulation in Chlorella vulgaris?"*, y Elicit devuelve una lista de artículos con su resumen.
2. **Extrae datos a una tabla.** Se definen columnas (por ejemplo: especie, condición de luz, contenido de lípidos, tasa de crecimiento) y Elicit llena una celda por artículo con el dato que encontró en el texto.
3. **Muestra la fuente de cada dato.** Al hacer clic en una celda, Elicit muestra el párrafo exacto del artículo de donde sacó ese dato, para poder comprobarlo.

También permite chatear con el texto completo de un artículo (preguntarle cosas sobre ese artículo en concreto) e importar referencias desde Zotero.

## Paso a paso para usarla

### Paso 1. Crear la cuenta gratuita

1. Entrar a [elicit.com](https://elicit.com).
2. Hacer clic en **Sign up** (Registrarse).
3. Registrarse con la cuenta de Google o con un correo y una contraseña.
4. Confirmar el correo si Elicit lo pide.

No se necesita tarjeta de crédito para el plan gratuito (Basic).

### Paso 2. Escribir la pregunta de búsqueda

1. En la página principal, escribir la pregunta en inglés en el cuadro de búsqueda. Elicit trabaja en inglés: las preguntas y las columnas de la tabla se escriben en inglés.
2. Ejemplos de preguntas para las áreas de este repositorio:
   - *"What is the effect of blue and red light on lipid accumulation in Chlorella vulgaris and Scenedesmus acutus?"*
     Traducción: "¿Cuál es el efecto de la luz azul y roja en la acumulación de lípidos en *Chlorella vulgaris* y *Scenedesmus acutus*?"
   - *"How do microalgae remove nitrogen and phosphorus from wastewater?"*
     Traducción: "¿Cómo eliminan las microalgas el nitrógeno y el fósforo de las aguas residuales?"
   - *"What sequencing platforms and assemblers are used for de novo genome assembly of Chlorella vulgaris?"*
     Traducción: "¿Qué plataformas de secuenciación y ensambladores se usan para el ensamblaje de novo del genoma de *Chlorella vulgaris*?"
3. Presionar **Enter**. Elicit muestra una lista de artículos con título, autores, año y un resumen corto de una o dos líneas.

### Paso 3. Elegir los artículos de la tabla

1. Revisar la lista y marcar con la casilla los artículos que sí corresponden al tema. Descartar los que hablen de otra especie, de otro contaminante o de otro tema.
2. Para decidir rápido, leer el resumen que Elicit muestra debajo de cada título: ahí dice qué se estudió y qué resultado principal se obtuvo.
3. Quedarse con 8 a 12 artículos para una primera tabla. Con más artículos, la revisión de los datos toma mucho más tiempo.

### Paso 4. Definir las columnas de extracción

1. Encima de la lista de resultados, hacer clic en **Add column** (Añadir columna) o en **Extract data** (Extraer datos), según la versión que muestre la página.
2. Escribir cada columna como una pregunta en inglés. Elicit contesta esa pregunta para cada artículo y pone la respuesta en la celda. Ejemplos de columnas:
   - *"What microalgae species were studied?"* — "¿Qué especie de microalga se estudió?"
   - *"What light conditions were used (wavelength, intensity, photoperiod)?"* — "¿Qué condiciones de luz se usaron (longitud de onda, intensidad, fotoperiodo)?"
   - *"What was the lipid content reported?"* — "¿Qué contenido de lípidos se reportó?"
   - *"What was the specific growth rate?"* — "¿Cuál fue la tasa específica de crecimiento?"
   - *"What method was used to measure lipids?"* — "¿Qué método se usó para medir los lípidos?"
3. Esperar a que Elicit llene la tabla. Cada celda tarda unos segundos en aparecer.

### Paso 5. Subir PDFs propios (opcional)

1. Si ya se tienen los PDFs descargados, hacer clic en **Upload** (Subir) y seleccionar los archivos PDF.
2. Elicit extrae los datos de esos PDFs con las mismas columnas definidas en el paso 4.
3. Esto sirve para incluir en la tabla artículos que Elicit no encontró en su búsqueda, o el propio artículo publicado.

### Paso 6. Exportar la tabla

1. Cuando la tabla esté completa y revisada, hacer clic en **Export** (Exportar).
2. Elegir el formato: **CSV** para abrirlo en Excel o en R, o **RIS / BIB** para llevar las referencias a Zotero.
3. Guardar el archivo con un nombre claro, por ejemplo `elicit_lipidos_luz_azul_roja.csv`.

## Ejemplo trabajado: lípidos en microalgas bajo luz azul y roja

**Objetivo:** comparar en una tabla los artículos que midieron acumulación de lípidos en *Chlorella vulgaris* y *Scenedesmus acutus* bajo luz azul y roja, para usar esa comparación en la discusión del artículo de RNA-seq sobre estas dos especies.

**Pregunta de búsqueda (escribir exactamente esto en Elicit):**

> *What is the effect of blue and red LED light on lipid accumulation and growth rate in Chlorella vulgaris and Scenedesmus acutus?*
>
> Traducción: "¿Cuál es el efecto de la luz LED azul y roja en la acumulación de lípidos y en la tasa de crecimiento en *Chlorella vulgaris* y *Scenedesmus acutus*?"

**Columnas que se piden (escribir cada una exactamente así):**

| Columna en Elicit (en inglés) | Traducción | Qué debe contener la celda |
|---|---|---|
| *What microalgae species were studied?* | ¿Qué especie de microalga se estudió? | *Chlorella vulgaris* o *Scenedesmus acutus* |
| *What light conditions were used (color, wavelength in nm, intensity, photoperiod)?* | ¿Qué condiciones de luz se usaron (color, longitud de onda en nm, intensidad, fotoperiodo)? | Por ejemplo: luz azul 450 nm, 100 µmol/m²/s, 12 h luz / 12 h oscuridad |
| *What was the lipid content as percentage of dry weight?* | ¿Cuál fue el contenido de lípidos como porcentaje del peso seco? | Por ejemplo: 32 % del peso seco |
| *What was the specific growth rate (mu) per day?* | ¿Cuál fue la tasa específica de crecimiento (mu) por día? | Por ejemplo: 0.73 1/día |
| *What method was used to quantify lipids?* | ¿Qué método se usó para cuantificar los lípidos? | Por ejemplo: método de Bligh y Dyer, tinción con rojo Nilo, gravimetría |
| *What was the main finding about light color and lipids?* | ¿Cuál fue el hallazgo principal sobre el color de luz y los lípidos? | Una frase: qué color dio más lípidos y cuánto más |

**Tabla comparativa realista (ejemplo de cómo se ve el resultado):**

| Artículo | Especie | Luz | Lípidos (% peso seco) | mu (1/día) | Método de lípidos |
|---|---|---|---|---|---|
| Artículo A (2023) | *Chlorella vulgaris* | Azul, 450 nm | 34 % | 0.71 | Bligh y Dyer |
| Artículo B (2022) | *Chlorella vulgaris* | Roja, 660 nm | 28 % | 0.58 | Rojo Nilo |
| Artículo C (2024) | *Scenedesmus acutus* | Azul, 450 nm | 31 % | 0.66 | Gravimetría |
| Artículo D (2021) | *Scenedesmus acutus* | Roja, 660 nm | 25 % | 0.52 | Bligh y Dyer |

Los valores de esta tabla son un ejemplo del formato que se espera; los valores reales son los que Elicit extraiga de cada artículo y deben comprobarse con el procedimiento siguiente.

**Cómo interpretar la tabla:** se lee por columnas. Si la columna de lípidos muestra valores más altos en luz azul que en luz roja en las dos especies, eso apoya que la luz azul favorece la acumulación de lípidos. Si un artículo reporta lo contrario, se revisa su método: un método distinto de medición de lípidos puede explicar la diferencia antes que la biología. La columna de mu dice si el tratamiento que dio más lípidos también permitió crecer rápido, o si hubo un compromiso entre crecer y acumular lípidos.

**Cómo verificar que los datos extraídos son correctos (paso obligatorio):**

1. Hacer clic en una celda de la tabla. Elicit muestra el párrafo exacto del artículo de donde tomó el dato.
2. Leer ese párrafo y comprobar tres cosas: que el número sea el mismo, que la unidad sea la misma (por ejemplo, % de peso seco y no % de peso húmedo) y que corresponda a la condición correcta (luz azul y no luz blanca).
3. Si el dato no aparece en el párrafo, o el párrafo habla de otra cosa, abrir el PDF del artículo y buscar el número en su tabla de resultados o en su sección de resultados.
4. Corregir la celda a mano si el dato es incorrecto, y anotar en qué artículo se corrigió.
5. Repetir esta comprobación, como mínimo, en las celdas de lípidos y de tasa de crecimiento de todos los artículos, porque son los números que después se citan en el manuscrito.

**Segundo uso del mismo ejemplo, con biorremediación:** con la misma tabla, se cambia la pregunta de búsqueda a *"How do Chlorella vulgaris and Scenedesmus acutus remove nitrogen and phosphorus from wastewater?"* (Traducción: "¿Cómo eliminan *Chlorella vulgaris* y *Scenedesmus acutus* el nitrógeno y el fósforo de las aguas residuales?") y las columnas a: especie, contaminante eliminado, concentración inicial, porcentaje de remoción, tiempo de tratamiento en días y tipo de agua residual. El procedimiento de verificación es el mismo: clic en la celda, leer el párrafo fuente, comprobar número y unidad.

## Consejos y limitaciones

- **Comprobar cada número antes de citarlo.** Elicit extrae los datos con IA y puede confundir un valor con otro de la misma tabla, cambiar la unidad o asignar el dato a la condición de luz equivocada. Ningún dato de la tabla se cita en un manuscrito sin haber visto el párrafo fuente. La propia página de Elicit indica que los resultados deben revisarse.
- **Las columnas son preguntas: entre más precisa la pregunta, mejor la respuesta.** *"What was the lipid content?"* da respuestas vagas. *"What was the lipid content as percentage of dry weight?"* da el número con su unidad. Incluir la unidad en la pregunta.
- **Empezar con pocos artículos.** Una tabla de 8 a 12 artículos bien revisados sirve más que una tabla de 40 artículos sin revisar.
- **Elicit trabaja mejor con artículos empíricos** (experimentos con datos medidos, como cultivos de microalgas) que con artículos teóricos o de opinión, porque sus columnas piden datos concretos.
- **Los artículos de acceso restringido son un caso aparte.** Elicit lee el texto completo de los artículos de acceso abierto. Para los artículos de pago, trabaja con el título y el resumen, salvo que se tenga acceso institucional o se use la extensión del navegador de Elicit con acceso propio a la revista. Si una celda queda vacía en un artículo de pago, subir el PDF con el paso 5.
- **Guardar la exportación con fecha.** Los planes gratuitos tienen un uso mensual limitado; exportar la tabla a CSV al terminar evita tener que repetir la extracción el mes siguiente.
- **Usar las revistas candidatas como filtro de calidad.** Al elegir los artículos de la tabla, dar prioridad a los publicados en revistas como *Plant Biotechnology Journal*, *Bioresource Technology*, *Chemosphere* o *Science of the Total Environment*, que son las revistas candidatas para los artículos de estas áreas.

## Costo (gratis vs pago)

Precios consultados el 2026-11-09 en la página oficial [elicit.com/pricing](https://elicit.com/pricing). Elicit muestra dos listas de precios según un selector: Académico (Academic) e Industria (Industry). Los precios siguientes son de la lista académica, que es la que corresponde a un docente universitario; la lista de industria es más cara para los mismos planes. Los precios pueden cambiar: verificar en la página oficial antes de pagar.

| Plan | Costo | Qué incluye |
|---|---|---|
| **Basic (gratuito)** | $0 | Búsqueda sin límite en más de 138 millones de artículos; resúmenes sin límite; chat con el texto completo de los artículos; ver las fuentes de las respuestas; importar desde Zotero. Uso limitado del Agente de Investigación (Research Agent) y de los informes (Research Reports). La página oficial no publica el número exacto de ese límite. |
| **Plus** | $11 USD por usuario al mes, facturado como $132 USD al año | Todo lo del plan gratuito, más exportación a RIS, CSV, BIB, PDF y DOCX; añadir 5 columnas a las tablas a la vez; búsqueda en más de 500 mil ensayos clínicos; uso estándar del Agente de Investigación y de los informes. |
| **Pro** | $39 USD por usuario al mes, facturado como $468 USD al año | Flujo de revisión sistemática que examina hasta 5,000 artículos; añadir 20 columnas a las tablas a la vez; informes que extraen de hasta 135 fuentes; extracciones personalizadas de artículos subidos; acceso a la API. |
| **Scale** | $89 USD por usuario al mes, facturado como $1,068 USD al año | Extracción e interpretación de figuras de los artículos; colaboración en vivo; informes de hasta 200 fuentes; 30 columnas a la vez. |

El plan gratuito (Basic) alcanza para buscar artículos, leer resúmenes y chatear con los textos. Para exportar la tabla a CSV y añadir más columnas, se necesita al menos el plan Plus. El número exacto de PDFs que el plan gratuito permite extraer al mes no está publicado en la página oficial de precios: verificar en la página oficial antes de planear una extracción grande.

## Qué aprendimos

- Elicit convierte una lista de artículos en una tabla comparativa: cada columna es una pregunta en inglés y cada celda es la respuesta que Elicit encontró en ese artículo.
- Para lípidos en microalgas bajo luz azul y roja, las columnas que se piden son: especie, condiciones de luz con longitud de onda e intensidad, contenido de lípidos en % de peso seco, tasa de crecimiento mu en 1/día y método de medición de lípidos.
- Hacer clic en una celda muestra el párrafo exacto del artículo de donde salió el dato, y ese párrafo es lo que se revisa para comprobar número, unidad y condición experimental antes de citar el dato.
- El plan gratuito incluye búsqueda, resúmenes y chat sin límite en más de 138 millones de artículos, con uso limitado del Agente de Investigación y de los informes; la exportación a CSV y las 5 columnas por tabla llegan con el plan Plus académico ($11 USD al mes, facturado anualmente).
- Las preguntas y las columnas se escriben en inglés, y entre más precisa sea la pregunta (con la unidad incluida), mejor es el dato que Elicit devuelve.
