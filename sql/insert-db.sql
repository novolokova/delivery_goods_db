INSERT INTO "products" ( "name", "sku",  "price" )
VALUES
('product-1', '2258', 1000),
('product-2', '2258', 1000),
('product-3', '2258', 1000),
('product-4', '2258', 1000),
('product-5', '2258', 1000),
('product-6', '2258', 1000),
('product-7', '2258', 1000);

INSERT INTO "customers" ( "firstName", "lastName",  "address", "phone" )
VALUES
('Eeeeee', 'Tttttt', '{"town":"zp", "street":"qq"}', '2512529'),
('Rrrrrr', 'Ssssss', '{"town":"rh", "street":"uu"}', '2004789'),
('Mmmmmm', 'Ffffff', '{"town":"zp", "street":"ii"}', '27894789'),
('Pppppp', 'Qqqqqq', '{"town":"po", "street":"qq"}', '25885489');

INSERT INTO "contracts" ( "numberContract", "customerId")
VALUES
('48o', 2), ('58re', 1), ('25it', 3), ('15jy', 2);

INSERT INTO "orders" ( "numberOrder", "productId",  "contractId", "quantity" )
VALUES
('77EE', 2, 2, 10), ('11RR', 1, 3, 12), ('55WW', 2, 2, 3), ('88FF', 3, 1, 7);

INSERT INTO "shipments" ( "status")
VALUES
('done'), ('pending'), ('pending'), ('pending');

INSERT INTO "orders_to_shipments" ( "shipmentId", "orderId",  "customersId", "quantityProducts")
VALUES
(2, 2, 1, 10), (1, 3, 2, 5), (3, 1, 3, 2), (4, 4, 4, 7);


