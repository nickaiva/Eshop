PROMPT create table '"PROD_CAT_JOINER"'
CREATE TABLE "PROD_CAT_JOINER"
(
"PROD_ID" NUMBER NOT NULL,
"PROD_CAT_ID" NUMBER NOT NULL
)
;
PROMPT create table '"PRODUCT_IMAGE"'
CREATE TABLE "PRODUCT_IMAGE"
(
"ID" NUMBER NOT NULL,
"IMAGE_URL" VARCHAR2 (100),
"WIDTH" NUMBER,
"HEIGHT" NUMBER
)
;
PROMPT create table '"PRODUCT"'
CREATE TABLE "PRODUCT"
(
"ID" NUMBER NOT NULL,
"NAME" VARCHAR2 (100),
"PRICE" NUMBER,
"CATEGORY_ID" NUMBER NOT NULL,
"DOC" XMLTYPE,
"IMAGE_ID" NUMBER,
"PRODUCT_CATEGORY_ID" NUMBER NOT NULL
)
;
PROMPT create table '"PRODUCT_CATEGORY"'
CREATE TABLE "PRODUCT_CATEGORY"
(
"ID" NUMBER NOT NULL,
"NAME" VARCHAR2 (100),
"DESCRIPTION" VARCHAR2 (1000)
)
;
PROMPT create table '"PROMOTION"'
CREATE TABLE "PROMOTION"
(
"ID" NUMBER NOT NULL,
"SLOT" NUMBER,
"URL" VARCHAR2 (20),
"STATUS" VARCHAR2 (200)
)
;
PROMPT create primary key constraint on '"PROD_CAT_JOINER"'
ALTER TABLE "PROD_CAT_JOINER"
ADD CONSTRAINT "PROD_CAT_JOINER_PK" PRIMARY KEY
(
"PROD_ID",
"PROD_CAT_ID"
)
 ENABLE
;
PROMPT create primary key constraint on '"PRODUCT_IMAGE"'
ALTER TABLE "PRODUCT_IMAGE"
ADD CONSTRAINT "PRODUCT_IMAGE_PK" PRIMARY KEY
(
"ID"
)
 ENABLE
;
PROMPT create primary key constraint on '"PRODUCT"'
ALTER TABLE "PRODUCT"
ADD CONSTRAINT "PRODUCT_PK" PRIMARY KEY
(
"ID"
)
 ENABLE
;
PROMPT create unique key constraint on '"PRODUCT"'
ALTER TABLE "PRODUCT"
ADD CONSTRAINT "PRODUCT_UK1" UNIQUE
(
"IMAGE_ID"
)
 ENABLE
;
PROMPT create primary key constraint on '"PRODUCT_CATEGORY"'
ALTER TABLE "PRODUCT_CATEGORY"
ADD CONSTRAINT "PRODUCT_CATEGORY_PK" PRIMARY KEY
(
"ID"
)
 ENABLE
;
PROMPT create primary key constraint on '"PROMOTION"'
ALTER TABLE "PROMOTION"
ADD CONSTRAINT "PROMOTION_PK" PRIMARY KEY
(
"ID"
)
 ENABLE
;
PROMPT create foreign key constraint on '"PROD_CAT_JOINER"'
ALTER TABLE "PROD_CAT_JOINER"
ADD CONSTRAINT "PROD_CAT_JOINER_FK" FOREIGN KEY
(
"PROD_CAT_ID"
)
REFERENCES "PRODUCT"
(
"ID"
) ENABLE
;
PROMPT create foreign key constraint on '"PRODUCT_IMAGE"'
ALTER TABLE "PRODUCT_IMAGE"
ADD CONSTRAINT "PRODUCT_IMAGE_FK" FOREIGN KEY
(
"ID"
)
REFERENCES "PRODUCT"
(
"ID"
) ENABLE
;
PROMPT create foreign key constraint on '"PRODUCT_CATEGORY"'
ALTER TABLE "PRODUCT_CATEGORY"
ADD CONSTRAINT "PRODUCT_CATEGORY_FK" FOREIGN KEY
(
"ID"
)
REFERENCES "PROD_CAT_JOINER"
(
"PROD_ID",
"PROD_CAT_ID"
) ENABLE
;
PROMPT create foreign key constraint on '"PROMOTION"'
ALTER TABLE "PROMOTION"
ADD CONSTRAINT "PROMOTION_FK" FOREIGN KEY
(
"ID"
)
REFERENCES "PRODUCT"
(
"ID"
) ENABLE
;
