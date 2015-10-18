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
 @media print
    {
    	#b4 { display: none; }
    	#container { display: block; }
    }
#itrix {
    font-family: "trebuchet MS", Arial, Helvetica, sans-serif;
    width: 90%;
	color:black;
    border-collapse: collapse;
}

#itrix td, #itrix th {
    font-size: 0.85em;
    border: 1px solid black;
    padding: 4px 3px 3px 3px;
}

#itrix th {
    font-size: 1em;
    text-align: left;
    padding-top: 5px;
    padding-bottom: 4px;
    color:black;
}
a:link {text-decoration:none;color:black;}   
a:visited {text-decoration:none;color:black;} 
a:hover {text-decoration:none;color:black;}   
a:active {text-decoration:none;color:black;}
</style>
<script>
function myfunc(element)
{
	window.print();
}
</script>
</head>
<body>
<center>
<div id="container"style="width:700px;background-color:lightblue;height:1000px;color:white">
<div id="head"style="width:700px;height:100px">
<div id="head1" style="width:200px;height:150px;float:left"><img src="header3.jpg" width="200px" height="150px"></div>
<div id="head1" style="background:black;width:500px;height:150px;float:right"><br><br>
<font size="6px">INFORMATION SCIENCE AND TECHNOLOGY ASSOCIATION</font></div></div><br>
<div id="body"style="width:700px;height:650;color:black">
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
<br><br>
<h3>BUDGET</h3>
<%
String type1=request.getParameter("type1");
ResultSet rs;
if(type1.equals("itrix"))
{
 rs=st.executeQuery("select * from budgetitrix");
}
else if(type1.equals("i++"))
{
	rs=st.executeQuery("select * from budgetiplus");
}
else
{
	rs=st.executeQuery("select * from budgetothers");
}
int total=0,i=1;
if(rs.next())
{%>
<table id="itrix"><h2><tr><th>SNO</th><th>DETAILS</th><th>&nbsp&nbspAMOUNT&nbsp&nbsp</th></tr></h2>
<%
do
{%>
	<tr><td><%=i%>&nbsp&nbsp&nbsp&nbsp</td>
	<td><%=rs.getString(1)%>&nbsp&nbsp&nbsp&nbsp</td>
	<td><%=rs.getInt(2)%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
	</tr>
	<% total=total+rs.getInt(2);i++;
}while(rs.next());%>
</table>
<h4> TOTAL=<%=total%></h4>
<%
}%>
<div id="b4" style="width:400px;float:right"><a href="javascript:history.back()"><button>BACK</button></a>&nbsp&nbsp&nbsp <button onclick="myfunc()">generate pdf</button></div><%
}
catch(Exception e)
{
out.println("error:"+e.getMessage());
}
%>
</html>