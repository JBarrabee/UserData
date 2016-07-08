<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css"
	integrity="sha384-XXXXXXXX" crossorigin="anonymous">
<script
	src="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/js/bootstrap.js"
	integrity="sha384-XXXXXXXX" crossorigin="anonymous"></script>
<title>List of users</title>
<style>
h {
    background-color: #4CAF50;
    color: white;
}


th, td {
    padding: 15px;
    text-align: left;
}

tr:nth-child(even) {
    background-color: #d3d3d3;
}
</style> 
</head>
<body>
<!-- <form action="form.jsp">
    <input type="submit" value="Want another search?">
</form> -->
<table border="1">
<tr>
  	<th>Username</th>
    <th>Password</th>
    <th>email</th>
    <th>Full Name</th>
    

  </tr>

<%
	 String query = "SELECT * FROM users ORDER BY username";	

 if (query != ""){    
Class.forName("com.mysql.jdbc.Driver"); 
try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproducts?useSSL=true", "java3", "java123")){ 
	Statement statement = con.createStatement();
	ResultSet rs = statement.executeQuery(query);
	while(rs.next()) {
		String username = rs.getString("username");
		String password = rs.getString("password");
		String  email = rs.getString("email");
		String fullName = rs.getString("fullName");
		
		out.println("<tr><td>" + username + "</td><td>" + password + " </td><td>" + email +"</td><td>" +  fullName); 
	}
	}  catch (SQLException ex){

	System.out.println("There was a database error" + ex.getMessage());
}

 }
%>
</table>
</body>
</html>