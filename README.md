# disponibilidad-e-impacto-financiero-de-lubricantes
Proyecto de análisis de datos sobre disponibilidad e impacto financiero en la categoría de lubricantes utilizando Excel, Power BI y SQL | Data analytics project evaluating product availability and financial impact in the Lubricants category (Excel, Power BI & SQL)
# Evaluación de la Disponibilidad e Impacto Financiero de la Categoría de Lubricantes (DataFuel S.A.) - Área Producción

> **Resumen Ejecutivo:** Proyecto integral de analítica de datos que evalúa la disponibilidad de inventario, el desempeño del punto de reorden y la rentabilidad financiera de la familia de **Lubricantes** en **DataFuel S.A.** utilizando **Excel, Power BI y SQL**. Con el objetivo de apoyar la toma de decisiones operativas y financieras, el análisis examina la disponibilidad de stock y el desempeño financiero de los lubricantes activos y plantea acciones para producción e inventario.

---

## Contexto y objetivo del negocio

En el área de Producción y Abastecimiento de **DataFuel S.A.**, se detectaron quiebres de stock recurrentes en lubricantes clave que obligaban a frenar otras líneas y producir a pedido de emergencia. 

El objetivo del proyecto fue implementar un análisis **descriptivo y de diagnóstico** para:
1. Identificar productos activos con riesgo inminente de desabastecimiento frente a su punto de reorden.
2. Evaluar si las fallas de reposición responden a umbrales estáticos o falta de emisión oportuna de órdenes.
3. Auditar el impacto financiero real de los costos operativos y la evolución de la demanda comercial sobre la rentabilidad de la categoría.

---

## Herramientas y arquitectura técnica

* **SQL:** Extracción, filtrado del catálogo activo (`Suspendido = 0`), auditoría de puntos de reorden, costos operativos (directos e indirectos) y evolución anual de demanda y facturación.
* **Power Query (M):** Limpieza y normalización de la tabla `Productos` (reemplazo booleano en `Suspendido` y exclusión de ítems discontinuados o sin datos operativos como *Lubricante para Compresores de Gas Reciprocantes* y *Lubricante Dieléctrico para Transformadores*).
* **DAX & Power BI:** Modelado analítico, medidas de negocio (`LubricantesConStockCrítico`, `LubricantesCríticosSinPedido`, `RentabilidadProductosActivos`, `TQO %`) y diseño de tablero ejecutivo interactivo.

---

## Vistas del Dashboard (Power BI)

### 1. Portada del Proyecto
![Portada Proyecto DataFuel](dashboard-ejecutivo/Portada%20Proyecto%20DataFuel%20S.A..png)

### 2. Monitoreo de Stock, Punto de Reorden y Rentabilidad
![Pestaña 2 Proyecto DataFuel](dashboard-ejecutivo/Pesta%C3%B1a%202%20Proyecto%20DataFuel%20S.A..png)
*Evaluación ejecutiva de KPIs principales (Lubricantes con Stock Crítico, TQO % y Rentabilidad acumulada de $155.653), evolución histórica 2009–2020 y comparación de Stock Actual vs. Punto de Reorden por producto activo.*

### 3. Demanda Comercial y Comparativa Financiera
![Pestaña 3 Proyecto DataFuel](dashboard-ejecutivo/Pesta%C3%B1a%203%20Proyecto%20DataFuel%20S.A..png)
*Análisis temporal de unidades demandadas, distribución geográfica por país y contraste anual entre Total Facturado y Costos Totales.*

### 4. Recomendaciones Operativas y Comerciales
![Pestaña 4 Proyecto DataFuel](dashboard-ejecutivo/Pesta%C3%B1a%204%20Proyecto%20DataFuel%20S.A..png)
*Síntesis de acciones sugeridas para Producción, Inventario y Gestión Comercial.*

---

## Diseño y funcionalidad del dashboard

* **Selección de visuales:**
  * **Tarjetas KPI:** Muestran métricas clave de diagnóstico rápido (*Lubricantes con Stock Crítico*, *TQO %* y *Rentabilidad*).
  * **Gráfico de Líneas:** Representa la continuidad temporal para detectar ciclos, picos y caídas de rentabilidad (2009–2020).
  * **Barras Horizontales Agrupadas:** Evita la rotación de etiquetas largas al comparar *Stock Actual vs. Punto de Reorden*.
  * **Columnas Agrupadas y Gráfico Combinado:** Contrastan la evolución anual de unidades demandadas y de *Total Facturado vs. Costos Totales*.
  * **Mapa de Burbujas:** Facilita la lectura geográfica del volumen demandado por país.
* **Layout e interactividad:** Estructura con jerarquía visual y lectura en Z, panel lateral con segmentadores (*Producto*, *Año*, *País*), filtrado cruzado dinámico, botón **BORRAR** para reiniciar filtros, navegación entre páginas y *tooltips* informativos.

---

## Hallazgos clave y recomendaciones

* **Riesgo de inventario y reposición:** Se identifican **2 lubricantes activos en stock crítico** (*Grasa Grafitada para Válvulas de Pozo*, con stock actual 22 < punto de reorden 30 y sin unidades pedidas en camino; y *Aceite Sintético de Turbina ISO 32*, con stock actual 13 < punto de reorden 25), con un indicador **TQO %** del 10 %.
* **Evolución de demanda, facturación y rentabilidad (2009–2020):** La categoría acumula **$155.653** de rentabilidad, con pico histórico en **2014** ($33.000) y caída progresiva hacia **2020** ($2.500), acompañando el descenso de la demanda desde 2014–2015 (~4,7 mil y ~3,5 mil unidades) hacia valores de 1,5 mil – 1,9 mil unidades (2016–2020).
* **Insight principal:** El motor principal de la caída de rentabilidad entre 2014 y 2020 es la **disminución de la demanda comercial y del total facturado** (de $58,6 mil a $3,7 mil, acompañado por los costos totales de $25,2 mil a $1,6 mil sin superar los ingresos). Un ítem crítico puntual de baja facturación individual (como la *Grasa Grafitada para Válvulas de Pozo*, con $6.598) no explica por sí solo la caída general, aunque exige ajustar alertas preventivas de reposición.
* **Recomendaciones:**
  1. Revisar la configuración del punto de reorden frente a las unidades en existencia para evitar productos críticos sin cobertura en camino.
  2. Priorizar la programación preventiva de lotes antes de cruzar el nivel de reposición para reducir corridas de emergencia.
  3. Analizar el comportamiento comercial (clientes, pedidos y evolución de cantidades vendidas) de la familia de lubricantes.

## Archivos del repositorio y cómo usar el modelo

- **Tablero y capturas (`dashboard-ejecutivo/`):** Contiene el archivo de Power BI (`.pbix`) y las vistas del dashboard.
- **Orígenes de datos (`datos/`):** Contiene los archivos `.csv` utilizados para alimentar el modelo.
- **Documentación (`documentación-funcional/`):** Contiene el documento funcional del proyecto.

> **Nota para abrir el `.pbix`:** Descargá el repositorio completo (botón **Code -> Download ZIP**) o descargá el `.pbix` junto con la carpeta `datos/`. Si Power BI solicita actualizar la ruta del parámetro de origen, apuntá el parámetro a la carpeta `datos/` descargada en tu equipo.
