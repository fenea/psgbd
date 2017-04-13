package carseller.db.repository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import carseller.db.DatabaseConnection;
import carseller.model.Car;

public class CarRepository {

	private Car mapTupleToCar(ResultSet rs) throws SQLException{
		Car car = new Car();
		// covention for parameters
		car.setId(rs.getInt("id"));
		car.setTitle(rs.getString(2));
		car.setYear(rs.getInt("release_year"));
		car.setPrice(rs.getDouble("price"));
		car.setModel(rs.getString("make") + " " + rs.getString("model"));
		car.setFuel(rs.getString(15));
		car.setMileage(rs.getInt("mileage"));
		car.setBody(rs.getString("body_type"));
		car.setDoorNumber(rs.getInt("doors_number"));
		car.setColor(rs.getString("color"));
		car.setEngineCapacity(rs.getInt("engine_capacity"));
		car.setOwner(rs.getInt("user_id"));
		return car;
	}
	
	public List<Car> getAllCars(){
		List<Car> cars = new LinkedList<>();
		Connection connection = DatabaseConnection.getConnection();
		String query = "SELECT * FROM (SELECT * FROM cars c JOIN fuel f ON c.fuel_type = f.id JOIN "
								   + "types t ON c.body_type_id = t.id JOIN "
								   + "colors cl ON c.color = cl.id JOIN "
								   + "models m ON c.model_id = m.id) WHERE ROWNUM < 30";
		try{
			ResultSet rs = connection.createStatement().executeQuery(query);
			while(rs.next()){
				cars.add(this.mapTupleToCar(rs));
			}
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("CarRepository exception at db");
		}
		return cars;
	}
	
}