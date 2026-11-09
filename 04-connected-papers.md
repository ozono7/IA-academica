# Autor: Dr. José Juan Torres Martínez
# Docente de Ciencias Químicas
# Universidad Autónoma de San Luis Potosí (UASLP)
# México
#
# Material académico para estudiantes

# 04 — Connected Papers: mapear las relaciones entre artículos en un gráfico

> Enlaces oficiales: [connectedpapers.com](https://www.connectedpapers.com) · [Precios y preguntas frecuentes](https://www.connectedpapers.com/pricing)
> Datos de esta guía verificados el 2026-11-09 en la página oficial de precios de Connected Papers.

## 1. ¿Qué problema resuelve?

Cuando se entra a un tema nuevo, o cuando se prepara la introducción de un artículo, la lista de resultados de un buscador no dice qué artículos son los importantes ni cómo se relacionan entre sí. Se pueden leer 30 resúmenes sin saber cuál fue el trabajo que inició el tema, cuáles son los trabajos más citados y cuáles son los avances más recientes.

Connected Papers resuelve ese problema en tres casos concretos de las áreas de trabajo de este repositorio:

- **Luz azul y roja en *Chlorella vulgaris* y *Scenedesmus acutus*:** partir del artículo publicado sobre acumulación de lípidos bajo luz azul y roja y ver qué trabajos lo precedieron y qué trabajos recientes lo han continuado, para escribir la introducción del artículo de RNA-seq.
- **Biorremediación de aguas residuales con microalgas:** partir de un artículo clave sobre remoción de nitrógeno y fósforo y encontrar los demás estudios que trabajan el mismo problema, sin depender de las palabras exactas de una búsqueda por palabras clave.
- **Ensamblaje de novo del genoma de *Chlorella vulgaris*:** partir de un artículo clave de ensamblaje de genomas de microalgas y encontrar qué herramientas de ensamblaje y anotación usan los grupos que trabajan con genomas parecidos.

En los tres casos, la pregunta que Connected Papers contesta es la misma: "dado este artículo que ya conozco, ¿cuáles son los artículos más relacionados con él, cuáles vinieron antes y cuáles vinieron después?".

## 2. ¿Qué hace?

Connected Papers construye un gráfico visual a partir de un solo artículo, llamado artículo semilla. En ese gráfico:

- **Cada círculo es un artículo.** El círculo del centro, de color distinto, es el artículo semilla que se eligió.
- **El tamaño del círculo indica cuántas citas ha recibido el artículo.** Un círculo grande es un artículo muy citado; un círculo pequeño es un artículo poco citado o reciente.
- **El color del círculo indica el año de publicación.** Los colores forman una escala por año, de modo que se distingue a simple vista qué artículos son antiguos y cuáles son recientes.
- **Las líneas entre círculos indican que dos artículos están relacionados.** Dos artículos están conectados cuando comparten referencias (citan a los mismos trabajos) o cuando son citados juntos por otros trabajos. Entre más corta y gruesa sea la línea, más parecidos son los dos artículos. El gráfico no es un árbol de citas: que dos artículos estén conectados no quiere decir que uno cite al otro.
- **La posición también dice algo.** Los artículos parecidos entre sí quedan agrupados cerca unos de otros; los grupos separados del gráfico suelen ser subtemas distintos dentro del mismo campo.

Además del gráfico, la página muestra tres listas:

- **Prior Works (Trabajos previos):** los artículos anteriores al artículo semilla que más se relacionan con él. Ahí están los orígenes del tema.
- **Derivative Works (Trabajos derivados):** los artículos posteriores que citan a varios de los artículos del gráfico. Ahí están los avances recientes que se apoyan en este campo.
- **Los artículos del gráfico, ordenados por similitud** con el artículo semilla, con título, autores, año y número de citas.

Connected Papers usa los datos de Semantic Scholar, una base de cientos de millones de artículos.

## 3. Paso a paso para usarla

### Paso 1. Crear la cuenta gratuita

1. Entrar a [connectedpapers.com](https://www.connectedpapers.com).
2. Hacer clic en **Sign up** (Registrarse), en la parte superior de la página.
3. Registrarse con un correo. También se puede entrar con ORCID, el identificador de investigador.
4. Confirmar el correo si la página lo pide.

Crear la cuenta es importante: sin cuenta, el uso gratuito es de unos 2 gráficos; con cuenta gratuita, son 5 gráficos al mes, y los gráficos quedan guardados en el historial.

### Paso 2. Pegar el título o el DOI de un artículo clave

1. En la página principal hay un cuadro de búsqueda grande.
2. Pegar el DOI del artículo semilla (el formato es `10.xxxx/xxxxx`) o escribir su título completo en inglés.
3. Presionar **Enter** o hacer clic en **Build a graph** (Construir un gráfico).
4. Esperar unos segundos mientras Connected Papers construye el gráfico. La primera vez tarda un poco más.

Si se pega un DOI, asegurarse de copiarlo completo, sin espacios al inicio ni al final.

### Paso 3. Leer el gráfico

1. El círculo central es el artículo semilla. A su alrededor aparecen unos 50 artículos relacionados.
2. Pasar el cursor sobre un círculo para ver su título, autores, año y número de citas.
3. Hacer clic en un círculo para fijarlo: en el panel lateral aparece su resumen y un enlace para abrirlo.
4. Mirar el tamaño: los círculos grandes son los trabajos más citados del campo. Mirar el color: los colores de un extremo de la escala son los trabajos antiguos y los del otro extremo son los recientes.
5. Mirar los grupos: si el gráfico se divide en dos o tres grupos separados, cada grupo suele ser un subtema (por ejemplo, un grupo de luz azul, un grupo de luz roja, o un grupo de crecimiento y otro de lípidos).

### Paso 4. Revisar Prior Works (Trabajos previos)

1. Debajo del gráfico, o en el panel lateral, hacer clic en **Prior Works**.
2. La lista muestra los artículos anteriores al artículo semilla que más se relacionan con el tema, ordenados por relevancia.
3. Leer los primeros 5 a 10. Ahí está la base del tema: los trabajos que definieron el problema y los métodos que todos los demás usan.
4. El artículo seminal se identifica así: es el más antiguo de la lista, tiene un círculo grande (muchas citas) y aparece conectado con muchos artículos del gráfico. Si varios artículos del gráfico lo citan a él, es el origen del campo.

### Paso 5. Revisar Derivative Works (Trabajos derivados)

1. Hacer clic en **Derivative Works**.
2. La lista muestra los artículos posteriores que citan a varios de los trabajos del gráfico.
3. Leer los primeros 5 a 10, fijándose en el año: ahí están los avances más recientes y las líneas de trabajo que están activas ahora.
4. Si un trabajo derivado tiene muchas citas en poco tiempo, es una señal de que esa línea de trabajo está creciendo.

### Paso 6. Guardar los artículos que sirven

1. En la lista de artículos, marcar con **Save** (Guardar) los que se van a leer completos.
2. Los artículos guardados quedan en la cuenta y se pueden exportar en formato BibTeX para llevarlos a Zotero.
3. Repetir el gráfico con otro artículo semilla si el tema tiene dos subtemas claros: por ejemplo, un gráfico para luz azul y roja, y otro gráfico para biorremediación. Cada gráfico consume uno de los 5 gráficos gratuitos del mes, así que conviene planear qué semillas se van a usar.

## 4. Ejemplo trabajado: partir del artículo de 2025 sobre lípidos bajo luz azul y roja

**Objetivo:** construir el mapa de la literatura alrededor del artículo publicado sobre acumulación de lípidos en *Chlorella vulgaris* y *Scenedesmus acutus* bajo luz azul y roja, para escribir la introducción del artículo de RNA-seq y encontrar los trabajos que hay que citar.

**Artículo semilla (pegar exactamente esto en el cuadro de búsqueda de Connected Papers):**

> DOI: `10.1007/s10811-024-03426-4`
>
> Torres-Martínez (2025), acumulación de lípidos en *Chlorella vulgaris* y *Scenedesmus acutus* bajo luz azul y roja, *Journal of Applied Phycology*.

**Qué se espera ver en el gráfico:**

- El círculo central es el artículo de 2025.
- Alrededor aparecen los artículos más parecidos: estudios de luz LED azul y roja en microalgas, estudios de acumulación de lípidos, y estudios de crecimiento de *Chlorella* y *Scenedesmus*.
- Los círculos grandes cercanos al centro son los trabajos más citados sobre luz y lípidos en microalgas. Esos son los trabajos que casi seguro hay que citar en la introducción.
- Si el gráfico se separa en grupos, un grupo será probablemente de estudios de luz y crecimiento, y otro grupo de estudios de composición bioquímica y lípidos. Esa separación sirve para organizar la introducción en dos apartados.

**Qué buscar en Prior Works (Trabajos previos):**

1. Abrir **Prior Works** y leer los primeros 10 artículos.
2. Buscar el artículo más antiguo con el círculo más grande: ese es el candidato a artículo seminal del tema de luz y lípidos en microalgas. Para confirmarlo, hacer clic en su círculo en el gráfico y comprobar que muchos artículos del gráfico están conectados con él.
3. Anotar de esa lista: qué longitud de onda usaron los primeros estudios (por ejemplo, luz azul alrededor de 450 nm y luz roja alrededor de 660 nm), qué intensidades probaron y qué método usaron para medir lípidos. Esos datos son el punto de partida contra el que se comparan los resultados del artículo de 2025.
4. Si en Prior Works aparece un artículo sobre el efecto de la luz en la expresión de genes de la síntesis de lípidos, ese artículo es un puente directo hacia el artículo de RNA-seq: conecta el tema de lípidos con el tema de transcriptómica.

**Qué buscar en Derivative Works (Trabajos derivados):**

1. Abrir **Derivative Works** y leer los primeros 10 artículos, ordenados por fecha.
2. Buscar los publicados en 2025 y 2026: son los trabajos que ya están usando o citando la línea de luz azul y roja, y muestran hacia dónde va el campo.
3. Buscar en esa lista trabajos de RNA-seq u ómica en microalgas bajo luz de colores: si aparecen, son los competidores y los referentes directos del artículo de RNA-seq en preparación, y conviene leerlos completos.
4. Anotar los títulos de 3 a 5 trabajos derivados que se van a citar como avances recientes en la introducción.

**Cómo identificar el artículo seminal, paso a paso:**

1. En **Prior Works**, ordenar mentalmente la lista por año: el más antiguo es el primer candidato.
2. Comprobar su tamaño de círculo en el gráfico: si es de los más grandes, tiene muchas citas.
3. Comprobar sus conexiones: si al hacer clic en su círculo se ven líneas hacia muchos artículos del gráfico, es un trabajo que todos los demás usan como base.
4. Comprobar que el tema corresponde: su título debe hablar del tema central (luz y lípidos en microalgas), no de un tema lateral.
5. Si un solo artículo cumple las cuatro condiciones (antiguo, muy citado, muy conectado, tema central), ese es el artículo seminal. Si dos artículos las cumplen, el campo tiene dos orígenes y se citan los dos.

**Segundo gráfico con el mismo procedimiento, para biorremediación:** usar como semilla un artículo clave sobre remoción de nitrógeno y fósforo de aguas residuales con *Chlorella vulgaris*. En su gráfico, los círculos grandes serán los trabajos clásicos de tratamiento de aguas con microalgas; en Prior Works estarán los primeros sistemas de cultivo en aguas residuales; y en Derivative Works estarán los trabajos recientes sobre remoción de fármacos y metales. Un tercer gráfico posible es uno con semilla en ensamblaje de novo del genoma de *Chlorella vulgaris*, para encontrar qué ensambladores y qué estrategias de anotación usan los grupos de genómica de microalgas.

## 5. Consejos y limitaciones

- **El gráfico muestra similitud, no citas directas.** Que dos artículos estén conectados no quiere decir que uno cite al otro: quiere decir que citan a los mismos trabajos o que son citados juntos por otros. Para saber si un artículo cita a otro, se revisa su lista de referencias. Connected Papers lo dice en su propia documentación: el gráfico no es un árbol de citas.
- **Un gráfico no basta para una revisión completa.** Connected Papers muestra unos 50 artículos alrededor de una semilla. Para una revisión sistemática, ese mapa se combina con una búsqueda por palabras clave y con la tabla comparativa de Elicit.
- **Elegir bien la semilla cambia todo el gráfico.** Si la semilla es un artículo muy general, el gráfico sale muy amplio y poco útil. Si la semilla es un artículo muy específico, el gráfico sale muy cerrado. Para el artículo de RNA-seq, la semilla correcta es el artículo de 2025 sobre lípidos bajo luz azul y roja, porque es el trabajo propio más cercano al tema.
- **Los artículos recientes salen con círculos pequeños.** Un artículo de 2026 tiene pocas citas porque acaba de publicarse, no porque sea poco importante. En Derivative Works se encuentran los trabajos recientes, aunque sus círculos sean pequeños.
- **El plan gratuito da 5 gráficos al mes.** Antes de generar un gráfico, decidir qué semilla se va a usar y qué se busca en él. Si el gráfico sale con una semilla equivocada, ese gráfico ya se gastó.
- **Guardar los artículos en el momento.** Marcar con **Save** los artículos que se van a leer y exportar la lista en BibTeX a Zotero antes de cerrar la página, para no tener que reconstruir el gráfico después.
- **Usar las revistas candidatas como referencia de calidad.** Al elegir qué artículos del gráfico leer completos, dar prioridad a los publicados en revistas como *Plant Biotechnology Journal*, *Bioresource Technology*, *Chemosphere* o *Science of the Total Environment*, que son las revistas candidatas para los artículos de estas áreas.

## 6. Costo

Precios y límites consultados el 2026-11-09 en la página oficial [connectedpapers.com/pricing](https://www.connectedpapers.com/pricing). El plan gratuito incluye todas las funciones; lo que cambia entre planes es el número de gráficos al mes.

| Plan | Costo | Qué incluye |
|---|---|---|
| **Gratuito** | $0 | 5 gráficos al mes con una cuenta gratuita, con todas las funciones: gráficos de similitud, Prior Works, Derivative Works, gráficos de varios orígenes, artículos guardados e historial de gráficos. Sin cuenta, el uso es de unos 2 gráficos. |
| **Academic** | Verificar en la página oficial | Gráficos sin límite. Para académicos, organizaciones sin fines de lucro y uso personal. Fuentes secundarias de octubre de 2026 indican $6 USD al mes facturado anualmente ($72 USD al año), pero el precio que muestra la página depende del país desde el que se consulta: verificar en la página oficial antes de pagar. |
| **Business** | Verificar en la página oficial | Gráficos sin límite. Para uso comercial o con fines de lucro. Fuentes secundarias de octubre de 2026 indican $20 USD al mes facturado anualmente ($240 USD al año); el precio depende del país: verificar en la página oficial. |

Hay además un programa de becas: quien hace investigación y no puede pagar una suscripción puede escribir a scholarships@connectedpapers.com para pedir un plan Premium con descuento o gratuito. El pago lo procesa PayPro Global y la suscripción se renueva automáticamente, pero se puede cancelar en cualquier momento.

## 7. Qué aprendimos

- Connected Papers construye un gráfico a partir de un solo artículo semilla: el tamaño del círculo indica las citas recibidas, el color indica el año y las líneas indican similitud entre artículos, no citas directas.
- Con el DOI `10.1007/s10811-024-03426-4` (Torres-Martínez, 2025, lípidos en *Chlorella vulgaris* y *Scenedesmus acutus* bajo luz azul y roja) como semilla, el gráfico muestra los trabajos más relacionados con ese tema.
- En Prior Works están los orígenes del tema, y el artículo seminal se identifica porque es antiguo, tiene un círculo grande, está conectado con muchos artículos del gráfico y trata el tema central.
- En Derivative Works están los avances recientes: ahí se buscan los trabajos de 2025 y 2026, incluidos los de RNA-seq en microalgas, que son los referentes directos del artículo en preparación.
- El plan gratuito incluye todas las funciones y permite 5 gráficos al mes con cuenta (unos 2 sin cuenta); el plan Academic quita ese límite y su precio exacto depende del país, por lo que se verifica en la página oficial.

## 8. Enlaces

- Connected Papers: https://www.connectedpapers.com
- Precios de Connected Papers: https://www.connectedpapers.com/pricing
