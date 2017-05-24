package carseller.controller;

import java.util.List;

import carseller.model.BodyType;
import carseller.model.Color;
import carseller.model.Fuel;
import carseller.service.ServiceFactory;

public class PropertiesBean {

	private List<Color> colors;
	private List<Fuel> fuelTypes;
	private List<BodyType> bodyTypes;
	
	public void allColors(){
		this.colors = ServiceFactory.getPropertiesService().getAllColors();
	}
	
	public void allFuelTypes(){
		this.fuelTypes = ServiceFactory.getPropertiesService().getAllFuelTypes();
	}
	
	public void allBodyTypes(){
		this.bodyTypes = ServiceFactory.getPropertiesService().getAllBodyTypes();
	}

	public List<Color> getColors() {
		return colors;
	}

	public void setColors(List<Color> colors) {
		this.colors = colors;
	}

	public List<Fuel> getFuelTypes() {
		return fuelTypes;
	}

	public void setFuelTypes(List<Fuel> fuelTypes) {
		this.fuelTypes = fuelTypes;
	}

	public List<BodyType> getBodyTypes() {
		return bodyTypes;
	}

	public void setBodyTypes(List<BodyType> bodyTypes) {
		this.bodyTypes = bodyTypes;
	}
}
