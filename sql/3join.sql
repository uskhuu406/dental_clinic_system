use dental;
select p.first_name,p.last_name,d.first_name,d.last_name,ds.schedule_date,ds.slot_time,a.status
from patient as p
join appointment as a on a.patient_id=p.patient_id
join doctor_schedule as ds on a.schedule_id=ds.schedule_id
join doctor as d on d.doctor_id=ds.doctor_id;


select p.first_name,p.last_name,s.service_name,s.price,a.status
from patient as p
join  appointment as a  on a.patient_id=p.patient_id
join appointment_service as app on app.appointment_id = a.appointment_id
join service as s on  s.service_id=app.service_id;

select  p.first_name, p.last_name,s.service_name,t.note,pay.amount,pay.method
from patient as p
join  appointment as a on p.patient_id=a.patient_id

join  appointment_service as app on  a.appointment_id=app.appointment_id
join service as s on s.service_id =app.service_id
join treatment as t on t.appointment_id=app.appointment_id and t.service_id=app.service_id
join payment as pay on pay.treatment_id=t.treatment_id;
