package carseller.service;

import carseller.db.repository.CarRepository;
import java.util.List;
import carseller.model.Car;
public class CarService {
	CarRepository carRepo = new CarRepository();
	
	public List<Car> getAllCars(int lastId, String comparator){
		return carRepo.getAllCars(lastId, comparator);
	}
}
