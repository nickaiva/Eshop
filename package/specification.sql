/* SPECIFICATION */

CREATE OR REPLACE 
PACKAGE MOMNPOP is

procedure insert_product (

                i_name in varchar2,
                i_price in number,
                i_category_id in number,
                i_doc in  clob,
  				i_image_id in number,
				i_image_URL in varchar2,
				i_width in number,
				i_height in number
                              );
procedure update_product (
                i_id in number,
                i_name in varchar2,
                i_price in number,
                i_category_id in number,
                i_doc in  clob,
                i_image_id in number,
                i_image_URL in varchar2,
				i_width in number,
				i_height in number
               );


procedure delete_product (
               				i_id in number);

PROCEDURE         get_product_xml (
									product_id NUMBER);

END MOMNPOP;

