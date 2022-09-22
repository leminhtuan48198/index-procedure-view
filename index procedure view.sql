create database demo;
use demo;
create table Products(
id int primary key,
productCode varchar(25),
productName varchar(45),
productPrice double,
productAmount int,
productDescription varchar(45),
productStatus varchar(25)
);
insert into products values (1,'TL1','Tu lanh',14000000,10,'hàng mới về','còn mới'),
							(2,'BD1','Bong den',75000,100,'hàng cũ','cũ'),
                            (3,'QD1','Quat dien',450000,30,' hàng cũ','cũ'),
                            (4,'NCD','Noi com dien', 500000,40,'hàng cũ','cũ');
create unique index index_productCode on products(productCode);
create unique index index_name on products(productName);
create unique index index_nameAndPrice on products(productName,ProductPrice);
drop index index_productCode on products;
drop index index_nameAndPrice on products;
drop index index_name on products;
explain select * from products where productCode='QD1';
explain select * from products where productName='Tu lanh';

create view product_view as 
select productCOde, productName, ProductPrice,ProductStatus
from products;
select * from product_view;
create or replace view product_view as 
select productcode, productName, productPrice, productDescription,productStatus
from products
where productStatus='cũ';
drop view product_view;

DELIMITER //
create procedure getAllProduct()
begin 
select * from products;
end;
//DELIMITER ;
call getAllProduct();


DELIMITER //
create procedure addNewProduct(
id int,
productCode varchar(25),
productName varchar(45),
productPrice double,
productAmount int,
productDescription varchar(45),
productStatus varchar(25)
)
begin 
insert into products values(id,
productCode,
productName,
productPrice ,
productAmount ,
productDescription,
productStatus );
end;
// DELIMITER ;
call addNewProduct(5,'MRB1','May rua bat', 600000,34,'tot','tot');


DELIMITER //
create procedure editProductByID(
pid int,
pCode varchar(25),
pName varchar(45),
pPrice double,
pAmount int,
pDescription varchar(45),
pStatus varchar(25)
)
begin 
update products set 
productCode =pCode,
productName=pName,
productPrice=pPrice ,
productAmount=pAmount ,
productDescription=pDescription,
productStatus=pStatus
where id =pid ;
end;
// DELIMITER ;
drop procedure editProductByID;
SET SQL_SAFE_UPDATES = 1;
call editProductById(1,'TL1','Tu lanh',13000000,10,'cũ','cũ');

delimiter //
create procedure deleteProductByID(pid int)
begin 
delete from products where id=pid;
end;
// delimiter ;
drop procedure deleteProductByID;
call deleteProductByID(1);
call getallproduct();
