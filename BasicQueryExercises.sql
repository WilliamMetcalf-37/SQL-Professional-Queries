select d.business_name, SUM(s.price)
from sales s
join dealerships d 
on s.dealership_id = d.dealership_id
group by d.dealership_id
having s.sales_type_id = 1;




select d.business_name, SUM(s.price)
from sales s
join dealerships d 
on s.dealership_id = d.dealership_id
group by d.dealership_id, s.sales_type_id, s.purchase_date
having s.sales_type_id = 1
and date_trunc('month', s.purchase_date) = date_trunc('month', CURRENT_DATE);

select d.business_name, SUM(s.price)
from sales s
join dealerships d 
on s.dealership_id = d.dealership_id
group by d.dealership_id, s.sales_type_id, s.purchase_date
having s.sales_type_id = 1
and date_trunc('year', s.purchase_date) = date_trunc('year', CURRENT_DATE);

select CONCAT(e.first_name, e.last_name) as employee_name, SUM(s.price)
from sales s 
join employees e on s.employee_id = e.employee_id
group by e.employee_id;



select vm.name, count(vm.name)
from vehicles v
join sales s on v.vehicle_id = s.vehicle_id
join vehicletypes vt on v.vehicle_type_id = vt.vehicle_type_id
 join vehiclemodels vm on vt.vehicle_model_id = vm.vehicle_model_id
 group by vm.name, s.sale_id
 having s.sale_id = null
 order by count(vm.name) desc
 limit 1;


select vm.name, count(vm.name)
from vehicles v
join sales s on v.vehicle_id = s.vehicle_id
join vehicletypes vt on v.vehicle_type_id = vt.vehicle_type_id
join vehiclemodels vm on vt.vehicle_model_id = vm.vehicle_model_id
group by vm.name
order by count(vm.name) desc
limit 1;

select vm.name, count(vm.name)
from vehicles v
join sales s on v.vehicle_id = s.vehicle_id
join vehicletypes vt on v.vehicle_type_id = vt.vehicle_type_id
join vehiclemodels vm on vt.vehicle_model_id = vm.vehicle_model_id
group by vm.name
order by count(vm.name)
limit 1;

select et.name, Count(e.employee_type_id) as the_count
from employeetypes et
join employees e on e.employee_type_id = et.employee_type_id
group by et.name;


select d.business_name, count(e.employee_id) as the_count
from dealerships d 
left join dealershipemployees de on de.dealership_id = d.dealership_id
left join employees e on de.employee_id = e.employee_id and e.employee_type_id = 2
group by d.dealership_id
order by count(e.employee_id) desc;

select concat(e.first_name, e.last_name) as employee_name, Sum(s.price)
from employees e 
join sales s on e.employee_id = s.employee_id and s.sales_type_id = 2
group by e.employee_id
order by sum(s.price) desc
limit 2;