use dental_clinic;
select patient_id,first_name,last_name,phone
from `Patient`
WHERE patient_id=5;


insert into `Patient`(first_name,last_name,phone)
VALUES('test','patient','8832902')

select patient_id,first_name,last_name,phone
from `Patient`
WHERE phone='8832902';

UPDATE `Patient`
set last_name='update'
where phone='8832902';
SELECT patient_id,first_name,last_name,phone
FROM Patient
WHERE phone='8832902';
