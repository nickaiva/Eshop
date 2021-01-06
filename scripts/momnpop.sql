create table product_image(
id number unique,
image_url varchar2(100),
width number, 
height number)


create TABLE product_category
(id NUMBER CONSTRAINT product_category_pk primary key ,
name varchar2(100),
description varchar2(1000)
);

create TABLE product
(id NUMBER CONSTRAINT product_pk primary key ,
name varchar2(100),
price NUMBER,
CATEGORY_id NUMBER CONSTRAINT prod_cat_fk references product_category(id),
doc sys.xmltype,
image_id number unique
);

alter table product add (image_id number unique)

create TABLE promotion
(id NUMBER CONSTRAINT promotion_pk primary key ,
slot NUMBER,
product_id NUMBER CONSTRAINT product_fk references product(id),
url varchar2(200),
status varchar2(10)
);
create TABLE prod_cat_joiner
(product_id NUMBER ,
product_cat_id NUMBER,
constraint  prod_cat_joiner_pk primary key (product_id ,product_cat_id)
);

create sequence  product_seq;
create sequence product_cat_seq;
create sequence promotion_seq;

create index product_doc_index on product(doc)
indextype is ctxsys.context

alter index product_doc_index rebuild 

update product
set doc= sys.xmltype.createxml('<size>Mini</size>')
where name='Wireless Networking'

update product_category
set name='Traditionele deutsche Produkte'
where name='Traditionele deutche Produkte'

 update product
 set category_id=&category_id
 where name='Bathroom soap'

/
create OR REPLACE PROCEDURE get_product_xml(product_id NUMBER)IS
OUTPUT_var VARCHAR2(4000);
  BEGIN
  SELECT a.doc.getStringVal() INTO OUTPUT_var
  FROM product a
  WHERE a.id= product_id;
  htp.PRN(OUTPUT_var);
  END;
/
CREATE OR REPLACE PROCEDURE MOMNPOP.get_product_xml (product_id NUMBER)IS
ctx dbms_xmlgen.ctxhandle;
 OUTPUT_var clob;
 OUTPUT_str VARCHAR2(4000);
 offset_var integer:=1;
 buf_size integer:=4000;
  BEGIN
   
    SELECT DISTINCT a.doc.getStringVal() INTO OUTPUT_var
    FROM product a
    WHERE a.id = product_id;
 while offset_var< dbms_lob.getlength(OUTPUT_var)loop   
     dbms_lob.read(OUTPUT_var,buf_size,offset_var,OUTPUT_str);
     htp.prn(OUTPUT_str);
    offset_var:=offset_var+buf_size;
 END loop;
  END;


insert into product_category
values(2,'Kitchen and cooking','Household equipment')

insert into product
values(8,'Rocker chair',50.5,6,sys.xmltype.createxml('<product><summary>Made of Pinetree wood</summary><description>Available colours are natural and white</description><dimensions><long-val>0,35</long-val><long-unit>metres</long-unit><wide-val>0,75</wide-val>
<wide-unit>metres</wide-unit>		
<tall-val>1,35</tall-val>
<tall-unit>metres</tall-unit>
</dimensions>
</product>'),null)

update product
set doc=sys.xmltype.createxml('<product><summary>Pinetree wood</summary><description>Natural and white</description><dimensions><long-val>0,35</long-val><long-unit>metres</long-unit><wide-val>0,75</wide-val><wide-unit>metres</wide-unit><tall-val>1,35</tall-val>
<tall-unit>metres</tall-unit>
</dimensions>
</product>')
where id=0
/
insert into prod_cat_joiner
values(9,1)

insert into product_image
values (13,'/xsql/momnpop/images/book13.jpg',300,300)

update product_image
set image_url='/xsql/momnpop/images/sample1.jpg'
where id=1

1			<product> <summary>Made of premium oaktree wood</summary> </product>  1  
0  Garden Armchair  69  1  <product> <summary>Pinetree wood</summary> <description>Natural</description  0  
2  Basketball  12  0  <product> <summary>Gemuine natural leather!</summary> </product>  2  
3  Football  11  0  <product> <summary>Hand sewn and stitched</summary> </product>     
4  Tennisball  10  0  <product> <summary>For all kinds of courts</summary> </product>     
6  Bathroom soap  5,5  7  <product> <summary>For oily skins</summary> </product>     
7  Shower gel  5,85  7  <product> <summary>For all kinds of skins</summary> </product>     
8  Wonder Bra  5,5  6  <product> <summary>Gives a silky touch!</summary> </product>     
9  Rocker chair  50,5  1  <product> <description>Olive tree wood</description> </product>     




insert into product
values(9,'Traditional cakes',50.5,8,sys.xmltype.createxml('<product>
<summary>Made of fresh ingredients</summary>
</product>'),0)

insert into prod_cAT_JOINER
values(7,0)
insert into prod_cAT_JOINER
values(3,0)
insert into prod_cAT_JOINER
values(6,0)