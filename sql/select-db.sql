--отримати покупців, які зробили замовлення
SELECT count("customerId"), "customerId"
FROM "contracts" AS "c"
JOIN "orders" AS "o" ON "c"."id"= "o"."contractId"
GROUP BY "customerId";


--отримати id усіх продуктів, які не куплялися 
SELECT "id" FROM "products"
EXCEPT
SELECT "productId" FROM "orders";
