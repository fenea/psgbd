package carseller.db.helper;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.OracleTypes;

public class SearchFunction {

	private int minPrice, maxPrice, minMileage, maxMileage, minEngineCapacity, maxEngineCapacity, pageNumber;
	private String make, model, body, color, fuel;
	private String functionCall = "{ ? := list_cars(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
	public SearchFunction(){
		minPrice = maxPrice = minMileage = maxMileage = minEngineCapacity = maxEngineCapacity = 0;
		pageNumber = 1;
		make = model = body = color = fuel = "";
	}
	public int getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}
	public int getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}
	public int getMinMileage() {
		return minMileage;
	}
	public void setMinMileage(int minMileage) {
		this.minMileage = minMileage;
	}
	public int getMaxMileage() {
		return maxMileage;
	}
	public void setMaxMileage(int maxMileage) {
		this.maxMileage = maxMileage;
	}
	public int getMinEngineCapacity() {
		return minEngineCapacity;
	}
	public void setMinEngineCapacity(int minEngineCapacity) {
		this.minEngineCapacity = minEngineCapacity;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	
	public ResultSet prepareStatement(Connection connection){
		try{
			CallableStatement cstmt = null;
			cstmt = connection.prepareCall(functionCall);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.setInt(2, this.minPrice);
			cstmt.setInt(3, this.maxPrice);
			cstmt.setInt(4, this.minMileage);
			cstmt.setInt(5, this.maxMileage);
			cstmt.setInt(6,  this.minEngineCapacity);
			cstmt.setInt(7,  this.maxEngineCapacity);
			cstmt.setString(8, this.make);
			cstmt.setString(9, this.model);
			cstmt.setString(10, this.body);
			cstmt.setString(11, this.color);
			cstmt.setString(12, this.fuel);
			cstmt.executeUpdate();
			return (ResultSet)cstmt.getObject(1);
		}catch (SQLException e){
			e.printStackTrace();
			System.out.println("Helper error!");
			return null;
		}
	}
}
