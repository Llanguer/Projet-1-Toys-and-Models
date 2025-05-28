CREATE VIEW avg_shipping AS (
							SELECT round(avg(datediff(shippedDate ,orderDate))) as avg_shipping_time
                            from orders
							);
SELECT 
    customers.customerName, customers.customerNumber,ROUND(AVG(DATEDIFF(shippedDate, orderDate))) AS Shipping_time,orderdetails.productCode
FROM
    customers
        JOIN
    orders ON orders.customerNumber = customers.customerNumber
		JOIN
	orderdetails ON orders.orderNumber = orderdetails.orderNumber
GROUP BY customers.customerName, customers.customerNumber, orderdetails.productCode
HAVING Shipping_time > (SELECT 
        avg_shipping_time
    FROM
        avg_shipping);