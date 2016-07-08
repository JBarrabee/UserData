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
	<button type="submit">Submit!</button><br><br>
</form>
</div>
<%  
String deleteUsername = request.getParameter("username");
	
//String query = "DELETE FROM users WHERE username = deleteUsername";

String query = "Select username From users ";
Class.forName("com.mysql.jdbc.Driver");
boolean found = false;
if (deleteUsername !=null){
try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproducts?useSSL=true", "java3", "java123")){ 
	Statement statement = con.createStatement();
	ResultSet rs = statement.executeQuery(query);
	while(rs.next()) {
		String  title = rs.getString("username");
		if (title.equalsIgnoreCase(deleteUsername)){
			found = true;
			break;
			}
		else {found = false;
		}		
	}
} catch (SQLException ex){
	System.out.println("There was a database error" + ex.getMessage());
}
if (found == true) {
	out.println(deleteUsername + "  was found");}
else{ out.println(deleteUsername + " was not found in the system.");
}
}
%>

</body>
</html>