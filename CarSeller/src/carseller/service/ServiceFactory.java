package carseller.service;

public class ServiceFactory {

	private static UserService userService;
	private static PropertiesService propertiesService;
	private static CarService carService;
	
	public static UserService getUserService(){
		if(userService == null)
			userService = new UserService();
		return userService;
	}
	
	public static PropertiesService getPropertiesService(){
		if(propertiesService == null){
			propertiesService = new PropertiesService();
		}
		return propertiesService;
	}
	
	public static CarService getCarService(){
		if(carService == null){
			carService = new CarService();
		}
		return carService;
	}
}
