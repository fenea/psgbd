package carseller.controller;

import java.util.List;

import carseller.db.repository.CarPropertiesRepository;
import carseller.model.Car;

public class CarBean {
	public  List<String>getMake(){
	
		List<String> cars = CarPropertiesRepository.getMake();
		return cars;
		
	}
	public Car getCar(int id){
		
		return null;
		
	}
}
