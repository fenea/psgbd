package carseller.model;

public class SearchCriterias {
	
	private int minPrice =0 , maxPrice =0 , minMileage=0 , maxMileage= 0, minEngineCapacity=0, maxEngineCapacity=0;
		private int	pageNumber=0;
	private String make =null, model = null, body=null, color=null, fuel=null;
	public int getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}
	public int getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}
	public int getMinMileage() {
		return minMileage;
	}
	public void setMinMileage(int minMileage) {
		this.minMileage = minMileage;
	}
	public int getMaxMileage() {
		return maxMileage;
	}
	public void setMaxMileage(int maxMileage) {
		this.maxMileage = maxMileage;
	}
	public int getMinEngineCapacity() {
		return minEngineCapacity;
	}
	public void setMinEngineCapacity(int minEngineCapacity) {
		this.minEngineCapacity = minEngineCapacity;
	}
	public int getMaxEngineCapacity() {
		return maxEngineCapacity;
	}
	public void setMaxEngineCapacity(int maxEngineCapacity) {
		this.maxEngineCapacity = maxEngineCapacity;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	
}
