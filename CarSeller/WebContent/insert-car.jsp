<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
		  	<form action="login" method="post">
		    	<label for="makes">Select make:</label>
			    	<div class="row" >
			    	<div class="form-group col-xs-6">
			    	<select class="form-control" id="sel2" style="float: left">
			    		<option>1</option>
				        <option>2</option>
				        <option>3</option>
				        <option>4</option>
			    	</select>
			    	
			    	<select class="form-control" id="sel1" style="float: left">
			    		<option>1</option>
				        <option>2</option>
				        <option>3</option>
				        <option>4</option>
			    	</select>
			    	
			    	</div>
			    	</div>
		  </form>
		</div>
	</div>
	<script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</body>
</html>