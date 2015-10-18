<html>
<head>
<style>
h1
{
	font-family:comic sans ms;
	font-size:35px;
	text-align:center;
}
h2
{
	font-family:times new roman;
	font-size:25px;
	text-align:center;
}
p
{
	font-family:comic sans ms;
	font-size:20px;
	text-align:justify;
}

a:link {text-decoration:none;color:black;}   
a:visited {text-decoration:none;color:black;} 
a:hover {text-decoration:none;color:black;}   
a:active {text-decoration:none;color:black;}
</style>
<script>
function myfunc(element)
{
	document.getElementById("demo").innerHTML=element.value;
}
</script>
</head>
<body>
<center>
<div id="container"style="width:screen.width;background-color:orchid;height:1000px;color:white">
<div id="head"style="width:screen.width;height:150px;background-color:black">
<div id="head1" style="width:200px;height:150px;float:left"><img src="header3.jpg" width="200px" height="150px"></div><br><br>
<font size="20px">ISTA EXPENSE TRACKER </font></div>
<div id="menu"style="width:screen.width-200px;background-color:grey;height:20px"></div>
<div id="body"style="width:screen.width;height:650;color:black">
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
Statement st=con.createStatement();
%>
<br>
<div id="b1" style="width:900px;height:50px;float:left;color:black;size:10px">
<h3><font style="float:right"><a href="adminlogin.jsp">LOGOUT</a></font><h3>
</div><br><br><br><br>
<%
String name=request.getParameter("details");
String type1=request.getParameter("type1");
Integer amount=Integer.parseInt(request.getParameter("amount"));
if(type1.equals("itrix"))
{
ResultSet rs=st.executeQuery("select * from budgetitrix where details='"+name+"'");
if(!rs.next())
{
PreparedStatement ps=con.prepareStatement("insert into budgetitrix values(?,?)");
ps.setString(1,name);
ps.setInt(2,amount);
ps.executeUpdate();
}
else
{
		st.executeUpdate("update budgetitrix set amount='"+amount+"' where details='"+name+"'");
}
}
else if(type1.equals("i++"))
{
ResultSet rs=st.executeQuery("select * from budgetiplus where details='"+name+"'");
if(!rs.next())
{
PreparedStatement ps=con.prepareStatement("insert into budgetiplus values(?,?)");
ps.setString(1,name);
ps.setInt(2,amount);
ps.executeUpdate();
}
else
{
		st.executeUpdate("update budgetiplus set amount='"+amount+"' where details='"+name+"'");
}
}
else if(type1.equals("meeting"))
{
ResultSet rs=st.executeQuery("select * from budgetmeet where details='"+name+"'");
if(!rs.next())
{
PreparedStatement ps=con.prepareStatement("insert into budgetmeet values(?,?)");
ps.setString(1,name);
ps.setInt(2,amount);
ps.executeUpdate();
}
else
{
		st.executeUpdate("update budgetmeet set amount='"+amount+"' where details='"+name+"'");
}
}
else if(type1.equals("conference"))
{
ResultSet rs=st.executeQuery("select * from budgetcon where details='"+name+"'");
if(!rs.next())
{
PreparedStatement ps=con.prepareStatement("insert into budgetcon values(?,?)");
ps.setString(1,name);
ps.setInt(2,amount);
ps.executeUpdate();
}
else
{
		st.executeUpdate("update budgetcon set amount='"+amount+"' where details='"+name+"'");
}
}
else if(type1.equals("fresher's day"))
{
ResultSet rs=st.executeQuery("select * from budgetfresh where details='"+name+"'");
if(!rs.next())
{
PreparedStatement ps=con.prepareStatement("insert into budgetfresh values(?,?)");
ps.setString(1,name);
ps.setInt(2,amount);
ps.executeUpdate();
}
else
{
		st.executeUpdate("update budgetfresh set amount='"+amount+"' where details='"+name+"'");
}
}
else
{
ResultSet rs=st.executeQuery("select * from budgetothers where details='"+name+"'");
if(!rs.next())
{
PreparedStatement ps=con.prepareStatement("insert into budgetothers values(?,?)");
ps.setString(1,name);
ps.setInt(2,amount);
ps.executeUpdate();
}
else
{
		st.executeUpdate("update budgetothers set amount='"+amount+"' where details='"+name+"'");
}
}
%>
<jsp:forward page="preparebudget.jsp"/>
<%
}
catch(Exception e)
{
out.println("error:"+e.getMessage());
}
%>
</html>