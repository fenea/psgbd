
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="modelBean" class="carseller.controller.ModelBean" scope="request"></jsp:useBean>
<title>search cars</title>
</head>
<body>

<form action="search" method="GET">
		<select name = "car_manufacturer">
			<option value="0" >Select Car Manufacturer</option>
				<%
					
					for (String carMake : modelBean.getAllMakes()) {
				%>
					<option > <%=carMake%></option>
					

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
</body>
</html>