use AdventureWorksDW2019
SELECT  CAST(CurrencyKey AS VARCHAR) + '(' +  CAST(DateKey AS VARCHAR) +')' AS [FactCallCenterID + DateKey], 
AverageRate INTO AverageRateTable
FROM FactCurrencyRate;

SELECT * FROM AverageRateTable