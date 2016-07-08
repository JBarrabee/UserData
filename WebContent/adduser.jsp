<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>adduser</title>
</head>
<body style = background: #abb5cb ;>

<%
String username = request.getParameter("username");
String password= request.getParameter("password");
String email = request.getParameter("email");
String fullName = request.getParameter("fullName");

String addUser = null;

addUser =
    "insert into users (index, username, password, email, fullName)"
            + " values (?, ?, ?, ?, ?)";

  if (username != ""){
    Class.forName("com.mysql.jdbc.Driver"); 
try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproducts?useSSL=true", "java3", "java123")){ 
	/* Statement statement = con.createStatement();
	ResultSet rs = statement.executeQuery(addUser);
      */
      // the mysql insert statement
    
      // create the mysql insert preparedstatement
      //con.setAutoCommit(false);
      PreparedStatement preparedStmt = con.prepareStatement(addUser);
      preparedStmt.setString (1, "index");
      preparedStmt.setString (2, "username");
      preparedStmt.setString   (3, "password");
      preparedStmt.setString(4, email);
      preparedStmt.setString    (5, fullName);

      // execute the preparedstatement
      preparedStmt.execute();
      
      con.close();
}
    catch (Exception e)
    {
      System.err.println("Got an exception!");
      System.err.println(e.getMessage());
    }
  }
%>

</body>
</html>