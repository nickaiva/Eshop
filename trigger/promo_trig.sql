CREATE OR REPLACE TRIGGER "MOMNPOP"."PROMO_TRIG" AFTER INSERT ON "MOMNPOP"."PRODUCT_IMAGE" 
REFERENCING OLD AS OLD NEW AS NEW 
FOR EACH ROW 
 CALL logPromotion(:new.ID,:new.image_URL);