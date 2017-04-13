package carseller.servlets;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carseller.db.repository.UserRepository;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePassword")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
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
		int id;
		String oldPass, newPass;
		
		try{
			id = Integer.parseInt(request.getParameter("id"));
		}catch(NumberFormatException e){
			response.sendRedirect("message.jsp?message=" + URLEncoder.encode("Invalid id", "UTF-8"));
			return;
		}
		oldPass = request.getParameter("old");
		newPass = request.getParameter("new");
		UserRepository ur = new UserRepository();
		switch (ur.updatePassword(id, oldPass, newPass)) {
		case 1:
			response.sendRedirect("message.jsp?message=" + URLEncoder.encode("Password changed", "UTF-8"));
			break;
		case 0:
			response.sendRedirect("message.jsp?message=" + URLEncoder.encode("Wrong password", "UTF-8"));
			break;
		default:
			response.sendRedirect("message.jsp?message=" + URLEncoder.encode("Database error", "UTF-8"));
			break;
		}
	}

}
