<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<jsp:useBean id="modelBean" class="carseller.controller.ModelBean" scope="request"></jsp:useBean>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="css/bootstrap.min.css">
		  <link rel="stylesheet" href="css/header.css">
		<title>Car Form</title>
	</head>
<body>
	<div class="page-header jumbotron page-header-custom" >
		<h1 class = "text-header-align"> Welcome to CarSeller </h1>
	</div>

	<div class="container-width container-fluid container-distance">
		<div class="jumbotron">
			<h2 class="text-center">Car form</h2>
		  	<form action="login" method="post" style="padding-top: 30px">
			    <div class="form-inline" >
			    	<div class="form-group col-xs-6">
			    	<label for="make">Select make:</label>
			    	<select class="form-control" id="make" name="make" style="width: 250px" onchange="addModels()">
			    		<option></option>
			    		<%
						for (String carMake : modelBean.getAllMakes()) {
						%>
							<option > <%=carMake%></option>
						<%}%>
			    	</select>
			    	</div>
			    	<div class="form-group col-xs-6">
				    	<label for="model">Select model:</label>
				    	<select class="form-control" id="model" name="model" style="width: 250px">
				    	</select>
			    	</div>
			    </div>
			    <div class="form-group">
					<label for="title">Title:</label>
					<input type="text" class="form-control" id="title" name = "title">
				</div>
				
				
		  </form>
		</div>
		
	</div>
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/function.js"></script>
</body>
</html>