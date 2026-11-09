# Autor: Dr. José Juan Torres Martínez
# Docente de Ciencias Químicas
# Universidad Autónoma de San Luis Potosí (UASLP)
# México
#
# Material académico para estudiantes

# 09 — NotebookLM (Gemini Notebook): preparar clases y revisar literatura a partir de tus propias fuentes

> Enlace oficial: <https://notebooklm.google.com> (redirige a <https://notebook.google.com>)

## 1. ¿Qué problema resuelve?

Preparar una clase o una revisión de literatura obliga a tener varios artículos abiertos a la vez y a comparar lo que dice cada uno: qué especie se usó, qué condiciones de cultivo, qué se midió y qué resultado se obtuvo. Cuando los artículos son muchos, es fácil mezclar los datos de uno con los de otro o olvidar en qué artículo estaba un dato concreto.

NotebookLM resuelve ese problema reuniendo las fuentes en un solo cuaderno y permitiendo preguntar sobre ellas. Sirve en tres temas de trabajo concretos:

- **Biorremediación de aguas residuales con microalgas:** subir los PDF de los artículos sobre remoción de nutrientes y preguntar qué especie removió más nitrógeno, en qué condiciones y con qué eficiencia, comparando todos los artículos a la vez.
- **Chlorella vulgaris y Scenedesmus acutus bajo luz azul y roja:** subir los artículos sobre crecimiento, lípidos y RNA-seq, y preparar una clase que compare qué hace la luz azul y qué hace la luz roja en cada especie.
- **Ensamblaje de novo del genoma de Chlorella vulgaris:** subir los artículos sobre ensamblaje, anotación y genomas de microalgas, y preguntar qué métodos se usaron, qué programas y qué resultados de calidad reportó cada trabajo.

## 2. ¿Qué hace?

NotebookLM es el asistente de investigación de Google basado en fuentes. En julio de 2026 Google lo renombró como **Gemini Notebook**. La dirección https://notebooklm.google.com sigue funcionando y redirige al producto, cuya dirección nueva es https://notebook.google.com

Lo que hace, en concreto:

- **Cuadernos (Notebooks):** cada cuaderno reúne las fuentes de un tema. Un cuaderno para biorremediación, otro para luz azul y roja, otro para el genoma.
- **Fuentes (Sources):** se suben PDF, documentos de Word, presentaciones, archivos de texto, Markdown, enlaces web, vídeos de YouTube y texto copiado. NotebookLM lee esas fuentes y responde solo con base en ellas.
- **Chat con las fuentes:** se escribe una pregunta y NotebookLM responde citando las fuentes concretas en las que se apoya. Cada afirmación de la respuesta lleva el número de la fuente y el fragmento del que salió.
- **Resúmenes:** genera un resumen del conjunto de fuentes o de una sola fuente.
- **Guía de estudio (Study Guide):** genera una guía con preguntas y respuestas clave sobre las fuentes del cuaderno.
- **Mapa mental (Mind Map):** genera un mapa con los temas y subtemas de las fuentes.
- **Tarjetas de repaso (Flashcards) y cuestionarios (Quiz):** genera tarjetas y preguntas para repasar el contenido de las fuentes.
- **Audio Overview:** genera una conversación en audio que resume las fuentes, útil para repasar escuchando.
- **Video Overview:** genera un vídeo con diapositivas y narración a partir de las fuentes.
- **Informes (Reports):** genera informes como una línea de tiempo o un documento de resumen a partir de las fuentes.

El punto central es este: NotebookLM solo responde con base en las fuentes que se suben al cuaderno. No busca en la web para responder. Si un dato no está en las fuentes subidas, NotebookLM no lo tiene. Por eso las respuestas se verifican siempre contra los PDF originales.

## 3. Paso a paso para usarla

### Paso 1. Entrar a NotebookLM

1. Abre el navegador y entra a https://notebooklm.google.com
2. Haz clic en **Sign in** (Iniciar sesión) o en **Try NotebookLM** (Probar NotebookLM).
3. Inicia sesión con una cuenta de Google. Se puede usar la cuenta personal de Google.
4. Si el navegador muestra el nombre Gemini Notebook, es el mismo producto con el nombre nuevo.

### Paso 2. Crear un cuaderno

1. En la pantalla principal, haz clic en **New Notebook** (Nuevo cuaderno) o en **Create new** (Crear nuevo).
2. Escribe un nombre claro para el cuaderno. Ejemplos:
   - `Biorremediacion aguas residuales microalgas`
   - `Luz azul roja Chlorella Scenedesmus clase`
   - `Genoma Chlorella vulgaris ensamblaje de novo`
3. El cuaderno se abre con tres partes: las fuentes a la izquierda, el chat en el centro y las herramientas de estudio (Studio) a la derecha.

### Paso 3. Subir las fuentes

1. Haz clic en **Add Source** (Añadir fuente) o en **Discover sources** (Descubrir fuentes) según lo que muestre la pantalla.
2. Elige el tipo de fuente:
   - **Upload a file** (Subir un archivo): para subir PDF, Word, PowerPoint, texto o Markdown desde la computadora.
   - **Website / Link** (Sitio web / Enlace): para pegar la dirección de una página web.
   - **YouTube**: para pegar el enlace de un vídeo público de YouTube.
   - **Copy text** (Copiar texto): para pegar texto directamente.
3. Selecciona los archivos PDF de los artículos del tema y súbelos. Espera a que cada fuente muestre que ya fue procesada antes de preguntar.
4. Repite el paso hasta tener todas las fuentes del tema en el cuaderno.

Conviene subir primero los artículos más importantes del tema y añadir los demás después. Un cuaderno con 5 a 10 fuentes bien elegidas responde mejor que un cuaderno con 40 fuentes mezcladas.

### Paso 4. Preguntar sobre las fuentes

1. En el cuadro de chat del centro, escribe la pregunta.
2. Pulsa **Enter**.
3. Lee la respuesta y haz clic en los números de fuente que aparecen junto a cada afirmación. Cada número abre el fragmento exacto de la fuente de la que salió esa afirmación.
4. Si la respuesta no es clara, reformula la pregunta con más detalle: nombra la especie, la condición y el dato que buscas.

Ejemplos de preguntas literales para copiar y pegar, con su traducción:

- `What nitrogen removal efficiency did each study report for Chlorella vulgaris in wastewater?`
  - Traducción: ¿Qué eficiencia de remoción de nitrógeno reportó cada estudio para *Chlorella vulgaris* en aguas residuales?
- `Compare the effect of blue light and red light on lipid accumulation in Chlorella vulgaris and Scenedesmus acutus across these sources.`
  - Traducción: Compara el efecto de la luz azul y la luz roja en la acumulación de lípidos en *Chlorella vulgaris* y *Scenedesmus acutus* en estas fuentes.
- `What methods were used for de novo genome assembly of Chlorella vulgaris in these papers?`
  - Traducción: ¿Qué métodos se usaron para el ensamblaje de novo del genoma de *Chlorella vulgaris* en estos artículos?
- `Summarize the growth conditions used in each study: light type, light intensity, temperature and culture medium.`
  - Traducción: Resume las condiciones de crecimiento usadas en cada estudio: tipo de luz, intensidad de luz, temperatura y medio de cultivo.

También se puede preguntar en español. Si las fuentes están en inglés, conviene preguntar en inglés para que la respuesta use los términos exactos de los artículos, y pedir después la explicación en español si hace falta.

### Paso 5. Generar una guía de estudio

1. En el panel de Studio (a la derecha), busca **Study Guide** (Guía de estudio).
2. Haz clic en **Generate** (Generar).
3. Lee la guía: trae preguntas clave y respuestas breves sobre las fuentes.
4. Usa la guía como base para la clase o para repasar antes de escribir la revisión de literatura.

### Paso 6. Generar un mapa mental, tarjetas y cuestionario

1. En el panel de Studio, haz clic en **Mind Map** (Mapa mental) y luego en **Generate**. El mapa muestra los temas principales y sus subtemas.
2. Haz clic en **Flashcards** (Tarjetas) y luego en **Generate** para crear tarjetas de repaso.
3. Haz clic en **Quiz** y luego en **Generate** para crear un cuestionario con preguntas sobre las fuentes.
4. Revisa cada tarjeta y cada pregunta contra las fuentes antes de usarlas en clase.

### Paso 7. Generar un Audio Overview

1. En el panel de Studio, busca **Audio Overview**.
2. Haz clic en **Generate**.
3. Espera a que se genere el audio. Escúchalo para repasar el tema.
4. Si el audio dice algo que no coincide con los artículos, anota el minuto y verifica ese punto en el PDF original antes de usarlo en clase.

### Paso 8. Verificar cada respuesta contra los PDF

1. Haz clic en el número de fuente de cada afirmación importante de la respuesta.
2. Lee el fragmento de la fuente que se abre.
3. Abre el PDF original y busca ese dato: especie, condición, número y unidad.
4. Si el dato coincide, se puede usar. Si no coincide o si el fragmento no dice lo que la respuesta afirma, se corrige con lo que dice el PDF.

## 4. Ejemplo trabajado: preparar una clase sobre biorremediación de aguas residuales con microalgas

### Objetivo del ejemplo

Preparar una clase de ciencias químicas sobre biorremediación de aguas residuales con microalgas, comparando qué especies, qué condiciones y qué eficiencias de remoción reportan los artículos. Al final se tiene una guía de estudio, un mapa mental y una lista de preguntas para los estudiantes, todo verificado contra los PDF.

### Desarrollo del ejemplo

**1. Crear el cuaderno.**

Entra a https://notebooklm.google.com y crea un cuaderno nuevo con el nombre:

```
Biorremediacion aguas residuales microalgas clase
```

**2. Subir las fuentes.**

Sube los PDF de los artículos sobre biorremediación con microalgas que ya se tienen en la biblioteca. Incluye:

- Artículos sobre remoción de nitrógeno y fósforo con *Chlorella vulgaris* en aguas residuales.
- Artículos sobre remoción de nutrientes con *Scenedesmus acutus* u otras especies.
- Artículos sobre las condiciones de cultivo usadas en biorremediación: luz, temperatura, tiempo de tratamiento.
- El borrador del artículo sobre ensamblaje de novo del genoma de *Chlorella vulgaris* para elucidar su potencial para la biorremediación de aguas residuales, porque explica qué características del genoma se relacionan con ese potencial.

Espera a que cada fuente muestre que ya fue procesada.

**3. Pedir un resumen general.**

Escribe en el chat:

```
Summarize the main findings of these sources on microalgae wastewater bioremediation.
```

Traducción: Resume los hallazgos principales de estas fuentes sobre biorremediación de aguas residuales con microalgas.

Lee el resumen y haz clic en los números de fuente para comprobar de qué artículo salió cada hallazgo.

**4. Comparar las eficiencias de remoción.**

Escribe en el chat:

```
Create a table comparing each study: microalgae species, wastewater type, nitrogen removal efficiency, phosphorus removal efficiency, and treatment time.
```

Traducción: Crea una tabla que compare cada estudio: especie de microalga, tipo de agua residual, eficiencia de remoción de nitrógeno, eficiencia de remoción de fósforo y tiempo de tratamiento.

Revisa la tabla fila por fila contra los PDF. Para cada fila, abre el PDF del artículo y comprueba la especie, el tipo de agua residual, los porcentajes y el tiempo. Si un valor de la tabla no está en el PDF, se corrige o se elimina. Esta tabla es el material central de la clase: muestra que la eficiencia depende de la especie, del agua residual y del tiempo, y que no hay un solo número válido para todos los casos.

**5. Preguntar por las condiciones de cultivo.**

Escribe en el chat:

```
What light conditions, temperature and culture medium did each study use?
```

Traducción: ¿Qué condiciones de luz, temperatura y medio de cultivo usó cada estudio?

Anota las condiciones de cada estudio. Eso permite explicar en clase por qué dos estudios con la misma especie reportan eficiencias distintas: porque usaron luz, temperatura o tiempos diferentes.

**6. Preguntar por el mecanismo.**

Escribe en el chat:

```
According to these sources, how do microalgae remove nitrogen and phosphorus from wastewater?
```

Traducción: Según estas fuentes, ¿cómo remueven las microalgas el nitrógeno y el fósforo de las aguas residuales?

Lee la respuesta y verifica cada afirmación en su fuente. Esa respuesta es la explicación del mecanismo para la clase.

**7. Generar la guía de estudio y el mapa mental.**

En el panel de Studio, genera la **Study Guide** y el **Mind Map**. Revisa la guía pregunta por pregunta contra las fuentes. Corrige cualquier pregunta cuya respuesta no esté en los PDF.

**8. Preparar las preguntas para los estudiantes.**

Con la guía y la tabla comparativa, escribe 5 preguntas para la clase:

1. ¿Qué especie removió más nitrógeno y en qué tipo de agua residual?
2. ¿Qué condiciones de luz y temperatura usó el estudio con mayor eficiencia?
3. ¿Por qué dos estudios con *Chlorella vulgaris* reportan eficiencias distintas?
4. ¿Qué papel juega el tiempo de tratamiento en la remoción de fósforo?
5. ¿Qué características de *Chlorella vulgaris* explican su potencial para biorremediación, según el borrador del genoma?

Cada pregunta debe responderse con los PDF del cuaderno, no de memoria. Las respuestas se verifican con los números de fuente de NotebookLM y con los PDF originales.

**9. Generar el Audio Overview para repasar.**

Genera el **Audio Overview** y escúchalo antes de la clase. Si el audio menciona un dato que no coincide con la tabla verificada, se corrige la tabla con el PDF y se ignora ese dato del audio.

### Resultado esperado

Al terminar este ejemplo se tiene: un cuaderno con los PDF de biorremediación, una tabla comparativa verificada contra los PDF (especie, agua residual, remoción de nitrógeno y fósforo, tiempo), una guía de estudio, un mapa mental y 5 preguntas para los estudiantes con sus respuestas verificadas. Ese material sirve para dar la clase y también como base para la revisión de literatura sobre biorremediación con microalgas.

## 5. Consejos y limitaciones

- NotebookLM solo responde con base en las fuentes subidas al cuaderno. No inventa datos de la web, pero tampoco sabe lo que no está en las fuentes. Si una pregunta no se puede responder con las fuentes subidas, la respuesta lo debe indicar o dar una respuesta incompleta. En ese caso, hay que subir la fuente que falta.
- Cada respuesta trae citas con el número de la fuente. Hay que hacer clic en esos números y leer el fragmento antes de usar la respuesta en clase o en un manuscrito. Una cita no garantiza que el dato esté bien interpretado.
- NotebookLM puede confundir datos de dos artículos parecidos, sobre todo cuando varios estudios usan la misma especie. La tabla comparativa del ejemplo existe para detectar ese error: cada fila se verifica contra su PDF.
- Los PDF protegidos contra copia no se importan. Si un artículo no se puede subir, hay que guardarlo como PDF sin protección o subir el texto copiado como fuente de texto.
- Las páginas web con muro de pago no se importan bien como enlace. En ese caso, conviene subir el PDF del artículo.
- Un cuaderno con demasiadas fuentes de temas distintos responde peor. Conviene un cuaderno por tema: uno para biorremediación, otro para luz azul y roja, otro para el genoma.
- El Audio Overview y el Video Overview son resúmenes para repasar, no son fuentes para citar. Lo que se cita en un manuscrito es el artículo original, no el audio.
- Para citar en un manuscrito, las referencias se toman de Zotero o del PDF original, no de NotebookLM. NotebookLM ayuda a encontrar y comparar la información, pero la referencia formal sale del artículo.
- Conviene no subir al cuaderno manuscritos con datos que todavía no se quieren compartir. NotebookLM es un servicio de Google y las fuentes subidas quedan en la cuenta de Google. Para material sensible, conviene revisar la configuración de privacidad de la cuenta antes de subirlo.

## 6. Costo

NotebookLM es gratuito con una cuenta personal de Google. No es una prueba: el plan gratuito se llama **Gemini Notebook Standard** y no pide tarjeta de crédito.

Según la documentación de Google y fuentes secundarias consultadas en noviembre de 2026, el plan gratuito incluye hasta 100 cuadernos por cuenta y hasta 50 fuentes por cuaderno. Cada fuente puede tener hasta 500.000 palabras o hasta 200 MB si es un archivo subido. Desde el 2 de septiembre de 2026, Google cambió los límites de uso diario por un sistema basado en cómputo: el uso disponible se renueva cada 5 horas hasta un límite semanal. Los límites diarios fijos anteriores (por ejemplo, 50 preguntas de chat al día y 3 Audio Overviews al día) ya no aplican de la misma forma. Los límites exactos de uso cambian con frecuencia: verificar en la página oficial de ayuda de Gemini Notebook.

Los planes de pago se venden como suscripciones de Google AI, no como un plan propio de NotebookLM. Según fuentes secundarias de noviembre de 2026, los precios en Estados Unidos son: Google AI Plus 4,99 dólares al mes, Google AI Pro 19,99 dólares al mes y Google AI Ultra desde 99,99 dólares al mes. Esos planes amplían los límites: Plus hasta 200 cuadernos y 100 fuentes por cuaderno, Pro hasta 500 cuadernos y 300 fuentes por cuaderno. Los precios en México pueden ser distintos: verificar en la página oficial antes de pagar. Para preparar clases y revisar literatura, el plan gratuito es suficiente.

## 7. Qué aprendimos

- NotebookLM reúne las fuentes de un tema en un cuaderno y responde solo con base en esas fuentes, citando de qué fuente salió cada afirmación.
- Para preparar la clase de biorremediación, se suben los PDF de los artículos, se pide una tabla comparativa por especie, agua residual, remoción de nitrógeno y fósforo, y tiempo, y cada fila se verifica contra su PDF.
- La guía de estudio, el mapa mental, las tarjetas y el Audio Overview se generan desde el panel de Studio y se revisan antes de usarlos en clase.
- NotebookLM no sustituye la lectura de los artículos: cada respuesta se verifica haciendo clic en el número de fuente y leyendo el fragmento y el PDF original.
- El plan gratuito incluye 100 cuadernos y 50 fuentes por cuaderno, con hasta 500.000 palabras o 200 MB por fuente, y es suficiente para preparar clases y revisar literatura.

## 8. Enlaces

- NotebookLM: https://notebooklm.google.com
- Gemini Notebook (dirección nueva): https://notebook.google.com
- Ayuda de Gemini Notebook: https://support.google.com/gemininotebook
