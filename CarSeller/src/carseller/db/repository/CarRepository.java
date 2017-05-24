package carseller.db.repository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import carseller.db.DatabaseConnection;
import carseller.model.Car;
import oracle.jdbc.OracleTypes;
import carseller.db.helper.GetIDByInformation;
import carseller.db.helper.GetInformationByID;

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


	public List<Car> searchCars(String string,int page){
		List<Car> cars = new LinkedList<>();
		Connection connection = DatabaseConnection.getConnection();


		try {
			CallableStatement cs = connection.prepareCall("{ call ? := QUERYCARS.SEARCH_CARS(?, ?) }");
			cs.setString(2, string);
			cs.setInt(3, page);
			cs.registerOutParameter(1, OracleTypes.CURSOR);
			cs.executeUpdate();
			ResultSet rs = (ResultSet) cs.getObject(1);


			while (rs.next()) {
				cars.add(this.mapTupleToCar(rs));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}


		return cars;
	}

	static public boolean insertCar(Car car){

				Connection connection = DatabaseConnection.getConnection();;

					String query = "insert into cars ( title, release_year, price, model_id, fuel_type ,"
							+ " mileage,body_type_id, color ,engine_capacity,user_id,doors_number)values ( ? ,? ,?,?,?,?,?,?,?,?,?)";

					try{
						CallableStatement cstmt = null;
						cstmt = connection.prepareCall(query);

					cstmt.setString(1, car.getTitle());
					cstmt.setInt(2, car.getYear());
					cstmt.setDouble(3, car.getPrice());
					cstmt.setInt(4,GetIDByInformation.getModel(car.getMake(),car.getModel()));
					cstmt.setInt(5,GetIDByInformation.getFuelType(car.getFuel()));
					cstmt.setInt(6, car.getMileage());
					cstmt.setInt(7, GetIDByInformation.getBodyType(car.getBody()));
					cstmt.setInt(8,GetIDByInformation.getColor(car.getColor()));
					cstmt.setInt(9, car.getEngineCapacity());
					cstmt.setInt(10, car.getOwner());
					cstmt.setInt(11, car.getDoorNumber());
					cstmt.executeQuery();
				}catch(SQLException e){

					System.out.println("get Make exception at db");
					return false;
				}
				return true;
			}

		public static List<Car> getCarsByCriteria(SearchCriterias searchCriterias,int pageNumber){
			List<Car> cars = new LinkedList<>();
			Connection connection = DatabaseConnection.getConnection();

			try {
				CallableStatement cs = connection.prepareCall("{ call ? := QUERYCARS.LIST_CARS(?, ?,?,?,?,?,?) }");
				cs.setInt(2, searchCriterias.getMinPrice());
				cs.setInt(3, searchCriterias.getMaxPrice());
				cs.setInt(4, searchCriterias.getMinMileage());
				cs.setInt(5, searchCriterias.getMaxMileage());
				cs.setInt(6, searchCriterias.getMinEngineCapacity());
				cs.setInt(7, searchCriterias.getMaxEngineCapacity());
				cs.setString(8,searchCriterias.getMake());
				cs.setString(9, searchCriterias.getModel());
				cs.setString(10, searchCriterias.getBody());
				cs.setString(11,searchCriterias.getColor());
				cs.setString(12, searchCriterias.getFuel());
				cs.setInt(13, pageNumber);
				cs.registerOutParameter(1, OracleTypes.CURSOR);
				cs.executeUpdate();
				ResultSet rs = (ResultSet) cs.getObject(1);


				while (rs.next()) {
					cars.add(CarRepository.mapTupleToCar(rs));
				}

			} catch (SQLException e) {

				e.printStackTrace();
			}
			return cars;
		}
		static public Car getCar(int id){
			Car car = new Car();
			Connection connection = DatabaseConnection.getConnection();

			try {
				CallableStatement cs = connection.prepareCall("select * from cars where id = ?");
				cs.setInt(1, id);


				ResultSet rs = cs.executeQuery();


				while (rs.next()) {
					car = CarRepository.mapTupleToCar(rs);
				}

			} catch (SQLException e) {

				e.printStackTrace();
		}
			return car;
		}

}
