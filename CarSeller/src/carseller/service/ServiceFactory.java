package carseller.service;

public class ServiceFactory {

	private static UserService userService;
	
	public static UserService getUserService(){
		if(userService == null)
			userService = new UserService();
		return userService;
	}
}
