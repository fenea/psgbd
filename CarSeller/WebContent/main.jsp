<%@page import="carseller.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main Page</title>
</head>
<body>
	<jsp:useBean id="userBean" class="carseller.controller.UserBean" scope="request"></jsp:useBean>
	
	<div >
		<fieldset>
			<legend>Search Form</legend>

			<form action="SearchServletUser" method="GET">
				<div >
					<div >
						<% if (request.getParameter("searchedValue") == null) { %>
							Search: 
							<input type="text" class="form-control" autocomplete="on" placeholder="Search..."  name="searchedValue">
						<%} else { %>
							Search: 
							<input type="text" class="form-control" value="<%=request.getParameter("searchedValue") %>"  name="searchedValue">
						<% } %>
					</div>
					<div>
						<% if (request.getParameter("page") == null) { %>
							Page:
							<input type="text" class="form-control" autocomplete="on" placeholder=<%=userBean.getPagesNumber() %>  name="page">
						<%} else { %>
							Page:
							<input type="text" class="form-control" value="<%=request.getParameter("page") %>"  name="page">
						<% } %>
					</div>
				</div>

				<div >
					<button type="submit">Search</button>
				</div>
			</form>
		</fieldset>
		<div >
			<ul >
				<%
					
					for (User user : userBean.getUsers()) {
				%>

				<li >
					<div >

						<div >
							<h3><%=user.getUsername()%></h3>

							Name:
							<%=user.getName()%><br /> Forename:
							<%=user.getForename()%><br /> Email:
							<%=user.getEmail()%><br /> 
						</div>

					</div>
				</li>

				<%
					}
				%>

			</ul>
		</div>
	</div>
</body>
</html>