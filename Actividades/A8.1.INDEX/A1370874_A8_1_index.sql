-- Mauricio Rico / A01370874

SELECT * FROM orderdetails WHERE orderLineNumber = 1 and quantityOrdered > 50;
609.20

SELECT productCode FROM orderdetails WHERE orderLineNumber = 1 and quantityOrdered > 50;
609.20

SELECT orderLineNumber, count(*) FROM orderdetails WHERE orderLineNumber = 1 and quantityOrdered > 50 group by orderLineNumber;
609.20

SELECT * FROM orderdetails force index(idx_orderLineNumber) WHERE orderLineNumber = 1 and quantityOrdered > 50;
92.5

SELECT productCode FROM orderdetails force index(idx_orderLineNumber) WHERE orderLineNumber = 1 and quantityOrdered > 50;
95.20

SELECT orderLineNumber, count(*) FROM orderdetails force index(idx_orderLineNumber) WHERE orderLineNumber = 1 and quantityOrdered > 50 group by orderLineNumber;
95.20

SELECT * FROM orderdetails force index(idx_quantity_orderLineNumber) WHERE orderLineNumber = 1 and quantityOrdered > 50;
93.41

SELECT productCode FROM orderdetails force index(idx_quantity_orderLineNumber) WHERE orderLineNumber = 1 and quantityOrdered > 50;
27.62

SELECT orderLineNumber, count(*) FROM orderdetails force index(idx_quantity_orderLineNumber) WHERE orderLineNumber = 1 and quantityOrdered > 50 group by orderLineNumber;
27.62

SELECT * FROM orderdetails force index(idx_orderLineNumber_quantity) WHERE orderLineNumber = 1 and quantityOrdered > 50;
8.01

SELECT productCode FROM orderdetails force index(idx_orderLineNumber_quantity) WHERE orderLineNumber = 1 and quantityOrdered > 50;
3.02

SELECT orderLineNumber, count(*) FROM orderdetails force index(idx_orderLineNumber_quantity) WHERE orderLineNumber = 1 and quantityOrdered > 50 group by orderLineNumber;
3.02
