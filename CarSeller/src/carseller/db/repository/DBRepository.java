package carseller.db.repository;

import java.sql.Connection;

import carseller.db.DatabaseConnection;
import carseller.properties.Printer;

public class DBRepository {

	Connection connection;
	
	public DBRepository(){
		connection = DatabaseConnection.getConnection();
	}
	
	public void exportDb(){
		try{
			connection.prepareCall("{call export_db()}").execute();
		}catch(Exception e){
			Printer.printErrorMsg("DBRepository", e);
			e.printStackTrace();
		}
	}
}
