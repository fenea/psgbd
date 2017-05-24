package carseller.model;

import carseller.validator.Validator;

public class Model {

	int id;
	String make;
	String model;
	
	public Model(){
		
	}
	
	public Model(String make, String model){
		setMakeAndModel(make, model);
	}
	
	public Model(int id, String make, String model){
		setMakeAndModel(make, model);
		setId(id);
	}
	

	public void setMakeAndModel(String make, String model){
		setMake(make);
		setModel(model);
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		if(!Validator.isValid(make))
			throw new IllegalArgumentException("Bad make argument");
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		if(!Validator.isValid(model))
			throw new IllegalArgumentException("Bad model argument");
		this.model = model;
	}
	
	@Override
	public String toString(){
		return make + " " + model;
	}
	
}
