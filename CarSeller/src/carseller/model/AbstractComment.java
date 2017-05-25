package carseller.model;

import java.util.Date;

public abstract class AbstractComment {

	private int owner;
	private Date date;
	private String comment;
	private int offensive;
	
	public AbstractComment(){
		
	}
	
	public AbstractComment(String comment){
		setComment(comment);
	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getOffensive() {
		return offensive;
	}
	public void setOffensive(int offensive) {
		this.offensive = offensive;
	}

	public int getOwner() {
		return owner;
	}

	public void setOwner(int owner) {
		this.owner = owner;
	}
	
}
