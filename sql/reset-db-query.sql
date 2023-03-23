DROP TABLE IF EXISTS "orders_to_shipments";
DROP TABLE IF EXISTS "shipments";
DROP TABLE IF EXISTS "products";
DROP TABLE IF EXISTS "orders";
DROP TABLE IF EXISTS "contracts";
DROP TABLE IF EXISTS "customers";
DROP TYPE shipment_status;


CREATE TYPE shipment_status AS ENUM('done', 'pending');


CREATE TABLE "products"(
  "id" serial PRIMARY KEY,
  "name" varchar(256) NOT NULL CHECK ("name" != ''),
  "sku" varchar(64) NOT NULL CHECK ("sku" != ''),
  "price" numeric(10,2) NOT NULL CHECK ("price">0)
);

CREATE TABLE "customers" (
  "id" serial PRIMARY KEY,
  "firstName" varchar(64) NOT NULL CHECK ("firstName" != ''),
  "lastName" varchar(64) NOT NULL CHECK ("lastName" != ''),
  "address" JSONB,
  "phone" varchar(32) NOT NULL CHECK ("phone" != '') UNIQUE
);

CREATE TABLE "contracts"(
  "id" serial PRIMARY KEY,
  "numberContract" varchar(32) NOT NULL CHECK ("numberContract" != '') UNIQUE,
  "customerId" serial REFERENCES "customers"("id"),
  "createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "orders"(
  "id" serial PRIMARY KEY,
  "numberOrder" varchar(32) NOT NULL CHECK ("numberOrder" != '') UNIQUE,
  "productId" serial REFERENCES "products"("id"),
  "contractId" serial REFERENCES "contracts"("id"),
  "quantity" integer NOT NULL CHECK ("quantity" > 0 ),
   CONSTRAINT "UNIQUE_PAIR" UNIQUE("numberOrder", "productId")
);

CREATE TABLE "shipments"(
  "id" serial PRIMARY KEY,
  "status" shipment_status NOT NULL,
  "dateShipment" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "orders_to_shipments"(
  "shipmentId" serial REFERENCES "shipments"("id"),
  "orderId" serial REFERENCES "orders"("id"),
  "customersId" serial REFERENCES "customers"("id"),"quantityProducts" integer NOT NULL CHECK ("quantityProducts" > 0 ),
  PRIMARY KEY ("shipmentId", "orderId")
);




