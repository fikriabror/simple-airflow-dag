import psycopg2

try:
    connection = psycopg2.connect(
        user="postgres",
        password="postgres",
        host="localhost",
        port="5433",  # Adjust this if your config uses a different port
        database="postgres"
    )
    cursor = connection.cursor()
    cursor.execute("SELECT version();")
    record = cursor.fetchone()
    print("You are connected to - ", record, "\n")
except (Exception, psycopg2.Error) as error:
    print("Error while connecting to PostgreSQL", error)
finally:
    if connection:
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")