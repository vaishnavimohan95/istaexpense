<html>
<head>
<style>
button{
border:2px solid red;
border-radius:10px;
height:100px;
width:250px;
}
a:link {text-decoration:none;color:black;}   
a:visited {text-decoration:none;color:black;} 
a:hover {text-decoration:none;color:black;}   
a:active {text-decoration:none;color:black;}
</style>
</head>
<body>
<center>
<div id="container"style="width:screen.width;background-color:orchid;height:1000px;color:white">
<div id="head"style="width:screen.width;height:150px;background-color:black">
<div id="head1" style="width:200px;height:150px;float:left"><img src="header3.jpg" width="200px" height="150px"></div><br><br>
<font size="20px">ISTA EXPENSE TRACKER </font></div>
<div id="menu"style="width:screen.width-200px;background-color:grey;height:20px"></div>
<div id="body"style="width:screen.width;height:650">
<%@ page import="java.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="javax.sql.*" %>
<%
  
    try
    {%>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/ista","root","root");
boolean status=false; 
PreparedStatement ps=con.prepareStatement("select * from userdetails where username=? and pwd=?");
String username=request.getParameter("uname");
String pwd=request.getParameter("pwd");
if(username.equals("ista_member"))
{
if(pwd.equals("ista_login"))
{%>
	<jsp:forward page="memberhome.jsp"></jsp:forward>
<%}
else
{%>
<jsp:forward page="memberlogin.jsp"></jsp:forward>
<%}
}
else
{%>
<jsp:forward page="memberlogin.jsp"></jsp:forward>
<%}
}
catch(Exception e)
{
out.println("error:"+e.getMessage());
}
%>
</div>
</div>
</body>
</html>