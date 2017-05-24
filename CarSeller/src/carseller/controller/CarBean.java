package carseller.controller;

import java.util.List;

import carseller.db.repository.CarPropertiesRepository;
import carseller.db.repository.CarRepository;
import carseller.model.Car;
import carseller.model.SearchCriterias;

public class CarBean {
	public  List<String>getMake(){

		List<String> cars = CarPropertiesRepository.getMake();
		return cars;

	}
	public List<Car> getSearchCars(String search ,int page){

		return CarRepository.searchCars(search, page);

	}

	public boolean insertCar(Car car){
		return CarRepository.insertCar(car);
	}
	public List<Car> search(SearchCriterias searchCriterias,int page){
		return CarRepository.getCarsByCriteria(searchCriterias,page);
	}
	public Car getCar(int id){
		return CarRepository.getCar(id);
	}
}
