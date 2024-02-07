USE ZAGIDB;


SELECT productid, productname, vendorid, productprice
FROM product
WHERE productprice <= 110 AND CATEGORYID = 'FW'
ORDER BY productprice DESC;
GO


SELECT productid, productname, vendorid, productprice
FROM product
WHERE productprice <= 110 --AND CATEGORYID = 'FW'
ORDER BY categoryid, productprice;
GO


SELECT productid, productname, categoryid, vendorid, productprice
FROM product
ORDER BY categoryid, productprice;
GO


SELECT count(*)
FROM product;
GO


SELECT AVG(productprice)
FROM product;
GO


Select count(distinct vendorid)
From product;
GO


select count(*), avg(productprice), min(Productprice), max(productprice)
from product
where categoryid = 'CP';
GO


select count(*), left(round(avg(productprice), 2), len(avg(productprice))-4), min(Productprice), max(productprice)
from product
where categoryid = 'CP';
GO


select count(*), left(avg(productprice), len(avg(productprice))-4), min(Productprice), max(productprice)
from product
where categoryid = 'CP';
GO