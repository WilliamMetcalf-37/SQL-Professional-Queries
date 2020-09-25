--1
create or replace function add_acc_recieveable
()
returns trigger
language plpgsql
as $$
Begin
  insert into accountsrecievable
    (credit_amount, date_received,sale_id)
  values
    (new.deposit, CURRENT_DATE, new.sale_id);

  return null;
end;
$$

create trigger new_sale_made
after
insert
on
sales
for
each
row
execute procedure add_acc_recieveable
();

ALTER TABLE sales
ADD COLUMN sale_returned boolean;
--2
create or replace function add_acc_recievable_debit
()
returns trigger
language plpgsql
as $$
Begin
  insert into accountsrecievable
    (debit_amount, date_received,sale_id)
  values
    (new.deposit, CURRENT_DATE, new.sale_id);
  return null;
end;
$$

create trigger sale_returned
after
update
on sales
for each row
when
(new.sale_returned = true)
execute procedure add_acc_recievable_debit
();



-- testing 1 and 2
INSERT INTO public.sales
  (
  sales_type_id, vehicle_id, employee_id, customer_id, dealership_id, price, deposit, purchase_date, pickup_date, invoice_number, payment_method, sale_returned)
VALUES
  ( 2, 1, 1, 1, 1, 12000, 500, CURRENT_DATE, CURRENT_DATE, 123, 'visa', false);


update sales set sale_returned = true where sale_id = 1

select *
from accountsrecievable
select *
from sales
order by sale_id desc


--3
create or replace procedure new_employee
(in emp_fname varchar, in emp_lname varchar, 
							  in emp_email varchar,in emp_phone varchar,
							 in emp_type_id int, in dept1_id int, in dept2_id int)
language plpgsql
as $$
declare
new_emp_id int;
begin
  INSERT INTO public.employees
    (
    first_name, last_name, email_address, phone, employee_type_id)
  VALUES
    ( emp_fname, emp_lname, emp_email, emp_phone, emp_type_id)
  returning employee_id into new_emp_id;
INSERT INTO public.dealershipemployees
  (
  employee_id, dealership_id)
VALUES
  ( new_emp_id, dept1_id);
INSERT INTO public.dealershipemployees
  (
  employee_id, dealership_id)
VALUES
  ( new_emp_id, dept2_id);
commit;
end
$$;
-- run procedure
call new_employee
('test','test','test','test',1,2,3)
-- check if things added
select *
from dealershipemployees
order by employee_id desc
--4 

create or replace procedure remove_employee
(in emp_id int)
language plpgsql
as $$
begin
  update employees 
set isActive = false
where employee_id = emp_id;

  delete from dealershipemployees where employee_id = emp_id;
  commit;
end;
$$
select *
from dealershipemployees
order by employee_id
select*
from employees
order by employee_id
call remove_employee(11)