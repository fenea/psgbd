package carseller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carseller.controller.UserBean;

/**
 * Servlet implementation class SearchServletUser
 */
@WebServlet("/SearchServletUser")
public class SearchServletUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServletUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchValue = request.getParameter("searchedValue");
		System.out.println("YESS " + searchValue);
		
		UserBean bean = new UserBean();
		request.setAttribute("userBean", bean);
		if(searchValue == null)
			bean.getAllUser(1);
		else
			bean.getUserByUsername(1, searchValue);
		
		getServletContext().getRequestDispatcher("/movies.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
