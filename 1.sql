-- SELECT extract data from database
SELECT * FROM Categories;
SELECT name, UserId FROM Categories;

-- SELECT DISTINCT statement is used to return only distinct (different) values.
SELECT DISTINCT UserId FROM Categories;
SELECT DISTINCT websiteName, city FROM Iplogs;

-- The WHERE clause is used to filter records.
SELECT * FROM Categories c  WHERE id = '1';

-- ORDER BY ASC alphabetically if string or numerically
SELECT * FROM Categories c  ORDER BY id ASC;

-- ORDER BY DESC alphabetically if string or numerically
SELECT * FROM Categories c  ORDER BY id DESC;

-- SORTING IP
SELECT 
    ipAddress AS ip, 
    INET6_ATON(ipAddress) AS ipBin,
    'ipv4' AS ipType
FROM IPLogs 
UNION ALL
SELECT 
    ipAddress AS ip, 
    INET6_ATON(ipAddress) AS ipBin,
    'ipv6' AS ipType
FROM IPLogs
ORDER BY ipBin ASC;

-- SORTING IP With Filter
SELECT 
    ipAddress AS ip, 
    INET6_ATON(ipAddress) AS ipBin,
    'ipv4' AS ipType
FROM IPLogs 
WHERE ipAddress LIKE '%.%.%.%'
  AND LENGTH(ipAddress) - LENGTH(REPLACE(ipAddress, '.', '')) = 3
UNION ALL
SELECT 
    ipAddress AS ip, 
    INET6_ATON(ipAddress) AS ipBin,
    'ipv6' AS ipType
FROM IPLogs
WHERE LENGTH(ipAddress) - LENGTH(REPLACE(ipAddress, ':', '')) BETWEEN 2 AND 7
ORDER BY ipBin ASC;

-- this doesn't work if same column
SELECT * FROM Categories c WHERE c.id = 1 AND c.id = 2;
-- select where id is 1 or 2
SELECT * FROM Categories c WHERE c.id = 1 OR c.id = 2;

-- The NOT operator is used in combination with other operators to give the opposite result, also called the negative result.
SELECT countryName  FROM IPLogs i WHERE NOT countryName = 'Indonesia';
SELECT countryName FROM IPLogs i WHERE countryName NOT LIKE 'C%' ORDER BY countryName ASC;
SELECT countryName FROM IPLogs i WHERE countryName NOT IN ('Germany', 'Hong Kong') ORDER BY countryName ASC;
SELECT * FROM IPLogs i WHERE i.id NOT BETWEEN 5 AND 10;