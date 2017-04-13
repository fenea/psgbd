<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert</title>
</head>
<body>
	<h1> Insert user </h1>
	<div >
		<fieldset>
			<legend>User details</legend>

			<form method="post" action="UserInsert">

				<div >
					<label for="name">Name:</label> 
					<input type="text" name="name" id="name">
				</div>
				
				<div >
					<label for="forename">Forename:</label> 
					<input type="text" name="forename" id="forename">
				</div>
				
				<div>
					<label for="username">Username:</label> 
					<input type="text" name="username" id="username" >
				</div>
				
				<div >
					<label for="email">Email:</label> 
					<input type="text" name="email" id="email" >
				</div>
				
				<div >
					<label for="phone">Phone number:</label> 
					<input type="text" name="phone" id="phone">
				</div>
				
				<div >
					<label for="pass">Password:</label> 
					<input type="password" name="pass" id="pass">
				</div>
				

				<button type="submit" class="btn btn-primary">Insert</button>
			</form>

		</fieldset>
	</div>
	
</body>
</html>