SELECT ProductName + '(' + Manufacturer +')' AS ModulName, Price
FROM Products
ORDER BY Price * ProductCount