package carseller.db.repository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import carseller.db.DatabaseConnection;
import carseller.model.User;
import oracle.jdbc.OracleTypes;

public class UserRepository {

	private final static int PAGINATION_SIZE = 30;
	private Connection connection;
	
	public UserRepository(){
		this.connection = DatabaseConnection.getConnection();
	}
	public boolean insert(User user){
		
		try {
			CallableStatement cs = connection.prepareCall("{ call ? := loguser.signup(?, ?, ?, ?, ?, ?) }");
			cs.setString(2, user.getName());
			cs.setString(3, user.getForename());
			cs.setString(4, user.getUsername());
			cs.setString(5, user.getEmail());
			cs.setString(6, user.getPassword());
			cs.setString(7, user.getPhoneNumber());
			cs.registerOutParameter(1, OracleTypes.INTEGER);
			cs.executeUpdate();
			int res = cs.getInt(1);
			return res == 1;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean updatePassword(int id, String oldPassword, String newPassword){
		try {
			CallableStatement cs = connection.prepareCall("{ call ? := loguser.update_password(?, ?, ?) }");
			cs.setInt(2, id);
			cs.setString(3, oldPassword);
			cs.setString(4, newPassword);
			cs.registerOutParameter(1, OracleTypes.INTEGER);
			cs.executeUpdate();
			int res = cs.getInt(1);
			return res == 1;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean login(User user){
		try {
			CallableStatement cs = connection.prepareCall("{ call ? := loguser.login(?, ?) }");
			cs.setString(2, user.getUsername());
			cs.setString(3, user.getPassword());
			cs.registerOutParameter(1, OracleTypes.INTEGER);
			cs.executeUpdate();
			int res = cs.getInt(1);
			return res == 1;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	private User mapTupleToUser(ResultSet rs) throws SQLException{
		User user = new User();
		user.setId(rs.getInt(1));
		user.setName(rs.getString(2));
		user.setForename(rs.getString(3));
		user.setUsername(rs.getString(4));
		user.setEmail(rs.getString(5));
		user.setPhoneNumber(rs.getString(6));
		return user;
	}
	
	public List<User> getAllUsersAtPage(int pageNumber){
		String selectUsers = "(SELECT id, name, forename, username, email, phone_number FROM users)";
		String query = "SELECT id, name, forename, username, email, phone_number FROM "
					 + "(SELECT id, name, forename, username, email, phone_number, rownum r from "
					 + selectUsers + ") WHERE r BETWEEN " + ((pageNumber - 1) * UserRepository.PAGINATION_SIZE)
					 + " AND " + (pageNumber * UserRepository.PAGINATION_SIZE - 1);
		List<User> users = new LinkedList<>();
		try{
			ResultSet rs = connection.createStatement().executeQuery(query);
			while(rs.next()){
				users.add(this.mapTupleToUser(rs));
			}
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("UserRepository exception at db");
		}
		return users;
	}
	
	public List<User> getAllUsersByUsernameAtPage(int pageNumber, String username){
		String selectUsers = "(SELECT id, name, forename, username, email, phone_number "
						   + "FROM users WHERE LOWER(username) LIKE LOWER('" + username + "'))";
		String query = "SELECT id, name, forename, username, email, phone_number FROM "
					 + "(SELECT id, name, forename, username, email, phone_number, rownum r from "
					 + selectUsers + ") WHERE r BETWEEN " + ((pageNumber - 1) * UserRepository.PAGINATION_SIZE)
					 + " AND " + (pageNumber * UserRepository.PAGINATION_SIZE - 1);
		List<User> users = new LinkedList<>();
		try{
			ResultSet rs = connection.createStatement().executeQuery(query);
			while(rs.next()){
				users.add(this.mapTupleToUser(rs));
			}
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("UserRepository exception at db");
		}
		return users;
	}
	
}





























