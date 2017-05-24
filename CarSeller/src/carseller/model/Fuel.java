package carseller.model;

public class Fuel {

	int id;
	String fuel;
	
	public Fuel(){
		
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
		this.fuel = fuel;
	}
	
	
}
