package carseller.controller;

import java.util.List;

import carseller.db.repository.CarProprietiesRepository;
import carseller.model.Car;

public class CarBean {
	public  List<String>getMake(){
	
		List<String> cars = CarProprietiesRepository.getMake();
		return cars;
		
	}
	public Car getCar(int id){
		
		return null;
		
	}
}
