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
