<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
</head>
<body>
	<div >
		<fieldset>
			<legend>Change password</legend>

			<form method="post" action="ChangePassword">

				<div >
					<label for="id">User id:</label> 
					<input type="text" name="id" id="id">
				</div>
				
				<div >
					<label for="old">Old password:</label> 
					<input type="password" name="old" id="old">
				</div>
				
				<div>
					<label for="new">New password:</label> 
					<input type="password" name="new" id="new" >
				</div>

				<button type="submit" class="btn btn-primary">Change</button>
			</form>

		</fieldset>
	</div>
</body>
</html>