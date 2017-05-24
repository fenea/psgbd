package carseller.controller;

import java.util.List;

import carseller.db.repository.CarProprietiesRepository;

public class ModelBean {

	public  List<String>getAllMakes(){
		
		List<String> cars = CarProprietiesRepository.getMake();
		return cars;
		
	}
}
