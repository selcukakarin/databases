select * from orders a
inner join
(select distinct order_id, sum(unit_price * quantity * (1-discount)) as subtotal
from order_details
group by order_id) b on a.order_id = b.order_id

select
to_char(shipped_date,'yyyy') YIL,
a.order_id,
b.subtotal
from orders a
inner join
(select distinct order_id, sum(unit_price*quantity*(1-discount)) as subtotal
from order_details
group by order_id) b on a.order_id=b.order_id
where a.shipped_date is not null
order by shipped_date

select * from order_details y
inner join orders d on d.order_id=y.order_id
inner join products b on b.product_id = y.product_id
inner join categories c on c.category_id = b.category_id

select category_name, count(1) from order_details y
inner join orders d on d.order_id=y.order_id
inner join products b on b.product_id = y.product_id
inner join categories c on c.category_id = b.category_id
group by category_name

select category_name, product_name, count(1) from order_details y
inner join orders d on d.order_id=y.order_id
inner join products b on b.product_id = y.product_id
inner join categories c on c.category_id = b.category_id
group by category_name,product_name
having count(1) > 30

-- satılmamış ürünleri bul
select * from products b
left join order_details y
on b.product_id = y.product_id
where y.product_id is null

select * from products y
select * from orders o
select * from order_details

select p.product_name, to_char(shipped_date,'yyyy') YIL, count(1) from products p
left join order_details od on p.product_id=od.product_id
inner join orders o on od.order_id=o.order_id
group by p.product_name, to_char(shipped_date,'yyyy')
order by p.product_name, to_char(shipped_date,'yyyy')   --- bu sorgu yerine dikey sıralama yapacağız.

