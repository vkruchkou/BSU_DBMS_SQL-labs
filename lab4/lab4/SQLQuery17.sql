SELECT ProductName + '(' + Manufacturer +')' AS ModulName, Price, Price * ProductCount As TotalSum
FROM Products
ORDER BY TotalSum
