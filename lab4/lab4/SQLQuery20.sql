use AdventureWorksDW2019
SELECT 
    CAST(FactCallCenterID AS VARCHAR) + ' (' + WageType + ')' AS ModulName,
    LevelOneOperators + LevelTwoOperators AS TotalSum
FROM 
    FactCallCenter;