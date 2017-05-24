package carseller.model;

import carseller.validator.Validator;

public class Color {

	int id;
	String color;
	
	public Color(){
		
	}
	
	public Color(String color){
		setColor(color);
	}
	
	public Color(int id, String color){
		setId(id);
		setColor(color);
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		if(!Validator.isValid(color))
			throw new IllegalArgumentException("Bad color argument");
		this.color = color;
	}
	
}
