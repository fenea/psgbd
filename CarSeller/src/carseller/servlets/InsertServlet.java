package carseller.servlets;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carseller.db.repository.UserRepository;
import carseller.model.User;

/**
 * Servlet implementation class HttpServletInsert
 */
@WebServlet("/UserInsert")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		
		try{
			if(request.getParameter("name") != null && !request.getParameter("name").equals(""))
				user.setName(request.getParameter("name"));
			else
				throw new IllegalArgumentException("Name cannot be empty");
			if(request.getParameter("forename") != null && !request.getParameter("forename").equals(""))
				user.setForename(request.getParameter("forename"));
			else
				throw new IllegalArgumentException("Forename cannot be empty");
			if(request.getParameter("username") != null && !request.getParameter("username").equals(""))
				user.setUsername(request.getParameter("username"));
			else
				throw new IllegalArgumentException("Username cannot be empty");
			if(request.getParameter("email") != null && !request.getParameter("email").equals(""))
				user.setEmail(request.getParameter("email"));
			else
				throw new IllegalArgumentException("Email cannot be empty");
			if(request.getParameter("phone") != null && !request.getParameter("phone").equals(""))
				user.setPhoneNumber(request.getParameter("phone"));
			else
				throw new IllegalArgumentException("Phone number cannot be empty");
			if(request.getParameter("pass") != null && !request.getParameter("pass").equals(""))
				user.setPassword(request.getParameter("pass"));
			else
				throw new IllegalArgumentException("Password number cannot be empty");	
		}catch(IllegalArgumentException e){
			response.sendRedirect("message.jsp?message=" + URLEncoder.encode(e.toString(), "UTF-8"));
			return;
		}
		System.out.println(user);
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
