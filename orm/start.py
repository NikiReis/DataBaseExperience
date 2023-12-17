import pymysql.cursors

# Establish a connection to the database
connection = pymysql.connect(
    host="localhost",
    port=3306,
    user="root",
    password="Vsixp1jg3Kc7",
    db="pysql",
    charset="utf8mb4",
    cursorclass=pymysql.cursors.DictCursor
)


def creating_tables(table_name:str):
    try:
    # Ensure the table 'teste' exists in the 'pysql' database
        with connection.cursor() as cursor:
            # Define the table schema and create the table if it doesn't exist
            create_table_query = f'''
            CREATE TABLE IF NOT EXISTS {table_name} (
                id INT AUTO_INCREMENT PRIMARY KEY,
                name VARCHAR(50),
                dob DATE
            )'''
            cursor.execute(create_table_query)
            connection.commit()
    except Exception as e:
        print(f"Something went wrong: {e}")
        connection.rollback()
    finally:
        # connection.close()
        pass

## creating_tables('teste_create')


def inserting_values(table_name:str,id,name,dob):
    try:
        with connection.cursor() as cursor:
            insert_query = f"INSERT INTO `{table_name}` (id,name_cliente,birth_day) VALUES({id}, '{name}', '{dob}')"
            cursor.execute(insert_query)
            connection.commit()
    except Exception as e:
        print(f"Something went wrong {e}")
        connection.rollback()
    finally:
        # connection.close()
        pass
# inserting_values("teste",2,"Lineks","12-12-2001")


def select_fromdb():
    try:
        with connection.cursor() as cursor:
            select_query = "SELECT * FROM teste"
            cursor.execute(select_query)
            results = cursor.fetchall()
            print(results)
    except Exception as e:
        print(f"Something went wrong: {e}")
    finally:
        # connection.close()
        pass


def update_fromdb(name_old, name_new):
    try:
        with connection.cursor() as cursor:
            update_query = "UPDATE teste SET name_cliente = %s WHERE name_cliente = %s"
            cursor.execute(update_query, (name_new, name_old))
            connection.commit()
    except Exception as e:
        print(f"Something went wrong: {e}")
        connection.rollback()
    finally:
        # connection.close()
        pass


def delete_fromdb(name_to_delete):
    try:
        with connection.cursor() as cursor:
            delete_query = "DELETE FROM teste WHERE name_cliente = %s"
            cursor.execute(delete_query,(name_to_delete))
            connection.commit()
    except Exception as e:
        print(f"Something went wrong: {e}")
        connection.rollback()
    finally:
        # connection.close()
        pass

delete_fromdb("Lineks")