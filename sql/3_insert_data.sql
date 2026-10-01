USE dental_clinic;
INSERT INTO Patient(first_name,last_name,phone,email,date_of_birth,password_hash)
VALUES
('Galaa','Dorj','88429033','galaa@gmail.com','2000-11-09','$2b$12$Oe0tAxQD3VBWWsnzU304kuABwpesWpEUIYm2nqWq6KhPNgG5VWq/2'),
('Bold','Bat','88112233',NULL,'1998-05-14',NULL);
SELECT * FROM Patient;
INSERT INTO Staff(first_name,last_name,phone,email,password_hash,role)
VALUES
('Saraa','Bold','88102923','saraa@gmail.com','$2b$12$j0Wl1PPzW84i6j4SDaAmoeCFffbbP889tITr18uHPnE0yLcD9GizO','DOCTOR'),
('Bataa','Dorj','88114455','bataa@gmail.com','$2b$12$RCsAcWeTqw2ZpZSPblcIz.jORqIXKeX6dgihGdr81yeMp5qmkkcj2','RECEPTIONIST'),
('Anaa','Bat','88116677','anaa@gmail.com','$2b$12$3p7PcVwHoHXEQlnc46zi9uWYs/21f89aYtfYA/Aq/kd9vlAj/kVGq','ADMIN');
SELECT * FROM Staff;
INSERT INTO Service(service_name,description,price)
VALUES
('Uzleg','Shudnii uzleg',50000.00),
('Lombo','Shud lombo tavih',80000.00);
SELECT * FROM Service;
INSERT INTO StaffSchedule(staff_id,day_of_week,start_time,end_time)
VALUES(1,1,'09:00:00','18:00:00');
SELECT * FROM StaffSchedule;
INSERT INTO Appointment(patient_id,doctor_id,scheduled_at,channel,status)
VALUES
(1,1,'2026-09-21 10:00:00','WEB','COMPLETED'),
(2,1,'2026-09-21 14:00:00','PHONE','COMPLETED');
SELECT * FROM Appointment;
INSERT INTO AppointmentService(appointment_id,service_id)
VALUES
(1,1),
(1,2),
(2,1);
SELECT * FROM AppointmentService;
INSERT INTO Treatment(appointment_id,service_id,diagnosis,tooth_number,tooth_surface,treatment_notes,unit_price,performed_at)
VALUES
(1,2,'Shud tsoorolttoi','16','O','16-r shudend lombo tavisan',80000.00,'2026-09-21 11:00:00'),
(2,1,'Shudnii eronhii uzleg',NULL,NULL,'Shudnii uzleg hiisen',50000.00,'2026-09-21 14:30:00');
SELECT * FROM Treatment;
INSERT INTO Payment(appointment_id,amount,payment_method,paid_at)
VALUES
(1,30000.00,'CASH','2026-09-21 11:10:00'),
(1,50000.00,'CARD','2026-09-21 11:15:00'),
(2,50000.00,'TRANSFER','2026-09-21 14:40:00');
SELECT * FROM Payment;
