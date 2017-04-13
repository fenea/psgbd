package carseller.servlets;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carseller.db.DatabaseConnection;
import oracle.jdbc.OracleTypes;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection connection = DatabaseConnection.getConnection();
		try {
			CallableStatement cstmt = connection.prepareCall("{ call suggestion.suggestion_on_car_page(?, ?, ?) }");
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.setInt(2, 1);
			cstmt.setInt(3, 1);
			cstmt.executeUpdate();
			ResultSet rs = (ResultSet)cstmt.getObject(1);
			while(rs.next()){
				System.out.println(rs.getInt(1) + " - " +
								   rs.getString(2) + " - " + 
								   rs.getInt(6) + " - " + 
								   rs.getInt(13));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/main.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
