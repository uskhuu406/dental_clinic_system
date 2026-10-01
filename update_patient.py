import mysql.connector
patient_id=int(input("uurchluh uvchtunii id:"))
first_name=input("shine ner: ").strip()
last_name=input("shine ovog: ").strip()
phone=input("shine utas:").strip()
connection=mysql.connector.connect(
    user="root",
    unix_socket="/tmp/mysql.sock",
    database="dental_clinic"
)
try:
    cursor = connection.cursor(prepared=True)
    try:
        sql = """
            UPDATE Patient
            SET first_name=%s, last_name=%s, phone=%s
            WHERE patient_id=%s
        """
        cursor.execute(sql, (first_name, last_name, phone, patient_id))
        connection.commit()
        print("uurchilsun muriin too ", cursor.rowcount)
    finally:
        cursor.close()
finally:
    connection.close()
