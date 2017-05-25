package carseller.servlets;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carseller.db.repository.UserRepository;
import carseller.model.User;
import carseller.properties.Printer;
import carseller.service.ServiceFactory;
import carseller.validator.Validator;

/**
 * Servlet implementation class InsertPageServlet
 */
@WebServlet("/UserInsert")
public class UserFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		
		if(username != null){
			long startTime = System.currentTimeMillis();
			boolean res = ServiceFactory.getUserService().checkUsernameExistence(username);
			long endTime = System.currentTimeMillis();
			Printer.printDebugMsg("InsertPageServlet - doGet", "Time: " + (endTime - startTime));
			if(res)
				response.setStatus(HttpServletResponse.SC_OK);
			else
				response.setStatus(HttpServletResponse.SC_ACCEPTED);
			return;
		}
		request.getRequestDispatcher("/insert-user.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		Printer.printDebugMsg("InsertServlet - doPost");
		
		for(Map.Entry<String, String[]> e : request.getParameterMap().entrySet()){
			Printer.printDebugMsg("InsertServlet", e.getKey() + " " + Arrays.toString(e.getValue()));
		}
		
		try{
			if(Validator.isValid(request.getParameter("name")))
				user.setName(request.getParameter("name"));
			else
				throw new IllegalArgumentException("Name cannot be empty");
			if(Validator.isValid(request.getParameter("forename")))
				user.setForename(request.getParameter("forename"));
			else
				throw new IllegalArgumentException("Forename cannot be empty");
			if(Validator.isValid(request.getParameter("username")))
				user.setUsername(request.getParameter("username"));
			else
				throw new IllegalArgumentException("Username cannot be empty");
			if(Validator.isValid(request.getParameter("email")) && 
					Validator.isValidEmail(request.getParameter("email")))
				user.setEmail(request.getParameter("email"));
			else
				throw new IllegalArgumentException("Email cannot be empty");
			if(Validator.isValid(request.getParameter("phone")) &&
					Validator.isValidPhone(request.getParameter("phone")))
				user.setPhoneNumber(request.getParameter("phone"));
			else
				throw new IllegalArgumentException("Phone number cannot be empty");
			if(Validator.isValid(request.getParameter("pwd1")))
				user.setPassword(request.getParameter("pwd1"));
			else
				throw new IllegalArgumentException("Password number cannot be empty");	
		}catch(IllegalArgumentException e){
			response.sendRedirect("message.jsp?message=" + URLEncoder.encode(e.toString(), "UTF-8"));
			return;
		}
		Printer.printDebugMsg("InsertServlet - doPost", user);
		UserRepository ur = new UserRepository();
		switch(ur.insert(user)){
			case 1:
				response.sendRedirect("message.jsp?message=" + URLEncoder.encode("User created successfully", "UTF-8"));
				break;
			case -1:
				response.sendRedirect("message.jsp?message=" + URLEncoder.encode("You must choose another username. It seems that already exists", "UTF-8"));
		}
	}

}
