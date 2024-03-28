use AdventureWorksDW2019
SELECT  CAST(FinanceKey AS VARCHAR) + '(' +  CAST(DateKey AS VARCHAR) +')' AS [FactCallCenterID + DateKey], Amount, Date
FROM FactFinance
ORDER BY OrganizationKey + DepartmentGroupKey + ScenarioKey + AccountKey