package carseller.db.helper;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import carseller.db.DatabaseConnection;
import oracle.jdbc.OracleTypes;

public class GetIDByInformation {

	public static int getModel(String make, String model ){
		int id = 0;
		Connection connection = DatabaseConnection.getConnection();
		String query = "SELECT ID from models where lower(make) like  lower(?) and lower(model) like lower(?)" ;
		try{
			CallableStatement cstmt = null;
			cstmt = connection.prepareCall(query);

			cstmt.setString(1, make);
			cstmt.setString(2, model);
			ResultSet rs = cstmt.executeQuery();

			while(rs.next()){
				id = rs.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("get model id exception at db");
		}
		return id;
	}

	static public int getBodyType(String bodyType){
		int id = 0;
		Connection connection = DatabaseConnection.getConnection();
		String query = "SELECT id from types where lower(BODY_TYPE)  like lower(?)";
		try{
			CallableStatement cstmt = null;
			cstmt = connection.prepareCall(query);
			cstmt.setString(1, bodyType);
			ResultSet rs = cstmt.executeQuery();
			while(rs.next()){
				id = rs.getInt("id");
			}
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("get Model exception at db");
		}
		return id;
	}

	static public int getFuelType(String fuelType){
		int id = 0;
		Connection connection = DatabaseConnection.getConnection();
		String query = "SELECT id from fuel where lower(fuel_type) like lower(?)" ;
		try{
			CallableStatement cstmt = null;
			cstmt = connection.prepareCall(query);
			cstmt.setString(1, fuelType);
			ResultSet rs = cstmt.executeQuery();
			while(rs.next()){
				id = rs.getInt("id");
			}

		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("get Fuel id exception at db");
		}
		return id;
	}
	static public int getColor(String color){
		int id = 0;
		Connection connection = DatabaseConnection.getConnection();
		String query = "SELECT ID from colors where lower(color) like lower(?)" ;
		try{
			CallableStatement cstmt = null;
			cstmt = connection.prepareCall(query);
			cstmt.setString(1,color);
			ResultSet rs = cstmt.executeQuery();
			while(rs.next()){
				id = rs.getInt("id");
			}
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("get Color id exception at db");
		}
		return id;
	}

}
