package carseller.model;

import carseller.validator.Validator;

public class Fuel {

	int id;
	String fuel;
	
	public Fuel(){
		
	}
	
	public Fuel(String fuel){
		setFuel(fuel);
	}
	
	public Fuel(int id, String fuel){
		setId(id);
		setFuel(fuel);
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		if(!Validator.isValid(fuel))
			throw new IllegalArgumentException("Bad fuel argument");
		this.fuel = fuel;
	}
	
	
}
