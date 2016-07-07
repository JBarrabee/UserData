<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css"
	integrity="sha384-XXXXXXXX" crossorigin="anonymous">
<script
	src="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/js/bootstrap.js"
	integrity="sha384-XXXXXXXX" crossorigin="anonymous"></script>
<style>
h1 {
	background:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/652/confectionary.png);
	background-repeat: no-repeat color: #838383;
	font-family: 'Helvetica Neue', sans-serif;
	font-size: 100px;
	font-weight: bold;
	letter-spacing: -1px;
	line-height: 1;
	text-align: center;
}

.btn-group {
	nbn position: absolute;
	transition: .5s ease;
	top: 40%;
	left: 7%;
}
.whatv {
	text-align:center;
}
h2 {
	position: absolute;
	transition: .5s ease;
	top: 39%;
	left: 37%;
}
p{
 text-align:center;
 font-size: 25px;
}
</style>
<title>For Peter's sake insert something here</title>
</head>
<body>
	<h1>Welcome to the Movie Database!</h1>
	<h2>Please select a category</h2>
	<br>
	<br>
	<div class="btn-group" role="group" aria-label="Basic example">
		<form name="form" action="index.jsp" method="post">
			<button name="comedy" class="btn btn-lg btn-primary">Comedy</button>
			<button name="drama" class="btn btn-lg btn-success">Drama</button>
			<button name="horror" class="btn btn-lg btn-warning">Horror</button>
			<button name="action" class="btn btn-lg btn-primary">Action</button>
			<button name="mystery" class="btn btn-lg btn-success">Mystery</button>
			<button name="science fiction" class="btn btn-lg btn-warning">Science Fiction</button>
			<button name="music" class="btn btn-lg btn-primary">Music</button>
			<button name="war" class="btn btn-lg btn-success">War</button>
			<button name="westerns" class="btn btn-lg btn-warning">Westerns</button>
			<br> <br>
			<div class = "whatv">
				<button name="crime" class="btn btn-lg btn-primary">Crime</button>
				<button name="romance" class="btn btn-lg btn-success">Romance</button>
				<button name="fantasy" class="btn btn-lg btn-warning">Fantasy</button>
				<button name="adventure" class="btn btn-lg btn-primary">Adventure</button>
				</div>
			 <br><br> 
			 <p>or select by Actors</p>
			 <br>
			 <select name="Actor">
				<option value="all">Select Actor</option>
				<%
					Connection con = null;
					Statement st = null;
					ResultSet rs = null;
					String url = "jdbc:mysql://localhost:3306/film?useSSL=true";
					//DO NOT include this info in .java files pushed to GitHub in real projects
					String user = "java3";
					String password = "java123";
			
					try {
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection(url, user, password);
						st = con.createStatement();
						String catQuery = "SELECT DISTINCT Actor FROM film";
						rs = st.executeQuery(catQuery);
						while (rs.next()) {
							String cat = rs.getString(1);
							out.println("<option value=\"" + cat + "\">" + cat + "</option>");
						}
					} catch (SQLException e) {
						out.println("DB Exception: " + e);
					} finally {
						try {
							if (rs != null) {
								rs.close();
							}
							if (st != null) {
								st.close();
							}
							if (con != null) {
								con.close();
							}
						} catch (SQLException e) {
							out.println("DB Exception in finally: " + e);
						}
					}
				%>
			</select><input type="submit" value="View Movies">
				 <select name="Actress">
				<option value="all">Select Actress</option>
				<%
				/* 	Connection con = null;
					Statement st = null;
					ResultSet rs = null;
					String url = "jdbc:mysql://localhost:3306/film?useSSL=true";
					//DO NOT include this info in .java files pushed to GitHub in real projects
					String user = "java3";
					String password = "java123"; */
			
					try {
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection(url, user, password);
						st = con.createStatement();
						String catQuery = "SELECT DISTINCT Actress FROM film";
						rs = st.executeQuery(catQuery);
						while (rs.next()) {
							String cat = rs.getString(1);
							out.println("<option value=\"" + cat + "\">" + cat + "</option>");
						}
					} catch (SQLException e) {
						out.println("DB Exception: " + e);
					} finally {
						try {
							if (rs != null) {
								rs.close();
							}
							if (st != null) {
								st.close();
							}
							if (con != null) {
								con.close();
							}
						} catch (SQLException e) {
							out.println("DB Exception in finally: " + e);
						}
					}
				%>
			</select><input type="submit" value="View Movies">
		</form>
		
		
	</div>
	<br><br>
</body>
</html>