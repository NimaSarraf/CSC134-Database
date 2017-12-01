SELECT Title
FROM BOOKS
WHERE Unit_in_Stock> 5;

SELECT SUM(Unit_Price)
FROM BOOKS B, ORDERDETAILS D, ORDERS O, CUSTOMERS C
WHERE C.LastName = 'Smith' AND C.CustomerID = O.CustomerID AND O.OrderID = D.OrderID AND D.BookID = B.BookID;


SELECT Title, ShipperName
FROM ORDERS O, ORDERDETAILS D, BOOKS B, SHIPPERS S
WHERE O.ShippedDate = '2017-08-05' AND O.ShipperID = S.ShipperID AND O.OrderID = D.OrderID AND D.BookID = B.BookID;

SELECT DISTINCT Title
FROM EMPLOYEES E, ORDERS O, ORDERDETAILS D, BOOKS B
WHERE E.LastName = 'Steely' AND E.EmployeeID = O.EmployeeID AND O.OrderID = D.OrderID AND D.BookID = B.BookID;

SELECT  C.FirstName, SUM(Unit_Price)
FROM BOOKS B, ORDERDETAILS D, ORDERS O, CUSTOMERS C
WHERE C.CustomerID = O.CustomerID AND O.OrderID = D.OrderID AND D.BookID = B.BookID
GROUP BY C.FirstName
ORDER BY SUM(Unit_Price) DESC;


SELECT DISTINCT Title
FROM CUSTOMERS C, ORDERS O, ORDERDETAILS D, BOOKS B
WHERE C.CustomerID = O.CustomerID AND O.OrderID = D.OrderID 
AND D.BookID = B.BookID AND (C.LastName = 'Smith' OR C.LastName = 'Collins');


SELECT Title, SUM(Quantity)
FROM BOOKS B, ORDERDETAILS D
WHERE B.BookID = D.BookID
GROUP BY Title
ORDER BY SUM(Quantity) ASC;

SELECT FirstName
FROM CUSTOMERS C, ORDERS O, ORDERDETAILS D, BOOKS B
WHERE C.CustomerID = O.CustomerID AND O.OrderID = D.OrderID AND D.BookID = B.BookID AND B.Title LIKE '%Louisiana%';


 SELECT LastName
FROM CUSTOMERS C, ORDERS O, ORDERDETAILS D, BOOKS B
WHERE C.CustomerID = O.CustomerID AND O.OrderID = D.OrderID AND D.BookID = B.BookID AND B.Author = 'Thomas';


SELECT LastName, Title
FROM CUSTOMERS C, ORDERS O, ORDERDETAILS D, BOOKS B, SUBJECTS S
WHERE C.CustomerID = O.CustomerID AND O.OrderID = D.OrderID 
AND D.BookID = B.BookID AND B.SubjectID = S.SubjectID AND (S.CategoryName = 'Fiction' OR S.CategoryName = 'Travel');


SELECT CategoryName, MIN(UNIT_PRICE)
FROM Subjects S, Books B
WHERE S.SubjectID = B.SubjectID
GROUP BY CategoryName;

 Select Title, Quantity
FROM BOOKS B, ORDERDETAILS D, ORDERS O
WHERE B.BookID = D.BookID AND D.OrderID = O.OrderID AND O.OrderDate = '2017-08-04';

SELECT FirstName, LastName, SUM(D.Quantity)
FROM CUSTOMERS C, ORDERS O, ORDERDETAILS D
WHERE C.CustomerID = O.CustomerID AND O.OrderID = D.OrderID
GROUP BY C.CustomerID
HAVING SUM(D.Quantity) > 1
ORDER BY SUM(Quantity) DESC;


SELECT FirstName, LastName, Phone
FROM CUSTOMERS C, ORDERS O, ORDERDETAILS D
WHERE C.CustomerID = O.CustomerID AND O.OrderID = D.OrderID
GROUP BY C.CustomerID
HAVING SUM(D.Quantity) > 1
