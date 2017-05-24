package carseller.model;

public class Color {

	int id;
	String color;
	
	public Color(){
		
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
		this.color = color;
	}
	
}
