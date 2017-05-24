<%@page import="carseller.model.CarMake"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:useBean id="carBean" class="carseller.controller.CarBean" scope="request"></jsp:useBean>
<title>search cars</title>
</head>
<body>
<div> coolest page here

<% carBean.getMake().get(1).getCarMake(); %></div>


<div >
<form action="search" method="GET">
		<select name = "car_manufacturer">
			<option value="0" >Select Car Manufacturer</option>
				<%
					
					for (CarMake carMake : carBean.getMake()) {
				%>s
					<option > <%=carMake.getCarMake()%></option>
					

				<%
					}
				%>
			</select>
			
			<input type="submit" name="submit" value="Select Car"/>
	
		</form>
				 <%-- To display selected value from dropdown list. --%>
     <% 
                String s=request.getParameter("car_manufacturer");
                if (s !=null)
                {
                    out.println("Selected Car is : "+s);
                }
      %>
</div>
</body>
</html>