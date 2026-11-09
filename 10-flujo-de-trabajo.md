# Autor: Dr. José Juan Torres Martínez
# Docente de Ciencias Químicas
# Universidad Autónoma de San Luis Potosí (UASLP)
# México
#
# Material académico para estudiantes

# 10 — Flujo de trabajo completo: de la búsqueda al manuscrito

Este archivo aplica las 9 herramientas del repositorio, en orden, a un ejemplo real: el artículo de RNA-seq de *Chlorella vulgaris* y *Scenedesmus acutus* bajo luz azul y roja (acumulación de lípidos, crecimiento y transcriptoma). El objetivo del flujo es armar la revisión de literatura y el borrador del manuscrito para enviarlo a una de las revistas candidatas: Plant Biotechnology Journal, Bioresource Technology o Metabolic Engineering.

Cada paso remite al archivo de la herramienta, donde están las instrucciones detalladas. Aquí se muestra qué hacer en cada paso, con las búsquedas y preguntas literales.

## El ejemplo

- **Tema:** transcriptómica (RNA-seq) de *Chlorella vulgaris* y *Scenedesmus acutus* bajo luz azul y roja; cómo la luz afecta la acumulación de lípidos y la expresión de genes.
- **Artículo publicado del autor:** Torres-Martínez et al. (2025), acumulación de lípidos en *Chlorella vulgaris* y *Scenedesmus acutus* bajo luz azul/roja, J. Applied Phycology, DOI 10.1007/s10811-024-03426-4.
- **Revistas candidatas:** Plant Biotechnology Journal, Bioresource Technology, Metabolic Engineering.

## Paso 1. Buscar — Semantic Scholar

Ver [01-semantic-scholar.md](01-semantic-scholar.md).

- Entra a https://semanticscholar.org.
- Escribe la búsqueda literal (en inglés):

  `blue light red light lipid accumulation Chlorella vulgaris Scenedesmus acutus RNA-seq`

- Filtra por Open Access para descargar los PDFs, y por año (últimos 10 años) para quedarte con lo reciente.
- Abre la ficha de cada artículo, lee el TLDR y guarda en tu biblioteca los que traten de luz y lípidos, luz y crecimiento, o RNA-seq en microalgas.
- Busca también tu artículo de 2025 por su DOI (10.1007/s10811-024-03426-4) y revisa sus citas: ahí aparecen los trabajos que lo han citado desde su publicación.

**Resultado esperado:** una lista de 15 a 30 artículos relevantes, con sus PDFs de acceso abierto descargados en una carpeta.

## Paso 2. Validar — Consensus

Ver [02-consensus.md](02-consensus.md).

- Entra a https://consensus.app.
- Escribe la pregunta literal (en inglés):

  `Does blue light increase lipid accumulation in microalgae?`

  Traducción: ¿La luz azul aumenta la acumulación de lípidos en microalgas?
- Lee el Consensus Meter: cuántos estudios responden Yes, cuántos No y cuántos Possibly. Si la mayoría dice Yes, la afirmación tiene apoyo; si hay muchos Mixed, el tema sigue abierto y conviene leer los estudios uno por uno.
- Repite con una segunda pregunta:

  `Does red light promote growth in Chlorella vulgaris?`

  Traducción: ¿La luz roja promueve el crecimiento en *Chlorella vulgaris*?
- Filtra por Systematic Reviews para ver los estudios más rigurosos.

**Resultado esperado:** dos respuestas con su Consensus Meter y las fuentes revisadas por pares que las respaldan, para usarlas en la introducción del manuscrito.

## Paso 3. Extraer — Elicit

Ver [03-elicit.md](03-elicit.md).

- Entra a https://elicit.com y crea tu cuenta gratuita.
- Sube los PDFs descargados en el paso 1 (los de luz azul/roja y lípidos).
- Pide estas columnas, con las preguntas literales en inglés:
  - `Which microalga species was studied?` (¿Qué especie de microalga se estudió?)
  - `What light condition was used?` (¿Qué condición de luz se usó?)
  - `What was the lipid content reported?` (¿Qué contenido de lípidos se reportó?)
  - `What method was used to measure lipids?` (¿Qué método se usó para medir los lípidos?)
  - `What was the main result?` (¿Cuál fue el resultado principal?)
- Exporta la tabla a Excel o CSV.
- Verifica cada celda haciendo clic en ella: Elicit muestra el párrafo exacto del PDF. Comprueba el número, la unidad y la condición antes de usar el dato.

**Resultado esperado:** una tabla comparativa con los artículos, la especie, la luz, el contenido de lípidos y el método, lista para comparar y para citar.

## Paso 4. Mapear — Connected Papers

Ver [04-connected-papers.md](04-connected-papers.md).

- Entra a https://connectedpapers.com.
- Pega el DOI del artículo de 2025 como artículo semilla:

  `10.1007/s10811-024-03426-4`

- Explora el gráfico: los círculos grandes son los artículos más citados; los nodos cercanos al semilla son los más relacionados.
- Revisa **Prior Works** para encontrar los trabajos que dieron origen al tema (los pioneros de luz y lípidos en microalgas).
- Revisa **Derivative Works** para ver qué artículos recientes se basaron en el trabajo de 2025 o en sus vecinos.
- Guarda los artículos que falten en tu lista del paso 1 y añádelos a la tabla de Elicit.

**Resultado esperado:** el mapa de la literatura del tema, con los artículos seminales identificados y los avances recientes localizados.

## Paso 5. Verificar el contexto — scite

Ver [07-scite.md](07-scite.md).

- Entra a https://scite.ai.
- Busca el artículo de 2025 por su DOI (10.1007/s10811-024-03426-4) y lee su contexto de citas: cuántas lo apoyan (supporting), cuántas solo lo mencionan (mentioning) y cuántas lo contradicen (contrasting).
- Repite con los 3 o 4 artículos clave de tu tabla (los de mayor peso en tu introducción).
- Si un artículo tiene citas que lo contradicen, lee esas citas antes de apoyarte en él: puede que un resultado haya sido cuestionado después de publicarse.
- Anota en tu tabla qué artículos tienen apoyo sólido y cuáles tienen objeciones.

**Resultado esperado:** la lista de artículos clave con su contexto de citas verificado, para citar solo trabajos que siguen vigentes.

## Paso 6. Descubrir más — Research Rabbit

Ver [08-research-rabbit.md](08-research-rabbit.md).

- Entra a https://researchrabbit.ai.
- Crea una colección llamada "RNA-seq Chlorella Scenedesmus luz azul roja".
- Añade como semilla el DOI 10.1007/s10811-024-03426-4 y los artículos clave de tu tabla.
- Explora Similar Works (trabajos parecidos), Earlier Works (anteriores) y Later Works (posteriores) para encontrar literatura que no apareció en los pasos 1 y 4.
- Revisa la red de autores: quiénes publican más sobre luz y lípidos en microalgas.
- Añade los artículos nuevos a la colección y expórtalos a Zotero.

**Resultado esperado:** la colección completa del artículo de RNA-seq, con la literatura relacionada que no habías encontrado por búsqueda directa.

## Paso 7. Citar — Zotero

Ver [06-zotero.md](06-zotero.md).

- Abre Zotero en tu Mac y crea la colección "Transcriptómica RNA-seq — Chlorella y Scenedesmus luz azul/roja".
- Importa los PDFs de la carpeta (o deja que Watch Folder en modo "Import only" los añada) y revisa que cada referencia tenga sus metadatos correctos (autores, año, revista, DOI). Verifica cada referencia con su DOI; nunca aceptes una referencia sin comprobarla.
- En Word, con el plugin de Zotero, añade las citas mientras escribes la introducción y la discusión (por ejemplo, el artículo de Torres-Martínez et al., 2025).
- Elige el estilo de citación de la revista a la que vas a enviar el manuscrito (Plant Biotechnology Journal, Bioresource Technology o Metabolic Engineering) en Document Preferences. Zotero genera la bibliografía automáticamente.
- Guarda la biblioteca sincronizada para no perder las referencias.

**Resultado esperado:** el manuscrito en Word con las citas insertadas y la bibliografía generada en el estilo de la revista elegida.

## Paso 8. Organizar y preparar — NotebookLM (Gemini Notebook)

Ver [09-notebooklm.md](09-notebooklm.md).

- Entra a https://notebooklm.google.com y crea un cuaderno llamado "RNA-seq Chlorella Scenedesmus".
- Sube los PDFs de tu colección (los de luz azul/roja, lípidos y RNA-seq).
- Pide un resumen de la literatura y una tabla comparativa por artículo (especie, luz, resultado principal).
- Usa el cuaderno para preparar el material de clase sobre el tema: genera una guía de estudio y preguntas para tus estudiantes.
- Verifica cada respuesta contra los PDFs: NotebookLM solo responde con base en las fuentes que subiste, pero conviene comprobar los números y las afirmaciones antes de usarlos.

**Resultado esperado:** un cuaderno con el resumen de la literatura y material listo para preparar la clase y revisar el manuscrito.

## Paso 9. Redactar y traducir — DeepL

Ver [05-deepl.md](05-deepl.md).

- Escribe el manuscrito en español en Word (o el borrador del resumen).
- Entra a https://deepl.com/translator y traduce el documento completo al inglés, conservando el formato.
- Configura el glosario con los términos de tu área antes de traducir, por ejemplo:
  - luz azul → blue light
  - luz roja → red light
  - acumulación de lípidos → lipid accumulation
  - tasa de crecimiento → growth rate
  - ensamblaje de novo del genoma → de novo genome assembly
  - biorremediación de aguas residuales → wastewater bioremediation
- Usa DeepL Write para pulir la redacción del resumen y de la discusión.
- Revisa la traducción frase por frase: nunca aceptes una traducción sin leerla, y corrige los términos técnicos que DeepL haya traducido mal.

**Resultado esperado:** el manuscrito en inglés, con la terminología de tu área correcta y la redacción pulida, listo para enviar a la revista.

## Resumen del flujo

| Paso | Herramienta | Qué obtienes |
|---|---|---|
| 1 | Semantic Scholar | Lista de artículos y PDFs |
| 2 | Consensus | Respuestas validadas con evidencia |
| 3 | Elicit | Tabla comparativa de datos |
| 4 | Connected Papers | Mapa de la literatura y artículos seminales |
| 5 | scite | Contexto de citas verificado |
| 6 | Research Rabbit | Colección completa de literatura relacionada |
| 7 | Zotero | Referencias organizadas y citas en Word |
| 8 | NotebookLM (Gemini Notebook) | Resumen, guía de estudio y material de clase |
| 9 | DeepL | Manuscrito traducido y pulido |

## Qué aprendimos

- El flujo completo va de la búsqueda al manuscrito: cada herramienta entrega un resultado concreto que usa el paso siguiente.
- La validación (Consensus) y la verificación del contexto (scite) evitan citar afirmaciones sin apoyo o trabajos que ya fueron refutados.
- La tabla de Elicit y el mapa de Connected Papers son la base de la introducción y la discusión: muestran qué se sabe y qué falta por estudiar.
- Zotero guarda las referencias y genera la bibliografía en el estilo de la revista; DeepL traduce y pule el texto, pero la revisión final siempre la hace el autor.
