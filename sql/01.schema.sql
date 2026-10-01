create database dental;
Use dental;

create table app_user(
    app_id int AUTO_INCREMENT PRIMARY key,
    phone varchar(20) not null,
    email varchar(100) not null UNIQUE,
    password VARCHAR(200) not null,
    role VARCHAR(20) not NULL,
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    check(role in ('patient','doctor','receptionist','admin'))
);

create table patient(
    patient_id int AUTO_INCREMENT PRIMARY key,
    app_id int not null UNIQUE,
    first_name VARCHAR(100) not null,
    last_name varchar(100) not null,
    gender varchar(20),
    birth_date date,
    Foreign Key (app_id) REFERENCES app_user(app_id)
);

create table Doctor(
    doctor_id int AUTO_INCREMENT PRIMARY KEY,
    app_id int not null UNIQUE,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    Foreign Key (app_id) REFERENCES app_user(app_id)
);

create table doctor_schedule(
    schedule_id int AUTO_INCREMENT PRIMARY key,
    doctor_id int not null,
    schedule_date date not null,
    slot_time time not null,
    status varchar(20) not null DEFAULT 'available',
    Foreign Key (doctor_id) REFERENCES doctor(doctor_id),
    UNIQUE(doctor_id,schedule_date,slot_time),
    check(status in ('available','booked','unavailable'))
);

create table service(
    service_id int AUTO_INCREMENT PRIMARY key,
    service_name varchar(100) not null,
    price int not null,
    check(price>0)
);

create table appointment(
    appointment_id int AUTO_INCREMENT PRIMARY KEY,
    patient_id int not null,
    schedule_id int not null UNIQUE,
    status varchar(100) not null DEFAULT'booked',
    booking_source varchar(100) not null,
    check(booking_source in ('web','reception')),
    check(status in ('booked','completed','cancelled')),
    Foreign Key (patient_id) REFERENCES patient(patient_id),
    Foreign Key (schedule_id) REFERENCES doctor_schedule(schedule_id)
);

create table appointment_service(
    appointment_id int not null,
    service_id int not null,
    PRIMARY key(appointment_id,service_id),
    Foreign Key (appointment_id) REFERENCES appointment(appointment_id),
    Foreign Key (service_id) REFERENCES service(service_id)
);

create table treatment(
    treatment_id int AUTO_INCREMENT PRIMARY key,
    service_id int not null,
    appointment_id int not null,
    tooth_number varchar(20),
    note varchar (200) ,
    Foreign Key (appointment_id,service_id) REFERENCES appointment_service(appointment_id,service_id)
);

create table payment(
    payment_id int AUTO_INCREMENT PRIMARY key,
    treatment_id int not null,
    amount int not null,
    method varchar(20 ) not null,
    check (amount>0),
    check(method in ('cash','card','transfer')),
    Foreign Key (treatment_id) REFERENCES treatment(treatment_id)
);
