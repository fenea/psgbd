<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="carseller.model.Car"%>
<!DOCTYPE html >
<html>
<head>
<jsp:useBean id="carBean" class="carseller.controller.CarBean" scope="request"></jsp:useBean>
<jsp:useBean id="modelBean" class="carseller.controller.ModelBean" scope="request"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/header.css">
</head>
<body>

<div class="page-header jumbotron page-header-custom" >
	<h1 class = "text-header-align"> Welcome to CarSeller </h1>
</div>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">CarSeller</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">Page 1</a></li>
      <li><a href="#">Page 2</a></li>
      <li><a href="#">Page 3</a></li>
    </ul>
  </div>
</nav>

<div class="container-fluid">
<fieldset>
			<legend></legend>

			<form action="searchCar" method="POST">
				<div class="row horizontal-center">
					<div class="input-group">
					    <input type="text" class="form-control" placeholder="Search">
					    <div class="input-group-btn">
					      <button class="btn btn-default" type="submit">
					        <i class="glyphicon glyphicon-search"></i>
					      </button>
					      <button type="button" style="padding-left: 10px" class="btn btn-info" onclick="show()">Show criteria</button>
					    </div>
					</div>
					<div id="more-info" class="display-none">
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
			    
			    <div class="form-group" style="margin-top: 10px">
				<div class="form-inline">
					<div class="form-group col-xs-6" style="padding: 0">
				    	<label for="year">Year between:</label>
				    	<select class="form-control" id="year-min" name="year-min" >
				    		<option></option>
				    		<%{
				    		int year = Calendar.getInstance().get(Calendar.YEAR);
							for (int i = 1960; i <= year; ++i) {
							%>
								<option > <%=i%></option>
							<%}}%>
				    	</select>
				    	<select class="form-control" id="year-max" name="year-max" >
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
  						<input type="number" class="form-control" id="price-min" name="price-min" placeholder="Min price">
  						<input type="number" class="form-control" id="price-max" name="price-max" placeholder="Max price">
			    	</div>
			    	
			    	
				</div>
				</div>
				<div class="form-inline">
			    	<div class="form-group col-xs-6" style="padding: 0">
			    		<label for="mileage">Min mileage:</label>
  						<input type="number" class="form-control" id="mileage-min" name="mileage-min" placeholder="Min km">
			    	</div>
			    	
			    	<div class="form-group col-xs-6 text-right" style="padding: 0">
			    		<label for="mileage">Min mileage:</label>
  						<input type="number" class="form-control" id="mileage-max" name="mileage" placeholder="Max km">
			    	</div>
			    </div>
				
				<div class="form-inline" >
			    	<div class="form-group col-xs-6" style="padding: 0">
			    		<label for="engine-capacity">Min engine capacity:</label>
  						<input type="number" class="form-control" id="engine-capacity-min" name="engine-capacity-min" placeholder="cmc">
			    	</div>
			    	
			    	<div class="form-group col-xs-6 text-right" style="padding: 0">
			    		<label for="engine-capacity">Max engine capacity:</label>
  						<input type="number" class="form-control" id="engine-capacity-max" name="engine-capacity-max" placeholder="cmc">
			    	</div>
			    </div>
			    
			    <div class="form-group" style="padding: 0">
			    	<label for="body-type">Select body type:</label>
			    	<select class="form-control" id="body-type" name="body-type">
			    		<option></option>
			    		
			    	</select>
			    </div>
			    
			    <div class="form-inline" >
			    	<div class="form-group col-xs-6" style="padding: 0">
			    	<label for="fuel">Select fuel:</label>
			    	<select class="form-control" id="fuel" name="fuel" style="width: 300px">
			    		<option></option>
			    		
			    	</select>
			    	</div>
			    	<div class="form-group col-xs-6 text-right" style="padding: 0">
				    	<label for="color">Select color:</label>
				    	<select class="form-control" id="color" name="color" style="width: 300px">
					    	<option></option>
				    		
					    	</select>
			    	</div>
			    </div>
					</div>
				</div>
			</form>
			
		</fieldset>
<div class="container" style="width: 80%">
	<%{ if(carBean.getCars() == null || carBean.getCars().size() == 0)
			return;
		Car firstCar = carBean.getCars().get(0);
		Car lastCar = null;
		for(Car car : carBean.getCars()){
			lastCar = car;
	%>
	<div class="panel panel-default row">
	    <img class="img-fluid img-thumbnail rounded float-left col-sm-4" src="images/not_available.jpg" style="width: 220px; height: 220px" alt="Chania">
	  	<div class="float-right col-sm-8">
		  	<h2><a href="cars?id=<%=car.getId()%>"><%=car.getTitle()%></a></h2>
		  	<p>Make: <%=car.getModel().getMake() %>; Model: <%=car.getModel().getModel() %><br/>
		  	Year: <%=car.getYear() %>; Mileage: <%=car.getMileage() %>; Engine capacity: <%=car.getMileage() %> <br/>
		  	Fuel: <%=car.getFuel().getFuel() %>; Color: <%=car.getColor().getColor() %>
		  	</p>
	    </div>
   	</div>
   	<%}%>
   	
   	<ul class="pager">
	    <li class="previous"><a href="searchCar?page=prev&lastId=<%=firstCar.getId()%>">Previous</a></li>
	    <li class="next"><a href="searchCar?page=next&lastId=<%=lastCar.getId()%>">Next</a></li>
	</ul>
	<%} %>
</div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/function.js"></script>
</body>
</html>