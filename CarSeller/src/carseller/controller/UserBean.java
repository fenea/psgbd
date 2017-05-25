package carseller.controller;

import java.util.List;

import carseller.db.repository.UserRepository;
import carseller.model.*;

public class UserBean {
	
	int countPages;
	List<User> users;
	User user;
	
	public List<User> getUsers(){
		return users;
	}
	
	public int getPagesNumber(){
		return countPages;
	}
	
	public void getAllUser(int pageNumber){
		UserRepository ur = new UserRepository();
		countPages = ur.countPagesForAll();
		users = ur.getAllUsersAtPage(pageNumber);
	}
	
	public void getUserByUsername(int pageNumber, String username){
		UserRepository ur = new UserRepository();
		countPages = ur.countPageByCriterion(username);
		users = ur.getAllUsersByUsernameAtPage(pageNumber, username);
	}
	
	public void getUserById(int id){
		
	}
}
