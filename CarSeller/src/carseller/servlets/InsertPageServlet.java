package carseller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carseller.properties.Printer;
import carseller.service.ServiceFactory;

/**
 * Servlet implementation class InsertPageServlet
 */
@WebServlet("/insert-user")
public class InsertPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		
		if(username != null){
			long startTime = System.currentTimeMillis();
			boolean res = ServiceFactory.getUserService().checkUsernameExistence(username);
			long endTime = System.currentTimeMillis();
			Printer.printDebugMsg("InsertPageServlet - doGet", "Time: " + (endTime - startTime));
			if(res)
				response.setStatus(HttpServletResponse.SC_OK);
			else
				response.setStatus(HttpServletResponse.SC_ACCEPTED);
			return;
		}
		request.getRequestDispatcher("/insert-user.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
