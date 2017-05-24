package carseller.db.repository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import carseller.db.DatabaseConnection;

public class CarPropertiesRepository {
	
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
			System.out.println("get Make exception at db");
		}
		return listCarMake;
		
	}

	public static List<String> getModels(String make) {
		List<String> listCarModels = new LinkedList<>();
		Connection connection = DatabaseConnection.getConnection();
		String query = "SELECT model FROM models WHERE LOWER(make) = LOWER(?)";
		try{
			
			CallableStatement cs = connection.prepareCall(query);
			cs.setString(1, make);
			ResultSet rs = cs.executeQuery();
			while(rs.next()){
				listCarModels.add(rs.getString("MODEL"));
			}
		}catch(SQLException e){
		
			System.out.println("get Model exception at db " + e);
		}
		return listCarModels;
	}

}
