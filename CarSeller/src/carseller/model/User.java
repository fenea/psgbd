package carseller.model;

import java.util.List;

public class User {
	
	private int id;
	private String name;
	private String forename;
	private String username;
	private String email;
	private String phoneNumber;
	private String password;
	
	private List<Car> cars;
	private List<Feedback> addressedFeeback; 
	
	public List<Car> getCars() {
		return cars;
	}
	public void setCars(List<Car> cars) {
		this.cars = cars;
	}
	public List<Feedback> getAddressedFeeback() {
		return addressedFeeback;
	}
	public void setAddressedFeeback(List<Feedback> addressedFeeback) {
		this.addressedFeeback = addressedFeeback;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getForename() {
		return forename;
	}
	public void setForename(String forename) {
		this.forename = forename;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public boolean equals(Object o){
		if(o instanceof User){
			return this.id == ((User) o).id;
		}
		return false;
	}
	
	@Override
	public String toString(){
		return id + " " + username + " " + email;
	}
}
