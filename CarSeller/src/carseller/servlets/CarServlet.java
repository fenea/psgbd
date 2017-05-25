package carseller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carseller.controller.CarBean;
import carseller.controller.ModelBean;
import carseller.controller.PropertiesBean;
import carseller.properties.Printer;
import carseller.service.ServiceFactory;

/**
 * Servlet implementation class CarServlet
 */
@WebServlet("/cars")
public class CarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			boolean isAuth = ServiceFactory.getUserService().isAuthenticated(request.getCookies());
			ModelBean bean = new ModelBean();
			bean.getAllMakes();
			CarBean carBean = new CarBean();
			carBean.getCarById(Integer.parseInt(request.getParameter("id")));
			PropertiesBean propBean = new PropertiesBean();
			propBean.allBodyTypes();
			propBean.allColors();
			propBean.allFuelTypes();
			request.setAttribute("modelBean", bean);
			request.setAttribute("propertiesBean", propBean);
			request.setAttribute("carBean", carBean);
			request.setAttribute("author", ((isAuth == true) ? "true" : "false"));
			request.getRequestDispatcher("car.jsp").forward(request, response);
		}catch(Exception e){
			Printer.printErrorMsg("/car - doGet", e);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
