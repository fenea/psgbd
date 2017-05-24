package carseller.model;

public class Car {

	private int id;
	private int owner;
	private String title;
	private int year;
	private double price;
	private Model model;
	private Fuel fuel;
	private int mileage;
	private BodyType body;
	private int doorNumber;
	private Color color;
	private int engineCapacity;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOwner() {
		return owner;
	}
	public void setOwner(int owner) {
		this.owner = owner;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		if(year < 0 || year > 9999)
			throw new IllegalArgumentException("Bad year argument");
		this.year = year;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		if(price < 0)
			throw new IllegalArgumentException("Bad price argument");
		this.price = price;
	}
	public Model getModel() {
		return model;
	}
	public void setModel(Model model) {
		this.model = model;
	}
	public Fuel getFuel() {
		return fuel;
	}
	public void setFuel(Fuel fuel) {
		this.fuel = fuel;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		if(mileage < 0)
			throw new IllegalArgumentException("Bad mileage argument");
		this.mileage = mileage;
	}
	public BodyType getBody() {
		return body;
	}
	public void setBody(BodyType body) {
		this.body = body;
	}
	public int getDoorNumber() {
		return doorNumber;
	}
	public void setDoorNumber(int doorNumber) {
		if(doorNumber < 0 || doorNumber > 10)
			throw new IllegalArgumentException("Bad doors number argument");
		this.doorNumber = doorNumber;
	}
	public Color getColor() {
		return color;
	}
	public void setColor(Color color) {
		this.color = color;
	}
	public int getEngineCapacity() {
		return engineCapacity;
	}
	public void setEngineCapacity(int engineCapacity) {
		if(engineCapacity < 0)
			throw new IllegalArgumentException("Bad engine capacity argument");
		this.engineCapacity = engineCapacity;
	}
	
	
	@Override
	public boolean equals (Object o){
		if(o instanceof Car){
			return this.id == ((Car) o).id;
		}
		return false;
	}
	
	@Override
	public String toString(){
		StringBuilder sb = new StringBuilder();
		sb.append(title + " - " + model + " - " + price + " - " + year);
		return sb.toString();
	}
}
