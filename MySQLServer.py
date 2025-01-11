import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Establish the connection to MySQL server
        connection = mysql.connector.connect(
            host='localhost',  # Adjust the host if necessary
            user='root',       # Your MySQL username
            password='password'  # Your MySQL password
        )
        
        # Check if the connection is successful
        if connection.is_connected():
            cursor = connection.cursor()
            
            # Create the database if it does not already exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
            connection.commit()  # Commit the transaction
            
            # Notify the user of the successful database creation
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as e:
        # Handle connection errors or any other errors that occur
        print(f"Error: {e}")
    finally:
        # Close the cursor and connection to the MySQL server
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed.")

if __name__ == "__main__":
    create_database()
