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
</head>
<body>
<div class="page-header jumbotron page-header-custom" >
	<h1 class = "text-header-align"> Welcome to CarSeller (ADMIN) </h1>
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

<div class="container-width container-fluid container-distance">
		<div class="jumbotron">
			<h2 class="text-center">Admin commands</h2>
			
			<div class="row" style="display: inline">
			<label for="button">Export database:</label>
			<input type="button" class="btn btn-info" value="Input Button" onclick="location.href = 'export';">
			</div>
			
		</div>
</div>
</body>
</html>