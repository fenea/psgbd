<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>car</title>
</head>
<body>
	<div >
	<h1> search car </h1>
	<form method="post" action="searchCar">

				<div >
					<label for="id">search:</label> 
					<input type="text" name="search_string" id="search_string"></br>
					<label for="id">page:</label> 
					<input type="text" name="page" id="page">
				</div>
			
				<button type="submit" class="btn btn-primary">search</button>
			</form>

	</div>
	<div>
	<h3>${param.message}</h3></div>
</body>
</html>