# Kaynak : https://www.w3schools.com/sql/sql_ref_mysql.asp

# Kaynak : https://dev.mysql.com/doc/workbench/en/wb-keys.html
-- Mysql workbench shortcuts
-- Function	Keyboard Shortcut	Context
-- Undo	Modifier+Z	Model, EER Diagram
-- Redo	Modifier+Y, Modifier+Shift+Z (macOS)	Model, EER Diagram
-- Cut	Modifier+X	All
-- Copy	Modifier+C	All
-- Paste	Modifier+V	All
-- Delete	Modifier+Delete, Command+BackSpace (macOS)	All
-- Edit Selected	Modifier+E	Model, EER Diagram
-- Edit Selected in New Window	Modifier+Shift+E	Model, EER Diagram
-- Select All	Modifier+A	EER Diagram
-- Find	Modifier+F	All
-- Find Advanced	Modifier+Alt+F	All
-- Find Next	F3	All
-- Find Previous	Shift+F3	All
-- Search and Replace	Modifier+Shift+F	All
-- Beautify Query	Modifier+B	SQL Editor
-- Comment/Uncomment lines of SQL	Modifier+/	SQL Editor
-- Auto-Complete SQL	Modifier+Space	SQL Editor

## Select
select * from shopApp.products;
select Name from shopApp.products;
select Name,Price from shopApp.products;
select Name as ProductName,Price as Fiyat from shopApp.products;

## where 
select * from shopApp.products where Id=6;
select * from shopApp.products where Price=150;
select * from shopApp.products where Price>=200;
select Name,Price from shopApp.products where Price>=150;
select * from shopApp.products where Price>=100 and Price <= 150;
select * from shopApp.products where Id=6 or Id=7;
select * from shopApp.products where Name = 'Samsung Note 6';
select * from shopApp.products where Name != 'Samsung Note 6';
select * from shopApp.products where NOT Name = 'Samsung Note 6';
select * from shopApp.products where Name = 'Samsung Note 6' and Price = 250;
select * from shopApp.products where Name = 'Samsung Note 6' and (Price =100 Or Price=160);

# Between, in, like
select * from shopApp.products where Price Between 100 and 300;
select * from shopApp.products where Id Between 7 and 9;
select * from shopApp.products where Id NOT Between 7 and 9;
select * from shopApp.products where category='PC';
select * from shopApp.products where category in ('Telefon','PC');
select * from shopApp.products where category not in ('Telefon');
select * from shopApp.products where Id not in ('1','6');
select * from shopApp.products where Name LIKE '%Samsung%';
select * from shopApp.products where Name LIKE 'I%';
select * from shopApp.products where Name LIKE '%6';
select * from shopApp.products where Name LIKE '_a%';
select * from shopApp.products where Name LIKE 'S_m%';
select * from shopApp.products where Name not LIKE '%Iphone%';
select * from shopApp.products where Name LIKE '%Iphone%' and Price>=160;
select * from shopApp.products where Name LIKE '%Iphone%' and Description LIKE 'gg tel';

# Order
select * from shopApp.products order by Price;
select * from shopApp.products order by Name;
select * from shopApp.products order by Name ASC;
select * from shopApp.products order by Name DESC;
select * from shopApp.products order by Category;
select * from shopApp.products order by Category, Price;
select * from shopApp.products order by Category DESC, Price ASC;

# min(), max(), count(), limit(), sum(), trim(), replace()
select min(Price) as 'minimum fiyat' from shopApp.products ;
select max(Price) as 'maksimum fiyat' from shopApp.products ;
select name,price from shopApp.products order by price;
select * from shopApp.products  LIMIT 2;
select * from shopApp.products order by price desc LIMIT 2 ;
select * from shopApp.products order by price desc LIMIT 2 ;
select count(*) from shopApp.products;
select count(Name) from shopApp.products;
select count(Id) from shopApp.products;
select avg(Price) as ortalama from shopApp.products;
select sum(Price) as toplam from shopApp.products;
select sum(Price*stock) as toplam from shopApp.products;

# String Functions
select LENGTH('SELÇUK AKARIN');
select LENGTH('SELÇUK AKARIN') as karaktersayisi;
select name,length(name) as karatersay from shopApp.products;
select name,left(name,3) from shopApp.products;
select name,concat(left(name,3),'...') from shopApp.products;
select right('Selçuk Akarın',6) as name;
select name,right(description,5) as name from shopApp.products;
select name,lower(name) as name from shopApp.products;
select name,lower(replace(name,' ','-')) as name from shopApp.products;
select trim('    Selçuk Akarın   ');
select concat(trim('    Selçuk Akarın   '),'---');
select name,trim(name) from shopApp.products;
select name,ltrim(name) from shopApp.products;
select name,rtrim(name) from shopApp.products;

# group by - distict
select * from shopApp.products;
select distinct Category from shopApp.products;
select Category from shopApp.products group by category;
select Category, Count(*) as adet from shopApp.products group by category;
select Category, Sum(Price) as toplam from shopApp.products group by category;
select Category, Avg(Price) as ortalama from shopApp.products group by category;
select Category, Max(Price) as ortalama from shopApp.products group by category;
select Category, Min(Price) as ortalama from shopApp.products group by category;
select Category, Avg(Price) as ortalama from shopApp.products where price>150 group by category;
select Category, Avg(Price) as ortalama from shopApp.products group by category having Count(*)>1;

# insert

select * from shopApp.products;
INSERT INTO shopApp.products (name,price,ImageUrl,Category,Description,stock) VALUES ('gozluk',120,'11.jpeg','Gozluk','gg gozluk',6);
INSERT INTO shopApp.products (name,price,Category,stock) VALUES ('gozluk',120,'Gozluk',6);
select Count(*) adet from shopApp.products;
select Count(ImageUrl) adet from shopApp.products;

# update

select * from shopApp.products;
Update shopApp.products
Set Name = 'Samsung S7'
where Id = 6;

Update shopApp.products
Set Name = 'Samsung S7'
where Price > 100;

SET SQL_SAFE_UPDATES=0;
Update shopApp.products Set Price = Price+1000;

SET SQL_SAFE_UPDATES=0;

SET SQL_SAFE_UPDATES=0;
Update shopApp.products Set Price = Price*1.5
Where Category='Telefon';

SET SQL_SAFE_UPDATES=0;
Update shopApp.products Set ImageUrl = 'default.jpg'
Where ImageUrl IS NULL;

# DELETE
select * from shopApp.products;
delete from shopApp.products;
delete from shopApp.products where Id=6;
delete from shopApp.products where price>2000 and category='PC';
delete from shopApp.products where description IS NULL;


# inner join 2 table
select * from orders inner join customers
on orders.customer_id = customers.id

select orders.id,customers.first_name,orders.order_date from orders inner join customers
on orders.customer_id = customers.id

select o.id,c.first_name,o.order_date from orders o inner join customers c
on o.customer_id = c.id

select o.id,CONCAT(c.first_name,c.last_name) 'customer name',o.order_date from orders o 
inner join customers c on o.customer_id = c.id

select o.id,CONCAT(c.first_name,c.last_name) customername,o.order_date from orders o 
inner join customers c on o.customer_id = c.id

select o.id,CONCAT(c.first_name,c.last_name) 'customer name',o.order_date from orders o 
inner join customers c on o.customer_id = c.id
where c.city='New York'


# inner join 2+ table

select o.id,CONCAT(c.first_name,c.last_name) customername,o.order_date from orders o 
inner join customers c on o.customer_id = c.id
order by customername

select o.id order_id, p.product_name,(od.unit_price * od.quantity) total,CONCAT(c.first_name,c.last_name) customername,o.order_date from orders o 
inner join customers c on o.customer_id = c.id
inner join order_details od on od.order_id = o.id
inner join products p on p.id=od.product_id
order by customername

select o.id order_id, p.product_name,(od.unit_price * od.quantity) total,CONCAT(c.first_name,c.last_name) customername,o.order_date from orders o 
inner join customers c on o.customer_id = c.id
inner join order_details od on od.order_id = o.id
inner join products p on p.id=od.product_id
order by o.id

select o.id order_id,sum(od.unit_price * od.quantity) total,CONCAT(c.first_name,c.last_name) customername,o.order_date from orders o 
inner join customers c on o.customer_id = c.id
inner join order_details od on od.order_id = o.id
inner join products p on p.id=od.product_id
group by o.id


# left join
# order'ı olan ve customer'ı olan veriler gelecek - kesişim
select c.first_name,o.id as order_id from customers c
inner join orders o
on o.customer_id=c.id


## order'ı olmayan customer bilgileri ve order'ı olan customer bilgileri gelecek
select c.first_name,o.id as order_id from customers c
left join orders o
on o.customer_id=c.id
order by c.first_name

## order'ı olmayan customer bilgileri gelecek
select c.first_name,o.id as order_id from customers c
left join orders o
on o.customer_id=c.id
where o.id is null
order by c.first_name

select p.id,p.product_name,od.id from products p left join order_details od
on p.id = od.product_id

## hiç satılmamış ürünleri listeler - product tablosunda olup order detail'da olmayanları listeler
select p.id,p.product_name,od.id from products p 
left join order_details od on p.id = od.product_id
where od.id is null


# right join
select * from orders o
right join employees e on e.id = o.employee_id

select o.id,e.first_name from orders o
right join employees e on e.id = o.employee_id
order by o.id

select o.id,e.first_name from orders o
right join employees e on e.id = o.employee_id
where o.id is null
order by o.id


# join practice

-- Hangi üründen kaç tane satılmış?

select p.id, p.product_name, count(*) adet from products p 
inner join order_details od on p.id=od.product_id
group by p.id
order by adet

-- En çok kazandıran ilk 3 ürün hangisidir?

select p.id, p.product_name, sum(od.quantity*od.unit_price) as kazanc from products p 
inner join order_details od on p.id = od.product_id
group by p.id
order by kazanc desc
limit 3

-- Hangi kargo şirketlerine toplan ne kadar ödeme yapılmış?

select s.company, sum(o.shipping_fee) as total from orders o 
inner join shippers s on s.id = o.shipper_id
group by s.id
order by total

-- En uygun kargo ücreti hangisidir?
-- kriterler:
-- shipping_fee sıfırdan farklı olmalı- ücretsiz kargolar çıkarıldı
-- kargo şirketi ile 10 seferder fazla çalışılmış olmalı

select s.company, avg(o.shipping_fee) as ortalama from orders o 
inner join shippers s on s.id = o.shipper_id
where o.shipping_fee >0
group by s.id
having count(o.id)>10


# seçilen kayıtların tabloya eklenmesi

# çalışanların kaç satış yaptığı bilgisi listelenir
select e.id,CONCAT(e.first_name,' ',e.last_name) as fullname ,e.email_address,count(o.id) as adet from employees e
left join orders o
on e.id = o.employee_id
group by e.id

## önce employee_performance adlı bir tablo oluşturuldu
insert into employee_performance(employee_id,fullname, email,satis_adeti)
select e.id,CONCAT(e.first_name,' ',e.last_name) as fullname ,e.email_address,count(o.id) as adet from employees e
left join orders o
on e.id = o.employee_id
group by e.id

## join ile update kullanımı
-- employee_perfomance'daki email alanında bazı kayıtlara updated eklendi.
-- bu eklenen kayıtları bulup employees tablosunda da aynı kayıtların email alanlarının değiştirilmesi sağlandı.
update employees e
inner join employee_performance ep on e.id = ep.employee_id
set e.email_address = ep.email
where ep.email like '%updated%'

# join ile delete
-- siparişi olmayan müşterileri siliniz.
# önce siparişi olmayan müşterileri tespit etmek gerekir
select c.id, c.first_name,o.customer_id from customers c
left join orders o on o.customer_id = c.id
# burada listelenen verilerin o.customer_id alanı null ise siparişi olmayan müşteridir demektir.

# siparişi olmayan ( order tablosunda kaydı olamayan ) müşteriler çekilir
select c.id, c.first_name,o.customer_id from customers c
left join orders o on o.customer_id = c.id
where o.customer_id is null

# siparişi 
delete customers from customers 
left join orders on orders.customer_id = customers.id
where orders.customer_id is null and customers.id = 13


# union ile çalışma
-- iki taploda bulunan tüm mailleri al diyoruz - unique değerler gelir
select email from employee_performance
union
select email_address from employees

-- iki taploda bulunan tüm mailleri al diyoruz
select email from employee_performance
union all
select email_address from employees

-- iki taploda bulunan tüm şehirleri al diyoruz - unique
select city from employees
union
select city from customers

-- iki taploda bulunan tüm şehirleri al diyoruz
select city from employees
union all
select city from customers

-- iki taploda bulunan tüm city ve country_region'ları al diyoruz - unique
select city,country_region from employees
union
select city,country_region from customers

-- iki taploda bulunan tüm city ve country_region'ları al diyoruz
select city,country_region from employees
union all
select city,country_region from customers


# subquery
select id,order_date from orders
where status_id = (select id from orders_status where status_name = 'Closed')

select id,order_date from orders
where status_id = (select id from orders_status where status_name = 'Shipped')

select c.id,c.first_name,c.last_name ,
(select count(o.id) from orders o where o.customer_id=c.id) as ordercount
from customers c

select id,product_name from products
where id in(1,2,3)

select id,product_name from products
where id in(select product_id from order_details where quantity>100)

select id, first_name from customers c
where EXISTS (select id from orders o where c.id=o.customer_id and payment_type='Credit Card')

select id, first_name, last_name from customers c
where EXISTS
(select count(*) from orders o where c.id=o.customer_id group by o.customer_id having count(*)>2)


# ALL - ANY
select id, product_name, list_price from products
where id in(2,3,6,7)

-- order details'daki quantity değeri 10'dan büyük olan products'lar listelenir
-- any = gelen sonuçlardan herhangi biri sağlasa yeter
select id,product_name, list_price from products
where id = any(select product_id from order_details where quantity > 10)

select id,product_name, list_price from products
where id > any(select product_id from order_details where quantity > 10)

-- all = gelen sonuçların hepsi şartı sağlamalı
select id,product_name, list_price from products
where id > all(select product_id from order_details where quantity > 10)

select avg(salary) from customers2

-- ortalama maasın üzerindeki kişileri al
select * from customers2
where salary > any (select avg(salary) from customers2)

-- ortalama maasın altındaki kişileri al
select * from customers2
where salary < any (select avg(salary) from customers2)

select * from customers2 
where age > any(select age from customers2 where salary>5000)

-- where age > 23 and age > 27
select * from customers2 
where age > all(select age from customers2 where salary>5000)











