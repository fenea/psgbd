package carseller.model;

public class BodyType {

	int id;
	String bodyType;
	
	public BodyType(){
		
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
		this.bodyType = bodyType;
	}
	
	
}
