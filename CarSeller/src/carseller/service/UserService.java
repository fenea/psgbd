package carseller.service;

import java.util.UUID;

import javax.servlet.http.Cookie;

import java.util.Base64;

import carseller.db.repository.UserRepository;
import carseller.validator.Validator;

public class UserService {

	private UserRepository userRepo;
	
	public UserService(){
		userRepo = new UserRepository();
	}
	
	public String login (String username, String password){
		/*
		 * Creating a token for a user
		 */
		String token;
		UUID uuid = UUID.randomUUID();
		token = Long.toString(uuid.getLeastSignificantBits()) + uuid.getMostSignificantBits();
		
		return userRepo.login(username, password, token);
	}
	
	/*
	 * @param username: User's username to be checked if exists in db
	 * @return true if exist, false otherwise
	 */
	public boolean checkUsernameExistence(String username){
		return userRepo.checkUsernameExistence(username);
	}
	
	public boolean isAuthenticated(Cookie[] cookies){
		if(cookies == null)
			return false;
		
		String username = null;
		String token = null;
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("username")){
				username = cookie.getValue();
			} else if (cookie.getName().equals("token")){
				token = cookie.getValue();
			}
		}
		
		if(Validator.isValid(username) && Validator.isValid(token))
			return userRepo.isAuthenticated(username, token);
		return false;
	}
	
	public void signOut(Cookie[] cookies){
		if(cookies == null)
			return;
		
		String username = null;
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("username")){
				username = cookie.getValue();
				break;
			}
		}
		
		userRepo.signOut(username);
	}
	
}
