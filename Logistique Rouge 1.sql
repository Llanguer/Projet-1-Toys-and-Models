-- Donner une estimation en jour du stock actuel des produits (si possible en fonction de la date de la requête)
SELECT productName, quantityInStock, round(sum(quantityOrdered)/12) as Quantité_Vendue_par_Mois, 
sum(quantityOrdered), round(quantityInStock/(sum(quantityOrdered)/365)) as jour_restant
FROM products LEFT JOIN orderdetails ON products.productCode = orderdetails.productCode
GROUP BY productName, quantityInStock
ORDER BY jour_restant ASC;