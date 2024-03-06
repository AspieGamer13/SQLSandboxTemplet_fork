USE ZAGIDB;

/* Query 1 */

SELECT productid, productname, productprice, vendorid, categoryid
FROM product;
GO

/* Query 1a */

SELECT *
FROM product;
GO

/* Query 2 */

SELECT productname, productid, vendorid, categoryid, productprice
FROM product;
GO

/* Query 3 */

SELECT productid, productprice
FROM product;
GO

/* Query 3a */

SELECT productid, productprice, productprice * 1.1 AS price_with_tax
FROM product;
GO

/* Query 4 */

SELECT productid, productname, vendorid, productprice
FROM product
WHERE productprice > 100;
GO

/* Query 5 */

SELECT productid, productname, vendorid, productprice
FROM product
WHERE productprice <= 110 AND categoryid = 'FW';
GO

/* Query 6 */

SELECT vendorid
FROM product;
GO

/* Query 7 */

SELECT DISTINCT vendorid
FROM product;
GO

/* Query 8 */

SELECT productid, productname, categoryid, productprice
FROM product
WHERE categoryid = 'FW'
ORDER BY productprice;
GO

/* Query 9 */

SELECT productid, productname, categoryid, productprice
FROM product
WHERE categoryid = 'FW'
ORDER BY productprice DESC;
GO

/* Query 10 */

SELECT productid, productname, categoryid, productprice
FROM product
ORDER BY categoryid, productprice;
GO

/* Query 11 */

SELECT *
FROM product
WHERE productname LIKE '%Boot%';
GO

/* Query 12 */

SELECT AVG(productprice) AS average_price
FROM product;
GO

/* Query 13 */

SELECT COUNT(*) AS number_of_products
FROM product;
GO

/* Query 14 */

SELECT COUNT(DISTINCT vendorid) AS number_of_vendors
FROM product;
GO

/* Query 15 */

SELECT COUNT(*) AS number_of_products, AVG(productprice) AS average_price, MIN(productprice) AS minimum_price, MAX(productprice) AS maximum_price
FROM product
WHERE categoryid = 'CP';
GO

/* Query 16 */

SELECT vendorid, COUNT(*) AS number_of_products, AVG(productprice) AS average_price
FROM product
GROUP BY vendorid;
GO

/* Query 17 */

SELECT COUNT(*) AS number_of_products, AVG(productprice) AS average_price
FROM product
GROUP BY vendorid;
GO

/* Query 18 */

SELECT vendorid, COUNT(*) AS number_of_products
FROM product
WHERE productprice >= 100
GROUP BY vendorid;
GO

/* Query 19 */

SELECT vendorid, categoryid, COUNT(*) AS number_of_products, AVG(productprice) AS average_price
FROM product
GROUP BY vendorid, categoryid;
GO

/* Query 20 */

SELECT productid, SUM(quantity) AS total_quantity
FROM includes
GROUP BY productid;
GO

/* Query 21 */

SELECT productid, COUNT(*) AS number_of_transactions
FROM includes
GROUP BY productid;
GO

/* Query 22 */

SELECT vendorid, categoryid, COUNT(*) AS number_of_products, AVG(productprice) AS average_price
FROM product
GROUP BY vendorid, categoryid
HAVING COUNT(*) > 1;
GO

/* Query 23 */

SELECT vendorid, categoryid, COUNT(*) AS number_of_products, AVG(productprice) AS average_price
FROM product
WHERE productprice >= 50
GROUP BY vendorid, categoryid
HAVING COUNT(*) > 1;
GO

/* Query 24 */

SELECT productid, SUM(quantity) AS total_quantity
FROM includes
GROUP BY productid
HAVING SUM(quantity) > 3;
GO

/* Query 25 */

SELECT productid, COUNT(*) AS number_of_transactions
FROM includes
GROUP BY productid
HAVING COUNT(*) > 1;
GO

/* Query 26 */

SELECT productid
FROM includes
GROUP BY productid
HAVING SUM(quantity) > 3;
GO

/* Query 27 */

SELECT productid
FROM includes
GROUP BY productid
HAVING COUNT(*) > 1;
GO

/* Query 28 */

SELECT productid, productname, productprice
FROM product
WHERE productprice < (SELECT AVG (productprice)
                      FROM product);
GO

/* Query 29 */

SELECT productid, productname, productprice
FROM product
WHERE productid = '1X1' OR productid = '2X2'
OR productid = '3X3';
GO

/* Query 29 alt */

SELECT productid, productname, productprice
FROM product
WHERE productid IN ('1X1', '2X2', '3X3');
GO

/* Query 30 */

SELECT productid, productname, productprice
FROM product
WHERE productid IN
      (SELECT productid
       FROM includes
       GROUP BY productid
       HAVING SUM(quantity) > 3);
GO

/* Query 31 */

SELECT productid, productname, productprice
FROM product
WHERE productid IN
      (SELECT productid
       FROM includes
       GROUP BY productid
       HAVING COUNT(tid) > 1);
GO

/* Query 32 */

SELECT productid, productname, vendorname, productprice
FROM product, vendor
WHERE product.vendorid = vendor.vendorid;
GO

/* Query 33 */

SELECT productid, productname, vendorname, productprice
FROM product, vendor;
GO

/* Query 34 */

SELECT *
FROM product, vendor;
GO

/* Query 35 */

SELECT *
FROM product, vendor
WHERE product.vendorid = vendor.vendorid;
GO

/* Query 32a */

SELECT p.productid, p.productname, v.vendorname, p.productprice
FROM product p, vendor v
WHERE p.vendorid = v.vendorid;
GO

/* Query 32b */

SELECT p.productid pid, p.productname pname, v.vendorname vname, p.productprice pprice
FROM product p, vendor v
WHERE p.vendorid = v.vendorid;
GO

/* Query 32c */

SELECT p.productid AS pid, p.productname
AS pname,v.vendorname AS vname,
p.productprice AS pprice
FROM product p, vendor v
WHERE p.vendorid = v.vendorid;
GO

/* Query 36 */

SELECT t.tid, t.tdate, p.productname, i.quantity, (i.quantity * p.productprice) AS amount
FROM product p, salestransaction t, includes i
WHERE i.productid = p.productid AND i.tid = t.tid
ORDER BY t.tid;
GO

/* Alter Statement 1 */

ALTER TABLE vendor ADD vendorphonenumber CHAR(12);
GO

/* Alter Statement 2 */

ALTER TABLE vendor DROP COLUMN vendorphonenumber;
GO

/* Insert Statement 1 */

INSERT INTO product VALUES ('7X7','Airy Sock',1000,'MK','FW');
GO

/* Update Statement 1 */

UPDATE product
SET productprice = 10
WHERE productid = '7X7';
GO

/* Alter Statement 3 */

ALTER TABLE product ADD discount NUMERIC(2,2);
GO

/* Update Statement 2 */

UPDATE product
SET discount = 0.2;
GO

/* Update Statement 3 */

UPDATE product
SET discount = 0.3
WHERE vendorid = 'MK';
GO

/* Alter Statement 4 */

ALTER TABLE product DROP COLUMN discount;
GO

/* Delete Statement 1 */

DELETE FROM product
WHERE productid = '7X7';
GO