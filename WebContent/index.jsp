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
<title>For Peter's sake insert something here</title>
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
<form action="form.jsp">
    <input type="submit" value="Want another search?">
</form>
<table border="1">
<tr>
  	<th>Year</th>
    <th>Length</th>
    <th>Title</th>
    <th>Category</th>
    <th>Actor</th>
    <th>Actress</th>
    <th>Popularity</th>

  </tr>

<%	
	 String query = "";
	String [] array = {"comedy","drama", "horror","action","mystery","science fiction",
    		 "music", "war", "westerns", "crime","romance", "fantasy","adventure"}; 
     for (String myArray: array) { 
     if (request.getParameter(myArray)!= null) {   	 
 	 request.getParameter(myArray);
	 query = "SELECT * FROM film WHERE Subject = " + "'"  + myArray + "'" +  "ORDER BY title";	
	 }
	 
    } 
     
     
     
 if (query != ""){    
Class.forName("com.mysql.jdbc.Driver");
try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/film?useSSL=true", "java3", "java123")){ 
	Statement statement = con.createStatement();
	ResultSet rs = statement.executeQuery(query);
	while(rs.next()) {
		int year = rs.getInt("Year");
		int length = rs.getInt("Length");
		String  title = rs.getString("Title");
		String subject = rs.getString("Subject");
		String actor = rs.getString("Actor");
		String actress = rs.getString("Actress");
		int pop = rs.getInt("popularity");
		out.println("<tr><td>" + year + "</td><td>" + length + " min </td><td>" + title +"</td><td>" +  subject  
				+"</td><td>" + actor +"</td><td>" + actress + "</td><td>" + pop); 
		
	}
} catch (SQLException ex){

	System.out.println("There was a database error" + ex.getMessage());
}

}
 query = "";
 String actorChoice = "";
 if (request.getParameter("Actor")!= null) {
 	actorChoice  = request.getParameter("Actor");
 	//out.println("you chose:" + actorChoice);
 query = "SELECT * FROM film WHERE actor = " + "'"  + actorChoice + "'" +  "ORDER BY title";	
 }
 if (query != ""){    
Class.forName("com.mysql.jdbc.Driver");
try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/film?useSSL=true", "java3", "java123")){ 
	Statement statement = con.createStatement();
	ResultSet rs = statement.executeQuery(query);
	while(rs.next()) {
		int year = rs.getInt("Year");
		int length = rs.getInt("Length");
		String  title = rs.getString("Title");
		String subject = rs.getString("Subject");
		String actor = rs.getString("Actor");
		String actress = rs.getString("Actress");
		int pop = rs.getInt("popularity");
		out.println("<tr><td>" + year + "</td><td>" + length + " min</td><td>" + title +"</td><td>" +  subject  
				+"</td><td>" + actor +"</td><td>" + actress + "</td><td>" + pop); 
		
	}
} catch (SQLException ex){

	System.out.println("There was a database error" + ex.getMessage());
}

}
 query = "";
 String actressChoice = "";
 if (request.getParameter("Actress")!= null) {
 	actressChoice  = request.getParameter("Actress");
 	//out.println("you chose:" + actorChoice);
 query = "SELECT * FROM film WHERE actress = " + "'"  + actressChoice + "'" +  "ORDER BY title";	
 }
 if (query != ""){    
Class.forName("com.mysql.jdbc.Driver");
try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/film?useSSL=true", "java3", "java123")){ 
	Statement statement = con.createStatement();
	ResultSet rs = statement.executeQuery(query);
	while(rs.next()) {
		int year = rs.getInt("Year");
		int length = rs.getInt("Length");
		String  title = rs.getString("Title");
		String subject = rs.getString("Subject");
		String actor = rs.getString("Actor");
		String actress = rs.getString("Actress");
		int pop = rs.getInt("popularity");
		out.println("<tr><td>" + year + "</td><td>" + length + " min</td><td>" + title +"</td><td>" +  subject  
				+"</td><td>" + actor +"</td><td>" + actress + "</td><td>" + pop); 
		
	}
} catch (SQLException ex){

	System.out.println("There was a database error" + ex.getMessage());
}

}	 
	 
%>
</table>
</body>
</html>