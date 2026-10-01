-- Active: 1788962989761@@127.0.0.1@3306@dental
use dental;
start transaction;
select * from doctor_schedule
where schedule_id=2
for UPDATE;
insert into appointment(
    patient_id,
    schedule_id,
    status,
    booking_source
)
VALUES(
    1,
    2,
    'booked',
    'web'
);
update doctor_schedule
set status='booked'
where schedule_id=2;
commit;
SELECT * FROM appointment;
SELECT * FROM doctor_schedule;

SELECT SUM(amount) AS total_payment
FROM payment;

SELECT
    d.first_name,
    d.last_name,
    COUNT(a.appointment_id) AS appointment_count
FROM doctor AS d
JOIN doctor_schedule AS ds
    ON d.doctor_id = ds.doctor_id
JOIN appointment AS a
    ON ds.schedule_id = a.schedule_id
GROUP BY d.doctor_id, d.first_name, d.last_name;

select * from service;

delete from service
where service_id=6;

SELECT * from service;

select * from service where price>50000;

update service set price=60000 where service_id=2;
select *from service;
create table service(
    service_id int AUTO_INCREMENT primary key,
    service_name varchar (100) not null,
    price int not null,
    check(price>0)
);

select first_name,last_name from patient
where patient_id=1;

select p.first_name,p.last_name,a.appointment_id,a.status
from patient as p
join appointment as a  on p.patient_id=a.patient_id;

select  p.first_name,p.last_name,s.service_name,s.price
from patient as p
join appointment as a on p.patient_id=a.patient_id
join appointment_service as app on app.appointment_id=a.appointment_id
join service as s on s.service_id = app.service_id;

select d.doctor_id,d.first_name,d.last_name, count(a.appointment_id) as appointment_count
from doctor as d
left join doctor_schedule as ds on d.doctor_id=ds.doctor_id
left join appointment as a on ds.schedule_id=a.schedule_id
group BY
d.doctor_id,d.first_name,d.last_name;

select sum(amount) as total_payment
from payment;

select max(price) as max_price
from service;
SELECT service_name, price
FROM service
WHERE price = (
    SELECT Min(price)
    FROM service
);

update service
set price=90000
where service_id=2;
select * from service;
delete from service
where service_id=7;

select appointment_id,patient_id,STATUS from appointment
where status='booked';

select patient_id, count(appointment_id) as appointment_count
from appointment group BY(patient_id);
insert into service(service_name,price)
values("implant",250000);

update service
set service_name='suvgiin emchilgee '
where service_id=3;

select service_name, price from service
where price>=100000;
