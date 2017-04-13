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
		int page = 1;
		try{
			page = Integer.parseInt(request.getParameter("page"));
		}catch(NumberFormatException e){
			System.out.println("Number format exception");
		}
		
		UserBean bean = new UserBean();
		request.setAttribute("userBean", bean);
		if(searchValue == null || searchValue.equals(""))
			bean.getAllUser(page);
		else
			bean.getUserByUsername(page, searchValue);
		
		getServletContext().getRequestDispatcher("/main.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
