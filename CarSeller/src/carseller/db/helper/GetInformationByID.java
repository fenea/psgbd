package carseller.db.helper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import carseller.db.DatabaseConnection;

public class GetInformationByID {


	
	public static List<String> getModel(int id){
		List<String> model = null ; 
		Connection connection = DatabaseConnection.getConnection();
		String query = "SELECT MAKE ,MODEL from models where id = " + id;
		try{
			ResultSet rs = connection.createStatement().executeQuery(query);
			while(rs.next()){
				
				model =new ArrayList<String>();
				model.add(rs.getString("MAKE"));
				model.add(rs.getString("MODEL")); //array list to store both make and model
			}
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("get Model exception at db");
		}
		return model;
	}
	static public String getColor(int id){
		String color = null;
		Connection connection = DatabaseConnection.getConnection();
		String query = "SELECT COLOR from colors where id = " + id;
		try{
			ResultSet rs = connection.createStatement().executeQuery(query);
			while(rs.next()){
				color = rs.getString("COLOR") ;
			}
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("get Color exception at db");
		}
		return color;
	}
	static public String getFuelType(int id){
		String fuel = null;
		Connection connection = DatabaseConnection.getConnection();
		String query = "SELECT FUEL_TYPE from fuel where id = " + id;
		try{
			ResultSet rs = connection.createStatement().executeQuery(query);
			while(rs.next()){
				fuel = rs.getString("FUEL_TYPE");
			}
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("get Fuel exception at db");
		}
		return fuel;
	}
	static public String getBodyType(int id){
		String bodyType = null;
		Connection connection = DatabaseConnection.getConnection();
		String query = "SELECT BODY_TYPE from types where id = " + id;
		try{
			ResultSet rs = connection.createStatement().executeQuery(query);
			while(rs.next()){
				bodyType = rs.getString("BODY_TYPE");
			}
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("get Model exception at db");
		}
		return bodyType;
	}
}
