import mysql.connector
first_name=input("uvchtunii ner:").strip()
last_name=input("ubchtunii ovog: ").strip()
phone=input("utasnii dugaar:").strip()
connection=mysql.connector.connect(
    user="root",
    unix_socket="/tmp/mysql.sock",
    database="dental_clinic"
)
try:
    cursor = connection.cursor(prepared=True)
    try:
        sql = """
            INSERT INTO Patient(first_name, last_name, phone)
            VALUES(%s, %s, %s)
        """
        cursor.execute(sql, (first_name, last_name, phone))
        connection.commit()
        print("Амжилттай нэмэгдлээ. patient_id =", cursor.lastrowid)
    finally:
        cursor.close()
finally:
    connection.close()
