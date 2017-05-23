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
		<title>Login</title>
	</head>
<body>
	<div class="page-header jumbotron page-header-custom" >
		<h1 class = "text-header-align"> Welcome to CarSeller </h1>
	</div>
	
	<div class="container-width container-fluid container-distance">
		<div class="jumbotron">
			<h2 class="text-center">Login</h2>
		  	<form action="login" method="post">
		    <div class="form-group">
		      	<label for="username">Username:</label>
		      	<input type="text" class="form-control" id="username" placeholder="Enter username" name="username">
		    </div>
		    <div class="form-group">
		      	<label for="pwd">Password:</label>
		      	<input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
		    </div>
		    <%
		    {
		    	String status = (String)request.getAttribute("status");
		    	if(status == null || status.equals("true")){
		    %>
		    	<div class="display-none">

		    <%
		    	}else{
		    %>
		    	<div>
		    <%
		    	}}
		    %>
		    	<div class="alert alert-danger alert-dismissable">
		    		<a href="" class="close" data-dismiss="alert" aria-label="close">×</a>
		    		<strong>Wrong username or password</strong>
		 	 	</div>
		  	</div>
		    <button type="submit" class="btn btn-default">Submit</button>
		  </form>
		</div>
	</div>
	<script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>