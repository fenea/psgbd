<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="css/bootstrap.min.css">
		   <link rel="stylesheet" href="css/header.css">
		<title>SignUp</title>
	</head>
<body>
	<div class="page-header jumbotron page-header-custom" >
		<h1 class = "text-header-align"> Welcome to CarSeller </h1>
	</div>

	<div class="container-width container-fluid container-distance">
		<div class="jumbotron">
			<h2 class="text-center">SignUp</h2>
		  	<form action="UserInsert" method="post" onsubmit="return validateForm()">
		  	
		  	<div class="form-group">
		      	<label for="name">Name:</label>
		      	<input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
		    </div>
		    
		    <div class="form-group">
		      	<label for="forename">Forename:</label>
		      	<input type="text" class="form-control" id="forename" placeholder="Enter forename" name="forename">
		    </div>
		  	
		    <div class="form-group">
		      	<label for="username">Username:</label>
		      	<input type="text" class="form-control" id="username" onblur="checkUsername()" placeholder="Enter username" name="username">
		    </div>
		    
		    <div class="display-none" id="warn-username">
		  		<div class="alert alert-warning">
			    	<strong>Username already exist</strong>
				</div>
		    </div>
		    
		    <div class="form-group">
		      	<label for="email">Email:</label>
		      	<input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
		    </div>
		    
		    <div class="form-group">
		      	<label for="phone">Phone:</label>
		      	<input type="tel" class="form-control" id="phone" placeholder="Enter phone" name="phone">
		    </div>
		    
		    <div class="form-group">
		      	<label for="pwd1">Password:</label>
		      	<input type="password" class="form-control" id="pwd1" placeholder="Enter password" name="pwd1">
		    </div>
		    
		    <div class="form-group">
		      	<label for="pwd2">Reinsert password:</label>
		      	<input type="password" class="form-control" oninput="check()" id="pwd2" placeholder="Enter password" name="pwd2">
		    </div>
		    
		    <div class="display-none" id="warn-psw">
		  		<div class="alert alert-warning">
			    	<strong>Passwords are not the same</strong>
				</div>
		    </div>
		    <button type="submit" class="btn btn-success">Submit</button>
		  </form>
		</div>
	</div>
	<script type="text/javascript" src="js/function.js"></script>
</body>
</html>