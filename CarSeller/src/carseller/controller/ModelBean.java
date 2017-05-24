package carseller.controller;

import java.util.List;

import carseller.db.repository.CarPropertiesRepository;

public class ModelBean {

	public  List<String>getAllMakes(){
		
		List<String> makes = CarPropertiesRepository.getMake();
		return makes;
	}
	
	public List<String> getModelsByMakeName(String make){
		List<String> models = CarPropertiesRepository.getModels(make);
		return models;
	}
}
