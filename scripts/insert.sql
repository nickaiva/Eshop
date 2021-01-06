
insert into product
values(4,'Wonder Bra',50,6,sys.xmltype.createxml('
<product>
 <summary>Made of fine velvet and silk!</summary>
 <description>Available colours are brown and  white</description>
 <dimensions><long-val>0,35</long-val>
  <long-unit>metres</long-unit>
  <wide-val>0,35</wide-val>
  <wide-unit>metres</wide-unit>		
  <tall-val>0,35</tall-val>
  <tall-unit>metres</tall-unit>
 </dimensions>
</product>'),NULL)

insert into product
values(5,' Night knickers',50,6,sys.xmltype.createxml('
<product>
 <summary>Made of fine velvet and silk!</summary>
 <description>Available colours are brown, black and  white</description>
 <dimensions><long-val>0,35</long-val>
  <long-unit>metres</long-unit>
  <wide-val>0,35</wide-val>
  <wide-unit>metres</wide-unit>		
  <tall-val>0,35</tall-val>
  <tall-unit>metres</tall-unit>
 </dimensions>
</product>'),NULL)

insert into product
values(10,' Casual pants',50,6,sys.xmltype.createxml('
<product>
 <summary>Made of fine denim cotton !</summary>
 <description>Available colours are brown, black and  white</description>
 <clothing-size-list>
  <size>medium</size>
   </clothing-size-list>
</product>'),NULL)

insert into product
values(12,' Casual shirts',50,3,sys.xmltype.createxml('
<product>
 <summary>Made of fine denim cotton !</summary>
 <description>Available colours are brown, black and  white</description>
 <clothing-size-list>
  <size>medium</size>
   </clothing-size-list>
</product>'),NULL)

insert into product
values(13,
' Developing XSQL applications ',
30,
0
,sys.xmltype.createxml('
<product>
 <summary>Learn how to build web applications </summary>
 <description>Available in hard or paper cover</description>
 </product>')
,
13)


insert into product_image
values (13,'/xsql/momnpop/images/book13.jpg',300,300)
/

insert into product
values(product_seq.currval,
' 3Com LAN Modem',
30,
0
,sys.xmltype.createxml('
<product>
 <summary>Ideal for small offices!</summary>
 <description>Available in black or white colour</description>
 </product>')
,
product_seq.currval)
insert into product_image
values (product_seq.currval,'/xsql/momnpop/images/LANModem.gif',285,80)

insert into prod_cat_joiner
values(4,6)
insert into prod_cat_joiner
values(5,6)
insert into prod_cat_joiner
values(10,3)
insert into prod_cat_joiner
values(11,3)
insert into prod_cat_joiner
values(13,0)
/
