USE ZAGIDB;
GO

/* Create View Statement 1 */

CREATE VIEW products_more_than_3_sold AS
SELECT productid, productname, productprice
FROM product
WHERE productid IN
      (SELECT productid
      FROM includes
      GROUP BY productid
      HAVING SUM(quantity) > 3);
GO

/* Query 30a */

SELECT *
FROM products_more_than_3_sold;
GO

/* Create View Statement 2 */

CREATE VIEW products_in_multiple_trnsc AS
SELECT productid, productname, productprice
FROM product
WHERE productid IN
      (SELECT productid
      FROM includes
      GROUP BY productid
      HAVING COUNT(*) > 1);
GO

/* Query 31a */

SELECT *
FROM products_in_multiple_trnsc;
GO

/* Query 37 */

SELECT *
FROM products_more_than_3_sold
UNION
SELECT *
FROM products_in_multiple_trnsc;
GO

/* Query 38 */

SELECT *
FROM products_more_than_3_sold
INTERSECT
SELECT *
FROM products_in_multiple_trnsc;
GO

/* Query 39 */

SELECT *
FROM products_more_than_3_sold
EXCEPT
SELECT *
FROM products_in_multiple_trnsc;
GO

/* A DIFFERENT DATABASE IS USED AT THIS POINT */

USE HAFH;
GO

/* Query 40 */

SELECT c.ccname AS client, r.ccname AS recommender
FROM corpclient c, corpclient r
WHERE r.ccid = c.ccidreferredby;
GO

/* Query 41 */

SELECT a.buildingid, a.aptno, c.ccname
FROM apartment a, corpclient c
WHERE a.ccid = c.ccid;
GO

/* Query 41alt1 */

SELECT a.buildingid, a.aptno, c.ccname
FROM apartment a JOIN corpclient c
ON a.ccid = c.ccid;
GO

/* Query 41alt2 */

SELECT a.buildingid, a.aptno, c.ccname
FROM apartment a INNER JOIN corpclient c
ON a.ccid = c.ccid;
GO

/* Query 42 */

SELECT a.buildingid, a.aptno, c.ccname
FROM apartment a LEFT OUTER JOIN corpclient c
ON a.ccid = c.ccid;
GO

/* Query 43 */

SELECT a.buildingid, a.aptno, c.ccname
FROM apartment a RIGHT OUTER JOIN corpclient c
ON a.ccid = c.ccid;
GO

/* Query 44 */

SELECT a.buildingid, a.aptno, c.ccname
FROM apartment a FULL OUTER JOIN corpclient c
ON a.ccid = c.ccid;
GO

/* Query 45 */

SELECT m.managerid, m.mfname, m.mlname, s.smemberid
FROM manager m, staffmember s
WHERE m.mfname = s.smembername;
GO

/* Query 46 */

SELECT *
FROM manager
WHERE mbonus IS NULL;
GO

/* Query 47 */

SELECT *
FROM corpclient c
WHERE EXISTS
      (SELECT *
      FROM apartment a
      WHERE c.ccid = a.ccid);
GO

/* Query 48 */

SELECT *
FROM corpclient c
WHERE NOT EXISTS
      (SELECT *
      FROM apartment a
      WHERE c.ccid = a.ccid);
GO

/* Query 47alt1 */

SELECT *
FROM corpclient c
WHERE c.ccid IN
      (SELECT cc.ccid
      FROM apartment a, corpclient cc
      WHERE cc.ccid = a.ccid);
GO

/* Query 47alt2 */

SELECT DISTINCT c.ccid, c.ccname, c.ccindustry, c.cclocation, c.ccidreferredby
FROM corpclient c, apartment a
WHERE c.ccid =a.ccid;
GO

/* Create Table Statement 1 */

CREATE TABLE cleaningdenormalized
(     buildingid  CHAR(3)     NOT NULL,
      aptno             CHAR(5)     NOT NULL,
      smemberid   CHAR(4)     NOT NULL,
      smembername       VARCHAR(15)       NOT NULL,
      PRIMARY KEY (buildingid, aptno, smemberid));
GO

/* Insert Statement 2 */

INSERT INTO cleaningdenormalized
SELECT c.buildingid, c.aptno, s.smemberid, s.smembername
FROM cleaning c, staffmember s
WHERE c.smemberid = s.smemberid;
GO

/* SQL Query A */
SELECT productid, productname, productprice
FROM product
WHERE productid IN
      (SELECT productid
      FROM includes
      GROUP BY productid
      HAVING SUM(quantity) > 3);
GO

/* SQL Query B */
SELECT productid, productname, productprice
FROM product
WHERE productid IN ('3X3','4X4');
GO