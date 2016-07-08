<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>delete User</title>
</head>
<body>
Would you like to delete a user?

Please enter the user name of the user you want to delete

<div class="btn-group" role="group" aria-label="Basic example">
		<form name="form1" action="deleteUser.jsp" method="get">
	UserName: <input name="username" type="text"><br>
	<button type="submit">Submit!</button>
</form>
</div>
<%  
String username = request.getParameter("username");

%>

</body>
</html>