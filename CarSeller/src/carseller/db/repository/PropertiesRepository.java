package carseller.db.repository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import carseller.db.DatabaseConnection;
import carseller.model.BodyType;
import carseller.model.Color;
import carseller.model.Fuel;
import carseller.properties.Printer;

public class PropertiesRepository {

	private Connection connection;
	
	public PropertiesRepository(){
		this.connection = DatabaseConnection.getConnection();
	}
	
	public List<Fuel> getAllFuelTypes(){
		List<Fuel> fuelTypes = new LinkedList<>();
		try {
			String query = "SELECT * FROM fuel";
			ResultSet rs =	connection.createStatement().executeQuery(query);
			while(rs.next()){
				fuelTypes.add(new Fuel(rs.getInt(1), rs.getString(2)));
			}
		} catch (SQLException e) {
			Printer.printErrorMsg("PropertiesRepository", e);
			e.printStackTrace();
		}
		return fuelTypes;
	}
	
	public List<BodyType> getAllBodyTypes(){
		List<BodyType> bodyTypes = new LinkedList<>();
		try {
			String query = "SELECT * FROM types";
			ResultSet rs =	connection.createStatement().executeQuery(query);
			while(rs.next()){
				bodyTypes.add(new BodyType(rs.getInt(1), rs.getString(2)));
			}
		} catch (SQLException e) {
			Printer.printErrorMsg("PropertiesRepository", e);
			e.printStackTrace();
		}
		return bodyTypes;
	}
	
	public List<Color> getAllColors(){
		List<Color> colors = new LinkedList<>();
		try {
			String query = "SELECT * FROM colors";
			ResultSet rs =	connection.createStatement().executeQuery(query);
			while(rs.next()){
				colors.add(new Color(rs.getInt(1), rs.getString(2)));
			}
		} catch (SQLException e) {
			Printer.printErrorMsg("PropertiesRepository", e);
			e.printStackTrace();
		}
		return colors;
	}
}
