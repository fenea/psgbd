package carseller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carseller.controller.CarBean;
import carseller.controller.ModelBean;
import carseller.service.ServiceFactory;

/**
 * Servlet implementation class MainPageServlet
 */
@WebServlet("/main")
public class MainPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CarBean bean = new CarBean();
		boolean isLoggedIn = ServiceFactory.getUserService().isAuthenticated(request.getCookies());
		if(isLoggedIn){
			//special treatment
		}else{
			bean.allCars(-1, "");
		}
		ModelBean mb = new ModelBean();
		request.setAttribute("modelBean", mb);
		request.setAttribute("carBean", bean);
		request.getRequestDispatcher("cars.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
