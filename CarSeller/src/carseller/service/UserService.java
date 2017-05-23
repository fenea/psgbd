package carseller.service;

import java.util.UUID;

import java.util.Base64;

import carseller.db.repository.UserRepository;

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
	
}
