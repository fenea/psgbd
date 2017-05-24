<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="carseller.model.Fuel"%>
<%@ page import="carseller.model.BodyType"%>
<%@ page import="carseller.model.Color"%>
<!DOCTYPE html>
<html>
	<jsp:useBean id="modelBean" class="carseller.controller.ModelBean" scope="request"></jsp:useBean>
	<jsp:useBean id="propertiesBean" class="carseller.controller.PropertiesBean" scope="request"></jsp:useBean>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="css/bootstrap.min.css">
		  <link rel="stylesheet" href="css/header.css">
		<title>Car Form</title>
	</head>
<body>
	<div class="jumbotron page-header-custom" >
		<h1 class = "text-header-align"> Welcome to CarSeller </h1>
	</div>

	<div class="container-width container-fluid container-distance">
		<div class="jumbotron">
			<h2 class="text-center">Car form</h2>
		  	<form action="login" method="post" style="padding-top: 30px">
			    <div class="form-inline" >
			    	<div class="form-group col-xs-6" style="padding: 0">
			    	<label for="make">Select make:</label>
			    	<select class="form-control" id="make" name="make" style="width: 300px" onchange="addModels()">
			    		<option></option>
			    		<%
						for (String carMake : modelBean.getAllMakes()) {
						%>
							<option > <%=carMake%></option>
						<%}%>
			    	</select>
			    	</div>
			    	<div class="form-group col-xs-6 text-right" style="padding: 0">
				    	<label for="model">Select model:</label>
				    	<select class="form-control" id="model" name="model" style="width: 300px">
				    	</select>
			    	</div>
			    </div>
			    
			    <div class="form-group">
					<label for="title">Title:</label>
					<input type="text" class="form-control" id="title" name = "title">
				</div >
				<div class="form-inline">
					<div class="form-group col-xs-6" style="padding: 0">
				    	<label for="year">Year of production of the car:</label>
				    	<select class="form-control" id="year" name="year" >
				    		<option></option>
				    		<%{
				    		int year = Calendar.getInstance().get(Calendar.YEAR);
							for (int i = 1960; i <= year; ++i) {
							%>
								<option > <%=i%></option>
							<%}}%>
				    	</select>
			    	</div>
			    	
			    	<div class="form-group col-xs-6 text-right" style="padding: 0">
			    		<label for="price">Price:</label>
  						<input type="number" class="form-control" id="price" name="price" placeholder="euro">
			    	</div>
			    	
			    	
				</div>
				
				<div class="form-group" style="padding: 0">
			    		<label for="mileage">Mileage:</label>
  						<input type="number" class="form-control" id="mileage" name="mileage" placeholder="km">
			    </div>
				
				<div class="form-inline" >
			    	<div class="form-group col-xs-6" style="padding: 0">
			    		<label for="engine-capacity">Engine capacity:</label>
  						<input type="number" class="form-control" id="engine-capacity" name="engine-capacity" placeholder="cmc">
			    	</div>
			    	
			    	<div class="form-group col-xs-6 text-right" style="padding: 0">
			    		<label for="doors">Doors number:</label>
  						<input type="number" class="form-control" id="doors" name="doors">
			    	</div>
			    </div>
			    
			    <div class="form-group" style="padding: 0">
			    	<label for="body-type">Select body type:</label>
			    	<select class="form-control" id="body-type" name="body-type">
			    		<option></option>
			    		<%
						for (BodyType bodyType : propertiesBean.getBodyTypes()) {
						%>
							<option value="<%=bodyType.getId()%>"> <%=bodyType.getBodyType()%></option>
						<%}%>
			    	</select>
			    </div>
			    
			    <div class="form-inline" >
			    	<div class="form-group col-xs-6" style="padding: 0">
			    	<label for="fuel">Select fuel:</label>
			    	<select class="form-control" id="fuel" name="fuel" style="width: 300px">
			    		<option></option>
			    		<%
						for (Fuel fuel : propertiesBean.getFuelTypes()) {
						%>
							<option value="<%=fuel.getId()%>"> <%=fuel.getFuel()%></option>
						<%}%>
			    	</select>
			    	</div>
			    	<div class="form-group col-xs-6 text-right" style="padding: 0">
				    	<label for="color">Select color:</label>
				    	<select class="form-control" id="color" name="color" style="width: 300px">
					    	<option></option>
				    		<%
							for (Color color : propertiesBean.getColors()) {
							%>
								<option value="<%=color.getId()%>"> <%=color.getColor()%></option>
							<%}%>
					    	</select>
			    	</div>
			    </div>
		  </form>
		</div>
		
	</div>
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/function.js"></script>
</body>
</html>