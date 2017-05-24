package carseller.servlets;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carseller.controller.ModelBean;
import carseller.controller.PropertiesBean;
import carseller.model.BodyType;
import carseller.model.Car;
import carseller.model.Color;
import carseller.model.Fuel;
import carseller.model.Model;
import carseller.properties.Printer;
import carseller.validator.Validator;

/**
 * Servlet implementation class CarFormServlet
 */
@WebServlet("/CarForm")
public class CarFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelBean bean = new ModelBean();
		bean.getAllMakes();
		PropertiesBean propBean = new PropertiesBean();
		propBean.allBodyTypes();
		propBean.allColors();
		propBean.allFuelTypes();
		request.setAttribute("modelBean", bean);
		request.setAttribute("propertiesBean", propBean);
		request.getRequestDispatcher("insert-car.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Car car = new Car();
		String str = null;
		try{
			car.setModel(new Model(req.getParameter("make"), req.getParameter("model")));
			car.setBody(new BodyType(req.getParameter("body-type")));
			car.setColor(new Color(req.getParameter("color")));
			car.setFuel(new Fuel(req.getParameter("fuel")));
			str = req.getParameter("title");
			if(!Validator.isValid(str)){
				throw new IllegalArgumentException("Invalid title");
			}
			car.setTitle(str);
			str = req.getParameter("year");
			car.setYear(Integer.parseInt(str));
			str = req.getParameter("price");
			car.setPrice(Integer.parseInt(str));
			str = req.getParameter("mileage");
			car.setMileage(Integer.parseInt(str));
			str = req.getParameter("engine-capacity");
			car.setEngineCapacity(Integer.parseInt(str));
			str = req.getParameter("doors");
			car.setDoorNumber(Integer.parseInt(str));
			
			Printer.printDebugMsg("CarForm - POST", car);
		} catch(Exception e){
			Printer.printErrorMsg("CarForm - POST", e);
		} 
	}

}
