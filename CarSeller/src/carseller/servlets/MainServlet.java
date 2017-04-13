package carseller.servlets;

import java.io.IOException;
import java.sql.*;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carseller.db.DatabaseConnection;
import carseller.db.repository.CarRepository;
import carseller.db.repository.UserRepository;
import carseller.model.Car;
import carseller.model.User;
import oracle.jdbc.OracleTypes;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*CarRepository cr = new CarRepository();
		List<Car> cars = cr.getAllCars();
		for(Car car : cars)
			System.out.println(car);
		try {
			CallableStatement cs = DatabaseConnection.getConnection().prepareCall("{ call ? := loguser.signup(?, ?, ?, ?, ?, ?) }");
			cs.setString(2, "Rusu");
			cs.setString(3, "Bogdan");
			cs.setString(4, "username");
			cs.setString(5, "username@yahoo.ro");
			cs.setString(6, "parola");
			cs.setString(7, "0752011851");
			cs.registerOutParameter(1, OracleTypes.INTEGER);
			cs.executeUpdate();
			int res = cs.getInt(1);
			if(res == -1){
				System.out.println("Error, exception on db");
			}
			else 
				System.out.println("everything ok");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		UserRepository ur = new UserRepository();
		List<User> users = ur.getAllUsersByUsernameAtPage(1, "gigel') or ('a' = 'a");
		for(User user : users)
			System.out.println(user);
		request.getRequestDispatcher("/main.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
