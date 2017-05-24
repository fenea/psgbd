package carseller.model;

import carseller.validator.Validator;

public class BodyType {

	int id;
	String bodyType;
	
	public BodyType(){
		
	}
	
	public BodyType(String bodyType){
		setBodyType(bodyType);
	}
	
	public BodyType(int id, String bodyType){
		setId(id);
		setBodyType(bodyType);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBodyType() {
		return bodyType;
	}

	public void setBodyType(String bodyType) {
		if(!Validator.isValid(bodyType))
			throw new IllegalArgumentException("Bad bodyType argument");
		this.bodyType = bodyType;
	}
	
	
}
