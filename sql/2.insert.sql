use dental;
insert into app_user(phone,email,password,role)
VALUES
('99112233', 'patient1@gmail.com', 'pass123', 'patient'),
('88112233', 'doctor1@gmail.com', 'pass123', 'doctor'),
('77112233', 'reception@gmail.com', 'pass123', 'receptionist'),
('66112233', 'admin@gmail.com', 'pass123', 'admin');

insert into patient(app_id,first_name,last_name,gender,birth_date)
values(1,
    'Bat',
    'Erdene',
    'male',
    '2001-05-15'
);
INSERT INTO doctor(app_id, first_name, last_name)
VALUES
(2, 'Saraa', 'Bold');

INSERT INTO doctor_schedule(doctor_id, schedule_date, slot_time)
VALUES
(1, '2026-10-01', '09:00:00'),
(1, '2026-10-01', '09:30:00'),
(1, '2026-10-01', '10:00:00'),
(1, '2026-10-01', '10:30:00');

INSERT INTO service(service_name, price)
VALUES
('Teeth Cleaning', 50000),
('Dental Filling', 80000),
('Root Canal', 180000),
('Tooth Extraction', 100000);

INSERT INTO appointment(patient_id, schedule_id, status, booking_source)
VALUES
(1, 1, 'booked', 'web');

UPDATE doctor_schedule
SET status = 'booked'
WHERE schedule_id = 1;
INSERT INTO appointment_service(appointment_id, service_id)
VALUES
(1, 1),
(1, 2);
INSERT INTO treatment(
    appointment_id,
    service_id,
    tooth_number,
    note
)
VALUES
(1, 1, NULL, 'Cleaning completed'),
(1, 2, '26', 'Filling completed');
INSERT INTO payment(treatment_id, amount, method)
VALUES
(1, 50000, 'card'),
(2, 80000, 'card');
SELECT * FROM app_user;
SELECT * FROM patient;
SELECT * FROM doctor;
SELECT * FROM doctor_schedule;
SELECT * FROM service;
SELECT * FROM appointment;
SELECT * FROM appointment_service;
SELECT * FROM treatment;
SELECT * FROM payment;
