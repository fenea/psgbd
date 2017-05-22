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
		  <script src="js/jquery.min.js"></script>
		  <script src="js/bootstrap.min.js"></script>
		<title>Login</title>
	</head>
<body>
	<div class="page-header jumbotron page-header-custom" >
		<h1 class = "text-header-align"> Welcome to CarSeller </h1>
	</div>
	
	<div class="container-fluid container-distance" style="width:70%">
		<div class="jumbotron">
			<h2 class="text-center">Login</h2>
		  	<form action="/login" method="post">
		    <div class="form-group">
		      	<label for="username">Username:</label>
		      	<input type="email" class="form-control" id="username" placeholder="Enter username" name="username">
		    </div>
		    <div class="form-group">
		      	<label for="pwd">Password:</label>
		      	<input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
		    </div>
		    <button type="submit" class="btn btn-default">Submit</button>
		  </form>
		</div>
	</div>
</body>
</html>