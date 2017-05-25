package carseller.controller;

import java.util.List;

import carseller.db.repository.CarPropertiesRepository;
import carseller.db.repository.CarRepository;
import carseller.model.Car;
import carseller.model.SearchCriterias;
import carseller.service.ServiceFactory;

public class CarBean {
	
	List<Car> cars;
	Car car;
	
	public List<Car> getCars(){
		return cars;
	}
	
	public Car getCar(){
		return car;
	}
	
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
		//TODO repair this, fenea!
		//return CarRepository.getCarsByCriteria(searchCriterias,page);
		return null;
	}
	public Car getCar(int id){
		return CarRepository.getCar(id);
	}
	
	public void allCars(int lastId, String comparator){
		cars = ServiceFactory.getCarService().getAllCars(lastId, comparator);
	}
	
	public void getCarById(int id){
		car = ServiceFactory.getCarService().getCarById(id);
	}
}
