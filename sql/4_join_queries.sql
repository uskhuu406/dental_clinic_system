select p.first_name ,p.last_name,a.scheduled_at,a.STATUS
from `Patient` p
join `Appointment` A ON a.patient_id=p.patient_id;


select a.appointment_id,a.scheduled_at, s.first_name,s.last_name
from `Appointment`a
join `Staff` s on a.doctor_id=s.staff_id;

SELECT a.appointment_id, a.scheduled_at, s.service_name, s.price
FROM Appointment a
JOIN AppointmentService aps ON aps.appointment_id = a.appointment_id
JOIN Service s ON s.service_id = aps.service_id;
select s.first_name,s.last_name,ss.day_of_week,ss.start_time,ss.end_time
from Staff s
join `StaffSchedule` ss on s.staff_id=ss.staff_id
where s.role ='doctor';

select p.first_name,p.last_name,s.service_name,t.diagnosis,t.tooth_number,t.performed_at
from `Patient` p
join `Appointment` a on a.patient_id=p.patient_id
join `Treatment` t on t.appointment_id=a.appointment_id
join  `Service` s on s.service_id=t.service_id;

select a.appointment_id, sum(p.amount) as total_paid
from `Appointment` a
join `Payment` p on p.appointment_id=a.appointment_id
GROUP BY a.appointment_id;

SELECT a.appointment_id,
       COALESCE(t.total_price, 0) AS total_price,
       COALESCE(p.total_paid, 0) AS total_paid,
       COALESCE(t.total_price, 0) - COALESCE(p.total_paid, 0) AS balance
FROM Appointment a
LEFT JOIN (
    SELECT appointment_id, SUM(unit_price) AS total_price
    FROM Treatment
    GROUP BY appointment_id
) t ON t.appointment_id = a.appointment_id
LEFT JOIN (
    SELECT appointment_id, SUM(amount) AS total_paid
    FROM Payment
    GROUP BY appointment_id
) p ON p.appointment_id = a.appointment_id;
