-- 1
SELECT category.category_name, COUNT(*)
FROM (
	SELECT shoe.shoe_category1 FROM shoe
    UNION ALL
    SELECT shoe.shoe_category2 FROM shoe
) AS temp
LEFT JOIN category
ON shoe_category1=category_id WHERE shoe_category1 IS NOT NULL
GROUP BY category_name;

-- 2
SELECT
    customer.customer_fname, customer.customer_lname, SUM(orders_cost)
FROM
    orders
LEFT JOIN customer
ON orders.customer_id=customer.customer_id
GROUP BY customer.customer_lname
HAVING SUM(orders_cost);

-- 4
SELECT
    customer.customer_city, SUM(orders_cost)
FROM
    orders
LEFT JOIN customer
ON orders.customer_id=customer.customer_id
GROUP BY customer.customer_city
HAVING SUM(orders_cost) > 1000;

-- 6
SELECT
    YEAR(orders_date), MONTH(orders_date), SUM(orders_cost)
FROM
	orders
GROUP BY YEAR(orders_date), MONTH(orders_date)
ORDER BY SUM(orders_cost) DESC
LIMIT 1;