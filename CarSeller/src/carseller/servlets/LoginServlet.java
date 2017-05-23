package carseller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carseller.properties.Printer;
import carseller.properties.ServerProperties;
import carseller.service.ServiceFactory;
import carseller.validator.Validator;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Printer.printDebugMsg("LoginServlet - doGet");
		request.setAttribute("status", "true");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Printer.printDebugMsg("LoginServlet - doPost");
		
		String username = request.getParameter("username");
		String password = request.getParameter("pwd");
		try{
			if(!Validator.isValid(username) || !Validator.isValid(password))
				throw new IllegalArgumentException("Cannot be null");
			
			String token = ServiceFactory.getUserService().login(username, password);
			if(token == null)
				throw new IllegalArgumentException("Username doesn't exist");
			
			Cookie usernameCookie = new Cookie("username", username);
			Cookie tokenCookie = new Cookie("token", token);
			response.addCookie(usernameCookie);
			response.addCookie(tokenCookie);
		}catch(IllegalArgumentException ex){
			request.setAttribute("status", "false");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		
		// redirect user to main page
	}

}
