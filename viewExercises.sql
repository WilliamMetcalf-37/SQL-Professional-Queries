select c.state, Count(c.customer_id)
from customers c
  join sales s on c.customer_id = s.customer_id and s.sales_type_id = 1
group by c.state
order by Count(c.customer_id) desc
limit 5;

select c
.zipcode, Count
(c.customer_id)
from customers c
join sales s on c.customer_id = s.customer_id and s.sales_type_id = 1
group by c.zipcode
order by Count
(c.customer_id) desc
limit 5;

select d.business_name, Count(c.customer_id)
from customers c
  join sales s on c.customer_id = s.customer_id
  join dealerships d on s.dealership_id = d.dealership_id
group by d,business_name
order by Count(c.customer_id) desc
limit 5;

create view employee_type_count
as
select et.name, Count(e.employee_id)
from employeetypes et
  join employees e on et.employee_type_id = e.employee_type_id
group by et.name;

create view customer_secure
as
  select customer_id, first_name, last_name,
    city, state, zipcode
  from customers;