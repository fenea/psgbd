package carseller.controller;

import java.util.List;

import carseller.db.repository.CarProprietiesRepository;

public class ModelBean {

	public  List<String>getAllMakes(){
		
		List<String> makes = CarProprietiesRepository.getMake();
		return makes;
	}
public List<String> getModelsByMakeName(String make){
	List<String> models = CarProprietiesRepository.getModels(make);
	return models;
	
	
}
}
