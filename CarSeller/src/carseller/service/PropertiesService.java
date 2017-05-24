package carseller.service;

import java.util.List;

import carseller.db.repository.PropertiesRepository;
import carseller.model.BodyType;
import carseller.model.Color;
import carseller.model.Fuel;

public class PropertiesService {

	private PropertiesRepository prop;
	
	public PropertiesService(){
		prop = new PropertiesRepository();
	}
	
	public List<Fuel> getAllFuelTypes(){
		return prop.getAllFuelTypes();
	}
	
	public List<BodyType> getAllBodyTypes(){
		return prop.getAllBodyTypes();
	}
	
	public List<Color> getAllColors(){
		return prop.getAllColors();
	}
}
