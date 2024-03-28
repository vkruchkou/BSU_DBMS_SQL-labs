SELECT ProductName + '(' + Manufacturer +')' AS ModulName, 
Price INTO ProductSummary
FROM Products;

SELECT * FROM ProductSummary