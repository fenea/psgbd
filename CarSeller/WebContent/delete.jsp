<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1> Delete user </h1>
	<div >
		<fieldset>
			<legend>User to delete</legend>

			<form method="post" action="UserDelete">

				<div >
					<label for="id">ID:</label> 
					<input type="text" name="id" id="id">
				</div>
				

				<button type="submit" class="btn btn-primary">Delete</button>
			</form>

		</fieldset>
	</div>
</body>
</html>