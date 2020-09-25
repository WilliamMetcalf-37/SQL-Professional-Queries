explain analyze
SELECT *
from Employees
WHERE employee_type_id = 1

create index employee_type on employees(employee_type_id)
-- .7ms to .254ms

explain analyze
SELECT *
from Sales
WHERE dealership_id = 500;

create index sales_dealership_id on sales(dealership_id)

--.422ms to .064ms 

explain analyze
SELECT *
from customers
WHERE state = 'CA';
create index customer_state on customers(state)
--1.593ms to .092ms

explain analyze
SELECT *
from vehicles
where year_of_car BETWEEN 2018 AND 2020;
create index vehicle_year on vehicles(year_of_car)

--.428ms to .264ms

explain analyze
SELECT *
from vehicles
where floor_price < 30000;
create index vehicle_floor_price on vehicles(floor_price)
--.210ms to .178ms