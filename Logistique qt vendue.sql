select productName, products.quantityInStock, sum(orders.shippedDate) as quantité_vendu, year(orderDate) as année
from orderdetails JOIN products ON products.productCode = orderdetails.productCode
JOIN orders ON orders.orderNumber = orderdetails.orderNumber
group by productName, année, products.quantityInStock
having année >2022 and année < 2024
order by année;