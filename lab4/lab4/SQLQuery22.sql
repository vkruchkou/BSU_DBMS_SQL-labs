use AdventureWorksDW2019
SELECT  CAST(FinanceKey AS VARCHAR) + '(' +  CAST(DateKey AS VARCHAR) +')' AS [FactCallCenterID + DateKey], 
	OrganizationKey + DepartmentGroupKey + ScenarioKey + AccountKey As TotalKeySum
FROM FactFinance
ORDER BY TotalKeySum