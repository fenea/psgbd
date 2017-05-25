package carseller.model;

public class Feedback extends AbstractComment{

	private int consignee;
	
	private int stars;
	public int getConsignee() {
		return consignee;
	}
	public void setConsignee(int consignee) {
		this.consignee = consignee;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
}
