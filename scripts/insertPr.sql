insert into product
values(290,
' 3Com LAN Modem',
30,
0
,sys.xmltype.createxml('
<product>
 <summary>Ideal for small offices!</summary>
 <description>Available in black or white colour</description>
 </product>')
,
13);
insert into product_image
values (290,'/xsql/momnpop/images/LANModem.gif',285,80)
/
