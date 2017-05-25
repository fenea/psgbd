<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="carseller.model.Fuel"%>
<%@ page import="carseller.model.BodyType"%>
<%@ page import="carseller.model.Color"%>
<!DOCTYPE html >
<html>
<head>
	<jsp:useBean id="modelBean" class="carseller.controller.ModelBean" scope="request"></jsp:useBean>
	<jsp:useBean id="carBean" class="carseller.controller.CarBean" scope="request"></jsp:useBean>
	<jsp:useBean id="propertiesBean" class="carseller.controller.PropertiesBean" scope="request"></jsp:useBean>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/header.css">
	<title><%=carBean.getCar().getTitle()%></title>
</head>
<body>
<div class="page-header jumbotron page-header-custom" >
	<h1 class = "text-header-align"> Welcome to CarSeller </h1>
</div>

<div class="container-width container-fluid container-distance">
	<div class="jumbotron">
	
	<h2 class="text-center"><%=carBean.getCar().getTitle() %></h2>
		  	<form action="CarForm" method="post" style="padding-top: 30px">
		  		<p>Author: <a href = "#"><%=carBean.getCar().getOwnerUsername() %></a></p>
			    <div class="form-inline" >
			    	<div class="form-group col-xs-6" style="padding: 0">
			    	<label for="make">Select make:</label>
			    	<select class="form-control" id="make" name="make" style="width: 300px" onchange="addModels()">
			    		<%if(request.getAttribute("author").equals("true")){ %>
				    		<option></option>
				    		<%
							for (String carMake : modelBean.getAllMakes()) {
							%>
								<option > <%=carMake%></option>
						<%} }else {%>
							<option><%=carBean.getCar().getModel().getMake() %></option>
						<%} %>
			    	</select>
			    	</div>
			    	<div class="form-group col-xs-6 text-right" style="padding: 0">
				    	<label for="model">Select model:</label>
				    	<select class="form-control" id="model" name="model" style="width: 300px">
				    		<%if(!request.getAttribute("author").equals("true")){ %>
				    			<option><%=carBean.getCar().getModel().getModel() %></option>
				    		<%} %>
				    	</select>
			    	</div>
			    </div>
			    
			    <%{ boolean isAuth = request.getAttribute("author").equals("true"); %>
			    
			    <div class="form-group">
					<label for="title">Title:</label>
					<%if(isAuth) {%> 
						<input type="text" class="form-control" id="title" name = "title" value="<%=carBean.getCar().getTitle() %>">
					<%} else { %>
						<input type="text" class="form-control" id="title" name = "title" value="<%=carBean.getCar().getTitle() %>" readonly>
					<%} %>
				</div >
				<div class="form-inline">
					<div class="form-group col-xs-6" style="padding: 0">
				    	<label for="year">Year of production of the car:</label>
				    	<select class="form-control" id="year" name="year" >
				    		<%if(isAuth){ %>
				    		<option><%=carBean.getCar().getYear() %></option>
				    		<%{
				    		int year = Calendar.getInstance().get(Calendar.YEAR);
							for (int i = 1960; i <= year; ++i) {
								if(i == carBean.getCar().getYear() )
									continue;
							%>
								<option > <%=i%></option>
							<%}}} else{%>
								<option><%=carBean.getCar().getYear() %></option>
							<%} %>
				    	</select>
			    	</div>
			    	
			    	<div class="form-group col-xs-6 text-right" style="padding: 0">
			    		<label for="price">Price:</label>
			    		<%if(isAuth) {%> 
  							<input type="number" class="form-control" id="price" name="price" placeholder="euro" value="<%=carBean.getCar().getPrice() %>">
  						<%} else { %>
  							<input type="number" class="form-control" id="price" name="price" placeholder="euro" value="<%=carBean.getCar().getPrice() %>" readonly>
  						<%} %>
			    	</div>
			    	
			    	
				</div>
				
				<div class="form-group" style="padding: 0">
			    		<label for="mileage">Mileage:</label>
			    		<%if(isAuth) {%> 
  							<input type="number" class="form-control" id="mileage" name="mileage" placeholder="km" value="<%=carBean.getCar().getMileage() %>">
			    		<%} else {%>
			    			<input type="number" class="form-control" id="mileage" name="mileage" placeholder="km" value="<%=carBean.getCar().getMileage() %>" readonly>
			    		<%} %>
			    </div>
				
				<div class="form-inline" >
			    	<div class="form-group col-xs-6" style="padding: 0">
			    		<label for="engine-capacity">Engine capacity:</label>
			    		<%if(isAuth) {%>
  							<input type="number" class="form-control" id="engine-capacity" name="engine-capacity" placeholder="cmc" value="<%=carBean.getCar().getEngineCapacity() %>">
			    		<%} else{ %>
			    			<input type="number" class="form-control" id="engine-capacity" name="engine-capacity" placeholder="cmc" value="<%=carBean.getCar().getEngineCapacity() %>" readonly>
			    		<%} %>
			    	</div>
			    	
			    	<div class="form-group col-xs-6 text-right" style="padding: 0">
			    		<label for="doors">Doors number:</label>
			    		<%if(isAuth) {%>
  							<input type="number" class="form-control" id="doors" name="doors" value="<%=carBean.getCar().getDoorNumber() %>">
  						<%} else{ %>
  							<input type="number" class="form-control" id="doors" name="doors" value="<%=carBean.getCar().getDoorNumber() %>" readonly>
  						<%} %>
			    	</div>
			    </div>
			    
			    <div class="form-group" style="padding: 0">
			    	<label for="body-type">Select body type:</label>
			    	<select class="form-control" id="body-type" name="body-type">
			    		<%if(isAuth){ %>
				    		<option><%=carBean.getCar().getBody().getBodyType()%></option>
			    		<%
						for (BodyType bodyType : propertiesBean.getBodyTypes()) {
							if(bodyType.equals(carBean.getCar().getBody().getBodyType())){
								continue;
							}
						%>
							<option > <%=bodyType.getBodyType()%></option>
						<%}} else {%>
							<option><%=carBean.getCar().getBody().getBodyType()%></option>
						<%} %>
			    	</select>
			    </div>
			    
			    <div class="form-inline" >
			    	<div class="form-group col-xs-6" style="padding: 0">
			    	<label for="fuel">Select fuel:</label>
			    	<select class="form-control" id="fuel" name="fuel" style="width: 300px">
			    		<%if(isAuth){ %>
			    			<option><%=carBean.getCar().getFuel().getFuel()%></option>
			    		<%
						for (Fuel fuel : propertiesBean.getFuelTypes()) {
							if(fuel.getFuel().equals(carBean.getCar().getFuel().getFuel()))	
								continue;
						%>
							<option> <%=fuel.getFuel()%></option>
						<%}} else {%>
							<option><%=carBean.getCar().getFuel().getFuel()%></option>
						<%} %>
			    	</select>
			    	</div>
			    	<div class="form-group col-xs-6 text-right" style="padding: 0">
				    	<label for="color">Select color:</label>
				    	<select class="form-control" id="color" name="color" style="width: 300px">
					    	<%if(isAuth){ %>
					    	<option><%=carBean.getCar().getColor().getColor()%></option>
				    		<%
							for (Color color : propertiesBean.getColors()) {
								if(color.getColor().equals(carBean.getCar().getColor().getColor())){
									continue;
								}
							%>
								<option> <%=color.getColor()%></option>
							<%}} else {%>
								<option><%=carBean.getCar().getColor().getColor()%></option>
							<%} %>
					    	</select>
			    	</div>
			    </div>
			    <% if(isAuth){%>
			    	<button type="submit" class="btn btn-success">Save changes</button>
			    <%}} %>
		  </form>
	
	</div>
</div>
</body>
</html>