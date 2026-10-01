import mysql.connector
conn=mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="dental"
)
cursor=conn.cursor()
phone=input("utas: ")
email=input("email: ")
password=input("password: ")
first_name=input("ner: ")
last_name=input(" ovog: ")
gender=input(" huis: ")
birth_date=input(" tursun ognoo YYYY-MM-DD: ")
sql_user="""
INSERT into app_user(phone,email,password,role)
values(%s,%s,%s,%s)
"""
values_user=(
    phone,
    email,
    password,
    "patient"
)
cursor.execute(sql_user,values_user)
app_id=cursor.lastrowid
sql_patient="""
INSERT INTO patient(
app_id,
first_name,
last_name,
gender,
birth_date
)
VALUES(%s,%s,%s,%s,%s)
"""
values_patient=(
    app_id,
    first_name,
    last_name,
    gender,
    birth_date
)
cursor.execute(sql_patient,values_patient)
conn.commit()
