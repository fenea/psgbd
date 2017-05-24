package carseller.db.repository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import carseller.db.DatabaseConnection;

public class CarProprietiesRepository {
	
	public static List<String> getMake(){
		List<String> listCarMake = new LinkedList<>();
		
		Connection connection = DatabaseConnection.getConnection();
		String query = "SELECT make from manufacturers";
		try{
			
			
			ResultSet rs = connection.createStatement().executeQuery(query);
			while(rs.next()){
				
				listCarMake.add(rs.getString("Make"));
				
			}
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("get Model exception at db");
		}
		return listCarMake;
		
	}

}
