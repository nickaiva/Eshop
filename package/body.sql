CREATE OR REPLACE

PACKAGE BODY MOMNPOP  as

procedure insert_product (
                i_name in varchar2,
                i_price in number,
                i_category_id in number,
               i_doc in clob,
               i_image_id in number,
               i_image_URL in varchar2,
				i_width in number,
				i_height in number
               )
is
  begin
 DBMS_OUTPUT.PUT_LINE('i_name:'||i_name);
 DBMS_OUTPUT.PUT_LINE('i_price:'||i_price);
 DBMS_OUTPUT.PUT_LINE('i_category_id:'||i_category_id);
 DBMS_OUTPUT.PUT_LINE('i_image_id:'||i_image_id);
 DBMS_OUTPUT.PUT_LINE('i_doc:'||i_doc );
  insert into product (
                id,
                name,
                price,
                category_id,
                doc,
                image_id
                )
      values (
                product_seq.nextval,
                i_name,
                i_price,
                i_category_id,
                Sys.XMLType.createXML(i_doc),
                i_image_id
                );
  INSERT INTO prod_cat_joiner (
 								product_id,
 								product_cat_id
  )
   VALUES(
    product_seq.currval,
    i_category_ID
  );
  
    INSERT INTO product_image (
 								id,
 								image_URL,
 								width,
 								height
  )
   VALUES(
    			i_image_id,
               	i_image_URL ,
				i_width ,
				i_height 
  );
 COMMIT;
 exception
 when VALUE_ERROR then
 DBMS_OUTPUT.PUT_LINE('VALUE_ERROR DURING INSERTION');
  rollback;
  when others then
 DBMS_OUTPUT.PUT_LINE('ERROR DURING INSERTION');
  rollback;
end insert_product;

/* Mandatory parameters are i_id and i_category_id , i_image_id*/

procedure update_product (
       			i_id in number,
                i_name in varchar2,
                i_price in number,
                i_category_id in number,
                i_doc in  clob,
       			i_image_id  in number,
       			i_image_URL in varchar2,
				i_width in number,
				i_height in number
               )
is
  begin
  DBMS_OUTPUT.PUT_LINE('i_id:'||i_id);
  DBMS_OUTPUT.PUT_LINE('i_name:'||i_name);
  DBMS_OUTPUT.PUT_LINE('i_price:'||i_price);
  DBMS_OUTPUT.PUT_LINE('i_category_id:'||i_category_id);
  DBMS_OUTPUT.PUT_LINE('i_image_id:'||i_image_id);
  DBMS_OUTPUT.PUT_LINE('i_doc:'||i_doc );
   update product
   set
             name = i_name,
             price=i_price,
             category_id = i_category_id,
             doc=Sys.XMLType.createXML(i_doc) ,
             image_id=i_image_id
   where product.id = i_id;
   
  UPDATE prod_cat_joiner
  SET
    product_id=i_ID,
    product_cat_id=i_category_ID
  WHERE  product_id=i_id;
  
   update product_image
   set
             id = i_image_id,
             image_URL=i_image_URL,
             width =i_width,
             height=i_height
   where product_image.id = i_image_id;
  
  
  
  COMMIT;
  exception
 when VALUE_ERROR then
 DBMS_OUTPUT.PUT_LINE('VALUE_ERROR DURING INSERTION');
   when others then
 DBMS_OUTPUT.PUT_LINE('ERROR DURING UPDATE');
  rollback;
end update_product;


procedure delete_product (
               i_id in number
  )
  is
begin
   delete from product
   where id = i_id;
   delete FROM  prod_cat_joiner
   WHERE product_id=i_ID;
   COMMIT;
   exception
   when others then
   DBMS_OUTPUT.PUT_LINE('ERROR DURING DELETION');
   rollback;
end delete_product;


 PROCEDURE get_product_xml (product_id NUMBER)
 IS
   ctx dbms_xmlgen.ctxhandle;
   OUTPUT_var clob;
   OUTPUT_str VARCHAR2(4000);
   offset_var integer:=1;
   buf_size integer:=4000;
 BEGIN
    SELECT DISTINCT a.doc.getStringVal() INTO OUTPUT_var
    FROM product a
    WHERE a.id = product_id;
     while offset_var< dbms_lob.getlength(OUTPUT_var) loop
      dbms_lob.read(OUTPUT_var,buf_size,offset_var,OUTPUT_str);
      htp.prn(OUTPUT_str);
      offset_var:=offset_var+buf_size;
    END loop;
  exception
  when others then
  DBMS_OUTPUT.PUT_LINE('ERROR DURING Get_product_xml');
  
  END get_product_xml;
end MOMNPOP;
