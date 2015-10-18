<html>
<head>
<style>

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
<%@ page import="java.util.Calendar"%>
 <%@ page import="java.util.Date"%>
<%@ page import="java.util.TimeZone"%>
<%try
    {%>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/ista","root","root");
Statement st=con.createStatement();%>
<br>
<div id="b1" style="width:900px;height:50px;float:left;color:black;size:10px">
<h3><font style="float:right"><a href="adminlogin.jsp">LOGOUT</a></font><h3>
</div>
<%
String chk=request.getParameter("events");
String type1=request.getParameter("type1");
out.println(chk+"   "+type1);
if(type1.equals("itrix"))
{
int a=st.executeUpdate("delete from budgetitrix where details='"+chk+"'");
}
else if(type1.equals("i++"))
{
	int a=st.executeUpdate("delete from budgetiplus where details='"+chk+"'");
}
else if(type1.equals("meeting"))
{
	int a=st.executeUpdate("delete from budgetmeet where details='"+chk+"'");
}
else if(type1.equals("conference"))
{
	int a=st.executeUpdate("delete from budgetcon where details='"+chk+"'");
}
else if(type1.equals("fresher's day"))
{
	int a=st.executeUpdate("delete from budgetfresh where details='"+chk+"'");
}
else
{
	int a=st.executeUpdate("delete from budgetothers where details='"+chk+"'");
}
	%><br><br>
<jsp:forward page="preparebudget.jsp"/>

<%}
catch(Exception e)
{
out.println("error:"+e.getMessage());
}
%>
</div>
</div>
</body>
</html>