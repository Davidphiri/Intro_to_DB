import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Establish connection to MySQL server
        connection = mysql.connector.connect(
            host="localhost",       # Change if the MySQL server is remote
            user="yourusername",    # Replace with your MySQL username
            password="yourpassword" # Replace with your MySQL password
        )

        if connection.is_connected():
            # Create a cursor object to execute SQL queries
            cursor = connection.cursor()
            
            # Create database if it does not exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            
            print("Database 'alx_book_store' created successfully!")
    
    except Error as e:
        # Handle connection and query errors
        print(f"Error connecting to MySQL: {e}")
    
    finally:
        # Ensure the database connection is closed
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed.")

# Call the function to create the database
if __name__ == "__main__":
    create_database()
