package carseller.servlets;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carseller.controller.CarBean;
import carseller.db.repository.CarRepository;
import carseller.db.repository.UserRepository;
import carseller.model.Car;
import carseller.properties.Printer;


/**
 * Servlet implementation class SearchCarsServlet
 */
@WebServlet("/searchCar")
public class SearchCarsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCarsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CarBean bean = new CarBean();
		String str = request.getParameter("page");
		int id = Integer.parseInt(request.getParameter("lastId"));
		String comparator = str.equals("prev") ? ">" : "<";
		Printer.printDebugMsg("searchCar", str + " " + comparator);
		bean.allCars(id, comparator);
		request.setAttribute("carBean", bean);
		request.getRequestDispatcher("cars.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Car> cars = new ArrayList<Car>();
		
		 String string;
		 int page;
			try{
				if(request.getParameter("search_string") != null && !request.getParameter("search_string").equals(""))
					string = (request.getParameter("search_string"));
				
				else
					throw new IllegalArgumentException("Name cannot be empty");
				if(request.getParameter("page") != null && !request.getParameter("page").equals(""))
					page = 1;
				else
					page = Integer.parseInt(request.getParameter("page"));
			}catch(IllegalArgumentException e){
				response.sendRedirect("message.jsp?message=" + URLEncoder.encode(e.toString(), "UTF-8"));
				return;
				
			}
			CarRepository carRepository = new CarRepository();
			 cars = carRepository.searchCars(string, page);
	
			if(!cars.isEmpty()){
				for(int i =0;i<20;++i){
				 	System.out.println(cars.get(i).toString());
				 	System.out.println(cars.get(i).getMileage());
			 }
			response.sendRedirect("searchCar.jsp?message=" + URLEncoder.encode(cars.get(1).toString() , "UTF-8"));
			}
			else
				response.sendRedirect("searchCar.jsp?message=" + URLEncoder.encode("no cars found", "UTF-8"));
			
			doGet(request, response);
	
	}

}
