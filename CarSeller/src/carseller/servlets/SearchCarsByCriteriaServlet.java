package carseller.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carseller.controller.ModelBean;
import carseller.controller.PropertiesBean;
import carseller.properties.Printer;

/**
 * Servlet implementation class SearchCarsByCriteriaServlet
 */
@WebServlet("/makes")
public class SearchCarsByCriteriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCarsByCriteriaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String make = request.getParameter("make");
		if(make != null){
			ModelBean bean = new ModelBean();
			Printer.printDebugMsg("get models by make", make);
			PrintWriter writer = response.getWriter();
			List<String> models = bean.getModelsByMakeName(make);
			for(String model : models){
				writer.println(model);
			}
			response.setStatus(HttpServletResponse.SC_OK);
			return;
		}
		response.setStatus(HttpServletResponse.SC_NO_CONTENT);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
