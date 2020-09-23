begin;

  INSERT INTO public.employeetypes
    (
    name)
  VALUES
    ('Automotive Mechanic');
  INSERT INTO public.employees
    (
    first_name, last_name, email_address, phone, employee_type_id)
  VALUES
    ('Willy', 'Metcalf', 'wm@gmail.com', '1234567890', 8),
    ('Mike', 'Metcalf', 'mm@gmail.com', '1234567890', 8),
    ('Colin', 'Metcalf', 'cm@gmail.com', '1234567890', 8),
    ('Madi', 'Hancock', 'mh@gmail.com', '1234567890', 8),
    ('Brandon', 'Hancock', 'bh@gmail.com', '1234567890', 8)
  select dealership_id
  from dealerships
  where business_name like 'Sollowaye%'
    or business_name like 'Hrishchenko%'
    or business_name like 'Cadreman%';

  INSERT INTO public.dealershipemployees
    (
    employee_id, dealership_id)
  VALUES
    ( 1001, 50),
    ( 1001, 128),
    ( 1001, 322),
    ( 1002, 50),
    ( 1002, 128),
    ( 1002, 322),
    ( 1003, 50),
    ( 1003, 128),
    ( 1003, 322),
    ( 1004, 50),
    ( 1004, 128),
    ( 1004, 322),
    ( 1005, 50),
    ( 1005, 128),
    ( 1005, 322)

  rollback;
  commit;


  begin;
    INSERT INTO public.dealerships
      (
      business_name, phone, city, state, website, tax_id)
    VALUES
      ( 'Felphun Automotive', '1111111111', 'Washginton', 'D.C.', 'www.123.com', '1');

    select *
    from employeetypes
    INSERT INTO public.employees
      (
      first_name, last_name, email_address, phone, employee_type_id)
    VALUES
      ('Justina', 'Vickers', 'jv@gmail.com', '2222222222', 3),
      ('Dominic', 'Kantrude', 'dk@gmail.com', '3333333333', 6),
      ('Jenna', 'Solis', 'js@gmail.com', '4444444444', 4);

    select dealership_id
    from dealerships
    where business_name like 'Scrogges%'
    select employee_id
    from dealershipemployees
    where dealership_id = 129
    select dealership_id
    from dealerships
    order by dealership_id desc

    UPDATE public.dealershipemployees
	SET employee_id=360, dealership_id=1001
	WHERE employee_id = 360 and dealership_id = 129;

    select employee_id
    from employees
    order by employee_id desc

    INSERT INTO public.dealershipemployees
      (
      employee_id, dealership_id)
    VALUES
      (1006 , 129),
      (1007 , 129),
      (1008 , 129);


    rollback;
    commit;