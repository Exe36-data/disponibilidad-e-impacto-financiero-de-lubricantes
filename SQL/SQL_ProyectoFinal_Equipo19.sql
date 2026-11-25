--------------------------------------------------------

/* Catálogo de lubricantes activos: stock actual y punto de reorden */

SELECT
    p.Id_de_producto,
    p.Nombre_de_producto AS Producto,
    p.Unidades_en_existencia AS StockActual,
    p.Nivel_de_nuevo_pedido AS PuntoReorden,
    p.Unidades_pedidas
FROM Productos p
JOIN Categorias c 
   ON p.Categoria = c.IdCategoria
WHERE c.NombreCategoria = 'Lubricantes'
  AND p.Suspendido = 'FALSO';
---------------------------------------------------------

/* Lubricantes activos en estado crítico y reposición pendiente */

SELECT
    p.Id_de_producto,
    p.Nombre_de_producto AS Producto,
    p.Unidades_en_existencia AS StockActual,
    p.Nivel_de_nuevo_pedido AS PuntoReorden,
    p.Unidades_pedidas
FROM Productos p
JOIN Categorias c 
   ON p.Categoria = c.IdCategoria
WHERE c.NombreCategoria = 'Lubricantes'
  AND p.Suspendido = 'FALSO'
  AND p.Unidades_en_existencia <= p.Nivel_de_nuevo_pedido
ORDER BY p.Unidades_pedidas ASC, p.Unidades_en_existencia ASC;

---------------------------------------------------------

/* Costos operativos (directos e indirectos) por pedido */

SELECT 
    p.Id_de_producto,
    p.Nombre_de_producto AS Lubricante,
    COUNT(DISTINCT dp.Id_de_pedido) AS CantidadRegistros,
    SUM(dp.Costos_Directos) AS TotalCostosDirectos,
    SUM(dp.Costos_Indirectos) AS TotalCostosIndirectos,
    SUM(dp.Costos_Directos + dp.Costos_Indirectos) AS CostoOperativoTotal
FROM [Detalles de Pedidos] dp
JOIN Productos p ON dp.Producto = p.Id_de_producto
JOIN Categorias c ON p.Categoria = c.IdCategoria
JOIN Pedidos pe ON pe.Id_de_pedido = dp.Id_de_pedido
WHERE c.NombreCategoria = 'Lubricantes'
AND pe.Fecha_de_pedido BETWEEN '2009-01-01' AND '2020-12-31' 
AND p.Suspendido = 'FALSO'
GROUP BY
    p.Id_de_producto,
    p.Nombre_de_producto
ORDER BY
    CostoOperativoTotal DESC;
----------------------------------------------------------

/* Demanda comercial y facturación por producto */

SELECT DISTINCT
    p.Nombre_de_producto AS Producto,
    SUM(dp.Cantidad) AS TotalUnidadesVendidas,
    ROUND(SUM(dp.Total),2) AS TotalFacturado
FROM [Detalles de Pedidos] dp
JOIN Productos p ON dp.Producto = p.Id_de_producto
JOIN Categorias c ON p.Categoria = c.IdCategoria
JOIN Pedidos pe ON pe.Id_de_pedido = dp.Id_de_pedido
WHERE c.NombreCategoria = 'Lubricantes'
  AND p.Suspendido = 'FALSO'
  AND pe.Fecha_de_pedido BETWEEN '2009-01-01' AND '2020-12-31' 
GROUP BY p.Nombre_de_producto
ORDER BY TotalUnidadesVendidas DESC;

----------------------------------------------------------

/* Evolución anual de la demanda y facturación de lubricantes */

SELECT
    YEAR(pe.Fecha_de_pedido) AS Anio,
    COUNT(pe.Id_de_pedido) AS CantidadPedidos,
    SUM(dp.Cantidad) AS UnidadesDemandadas,
    SUM(dp.Total) AS TotalFacturado
FROM Pedidos pe
JOIN [Detalles de Pedidos] dp ON pe.Id_de_pedido = dp.Id_de_pedido
JOIN Productos p ON dp.Producto= p.Id_de_producto
JOIN Categorias c ON p.Categoria = c.IdCategoria
WHERE c.NombreCategoria = 'Lubricantes'
AND p.Suspendido = 'FALSO'
GROUP BY YEAR(pe.Fecha_de_pedido)
ORDER BY Anio;


