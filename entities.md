# Dental Clinic Database System — Entities
SRS-ээс олсон entity-үүдийн эхний бүтэц, атрибут болон түлхүүрийг тодорхойлов.
## 1. Patient
||Түлхүүр|
|---|---|
|patient_id|PK|
|first_name||
|last_name||
|phone||
|email||
|date_of_birth||

## 2. Role
||Түлхүүр|
|---|---|
|role_id|PK|
|role_name||

## 3. Staff
||Түлхүүр|
|---|---|
|staff_id|PK|
|first_name||
|last_name||
|phone||
|email||

## 4. Doctor
||Түлхүүр|
|---|---|
|doctor_id|PK|
|staff_id|FK|
|specialty||

## 5. UserAccount
||Түлхүүр|
|---|---|
|user_id|PK|
|patient_id|FK|
|staff_id|FK|
|role_id|FK|
|email||
|phone||
|password_hash||

## 6. MedicalHistory
||Түлхүүр|
|---|---|
|history_id|PK|
|patient_id|FK|
|medical_conditions||
|current_medications||
|recorded_at||

## 7. PatientAllergy
||Түлхүүр|
|---|---|
|allergy_id|PK|
|patient_id|FK|
|allergen||
|reaction||

## 8. Service
||Түлхүүр|
|---|---|
|service_id|PK|
|service_name||
|description||
|price||

## 9. StaffSchedule
||Түлхүүр|
|---|---|
|schedule_id|PK|
|staff_id|FK|
|day_of_week||
|start_time||
|end_time||

## 10. Appointment
||Түлхүүр|
|---|---|
|appointment_id|PK|
|patient_id|FK|
|doctor_id|FK|
|scheduled_at||
|channel||
|status||
|created_at||

## 11. AppointmentService
||Түлхүүр|
|---|---|
|appointment_id|PK, FK|
|service_id|PK, FK|

## 12. AppointmentHistory
||Түлхүүр|
|---|---|
|history_id|PK|
|appointment_id|FK|
|scheduled_at||
|status||
|changed_at||
|changed_by_user_id|FK|

## 13. Examination
||Түлхүүр|
|---|---|
|examination_id|PK|
|appointment_id|FK|
|examination_notes||
|diagnosis||
|treatment_plan||
|examined_at||

## 14. Treatment
||Түлхүүр|
|---|---|
|treatment_id|PK|
|examination_id|FK|
|service_id|FK|
|tooth_number||
|tooth_surface||
|treatment_notes||
|performed_at||

## 15. Invoice
||Түлхүүр|
|---|---|
|invoice_id|PK|
|appointment_id|FK|
|issued_at||
|status||

## 16. InvoiceItem
||Түлхүүр|
|---|---|
|invoice_item_id|PK|
|invoice_id|FK|
|treatment_id|FK|
|quantity||
|unit_price||

## 17. Payment
||Түлхүүр|
|---|---|
|payment_id|PK|
|invoice_id|FK|
|amount||
|payment_method||
|paid_at||

# Entity Relationships

# Entity Relationships

| Нэг тал | Холбоо | Нөгөө тал |
|---|---|---|
| Patient (Өвчтөн) | 1:N | Appointment (Цаг захиалга) |
| Doctor (Эмч) | 1:N | Appointment (Цаг захиалга) |
| Appointment (Цаг захиалга) | 1:N | AppointmentService (Захиалгын үйлчилгээ) |
| Service (Үйлчилгээ) | 1:N | AppointmentService (Захиалгын үйлчилгээ) |
| Staff (Ажилтан) | 1:1 | Doctor (Эмч) |

| Нэг тал | Холбоо | Нөгөө тал |
|---|---|---|
| Patient (Өвчтөн) | 1:1 | UserAccount (Нэвтрэх бүртгэл) |
| Staff (Ажилтан) | 1:1 | UserAccount (Нэвтрэх бүртгэл) |
| Role (Эрхийн төрөл) | 1:N | UserAccount (Нэвтрэх бүртгэл) |
| Patient (Өвчтөн) | 1:N | MedicalHistory (Эрүүл мэндийн мэдээлэл) |
| Patient (Өвчтөн) | 1:N | PatientAllergy (Өвчтөний харшил) |

| Нэг тал | Холбоо | Нөгөө тал |
|---|---|---|
| Staff (Ажилтан) | 1:N | StaffSchedule (Ажилтны хуваарь) |
| Appointment (Цаг захиалга) | 1:N | AppointmentHistory (Захиалгын түүх) |
| UserAccount (Нэвтрэх бүртгэл) | 1:N | AppointmentHistory (Захиалгын түүх) |
| Appointment (Цаг захиалга) | 1:N | Examination (Үзлэг) |
| Examination (Үзлэг) | 1:N | Treatment (Эмчилгээ) |

| Нэг тал | Холбоо | Нөгөө тал |
|---|---|---|
| Service (Үйлчилгээ) | 1:N | Treatment (Эмчилгээ) |
| Appointment (Цаг захиалга) | 1:N | Invoice (Нэхэмжлэл) |
| Invoice (Нэхэмжлэл) | 1:N | InvoiceItem (Нэхэмжлэлийн мөр) |
| Treatment (Эмчилгээ) | 1:N | InvoiceItem (Нэхэмжлэлийн мөр) |
| Invoice (Нэхэмжлэл) | 1:N | Payment (Төлбөр) |


# Dental Clinic Database System — Draft ERD

```mermaid
erDiagram
    Patient {
        int patient_id PK
        string first_name
        string last_name
        string phone
        string email
        date date_of_birth
    }

    Role {
        int role_id PK
        string role_name
    }

    Staff {
        int staff_id PK
        string first_name
        string last_name
        string phone
        string email
    }

    Doctor {
        int doctor_id PK
        int staff_id FK
        string specialty
    }

    UserAccount {
        int user_id PK
        int patient_id FK
        int staff_id FK
        int role_id FK
        string email
        string phone
        string password_hash
    }

    MedicalHistory {
        int history_id PK
        int patient_id FK
        string medical_conditions
        string current_medications
        datetime recorded_at
    }

    PatientAllergy {
        int allergy_id PK
        int patient_id FK
        string allergen
        string reaction
    }

    Service {
        int service_id PK
        string service_name
        string description
        decimal price
    }

    StaffSchedule {
        int schedule_id PK
        int staff_id FK
        int day_of_week
        time start_time
        time end_time
    }

    Appointment {
        int appointment_id PK
        int patient_id FK
        int doctor_id FK
        datetime scheduled_at
        string channel
        string status
        datetime created_at
    }

    AppointmentService {
        int appointment_id PK, FK
        int service_id PK, FK
    }

    AppointmentHistory {
        int history_id PK
        int appointment_id FK
        datetime scheduled_at
        string status
        datetime changed_at
        int changed_by_user_id FK
    }

    Examination {
        int examination_id PK
        int appointment_id FK
        string examination_notes
        string diagnosis
        string treatment_plan
        datetime examined_at
    }

    Treatment {
        int treatment_id PK
        int examination_id FK
        int service_id FK
        string tooth_number
        string tooth_surface
        string treatment_notes
        datetime performed_at
    }

    Invoice {
        int invoice_id PK
        int appointment_id FK
        datetime issued_at
        string status
    }

    InvoiceItem {
        int invoice_item_id PK
        int invoice_id FK
        int treatment_id FK
        int quantity
        decimal unit_price
    }

    Payment {
        int payment_id PK
        int invoice_id FK
        decimal amount
        string payment_method
        datetime paid_at
    }

    Staff ||--o| Doctor : has
    Patient |o--o| UserAccount : has
    Staff |o--o| UserAccount : has
    Role ||--o{ UserAccount : assigned_to
    Patient ||--o{ MedicalHistory : has
    Patient ||--o{ PatientAllergy : has
    Staff ||--o{ StaffSchedule : follows
    Patient ||--o{ Appointment : books
    Doctor ||--o{ Appointment : attends
    Appointment ||--|{ AppointmentService : includes
    Service ||--o{ AppointmentService : selected_in
    Appointment ||--o{ AppointmentHistory : records
    UserAccount |o--o{ AppointmentHistory : changes
    Appointment ||--o{ Examination : leads_to
    Examination ||--o{ Treatment : records
    Service ||--o{ Treatment : performed_as
    Appointment ||--o{ Invoice : billed_by
    Invoice ||--|{ InvoiceItem : contains
    Treatment ||--o{ InvoiceItem : billed_in
    Invoice ||--o{ Payment : paid_with
```
