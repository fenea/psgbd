package carseller.db;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static Connection connection;
	private static final String URL = "jdbc:oracle:thin:@//localhost:1521/xe";
	private static final String USERNAME = "carseller";
	private static final String PASSWORD = "carseller2017";

	private DatabaseConnection() {
	}
	
	/*private static boolean readDatabaseConnectionParams(){
		try(BufferedReader in = new BufferedReader(new FileReader("config.txt"))){
			URL = in.readLine();
			USERNAME = in.readLine();
			PASSWORD = in.readLine();
		}catch(IOException e){
			e.printStackTrace();
			return false;
		}
		return true;
	}*/

	public static Connection getConnection() {
		if (connection == null) {
			try {
				//if(!DatabaseConnection.readDatabaseConnectionParams())
					//throw new IllegalStateException("Cannot load connection parameters");
				Class.forName("oracle.jdbc.driver.OracleDriver");
				connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			} catch (ClassNotFoundException e) {
				throw new IllegalStateException("Cannot find the driver in the classpath!", e);
			} catch (SQLException e) {
				throw new IllegalStateException("Cannot connect the database!", e);
			}
		}

		return connection;
	}
}

