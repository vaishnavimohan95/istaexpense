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
		#b5 { display: none; }
    	#container { display: block; }
    }
#itrix {
    font-family: "trebuchet MS", Arial, Helvetica, sans-serif;
    width: 90%;
	color:black;
    border-collapse: collapse;
}

#itrix td, #itrix th {
    font-size: 0.80em;
    border: 1px solid black;
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
<div id="container"style="width:800px;background-color:lightblue;height:1000px;color:white">
<div id="head"style="width:800px;height:100px">
<div id="head1" style="width:200px;height:150px;float:left"><img src="header3.jpg" width="200px" height="150px"></div>
<div id="head1" style="background:black;width:600px;height:150px;float:right"><br><br>
<font size="6px">INFORMATION SCIENCE AND TECHNOLOGY ASSOCIATION</font></div></div><br>
<div id="menu"style="width:800px;background-color:grey;height:40px"></div>
<div id="body"style="width:800px;height:650;color:black">
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
Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
int day = localCalendar.get(Calendar.DATE);
      int month = localCalendar.get(Calendar.MONTH) + 1;
      int year = localCalendar.get(Calendar.YEAR);
		String pdate1,date11;
		int pyear=0;
		if(month<7){
		pyear=year-1;
		pdate1=pyear+"-07-01";
		date11=year+"-06-30";}
		else{pyear=year+1;
		date11=pyear+"-06-30";
		pdate1=year+"-07-01";}
%><br><br><br>
<div id="b5">
<form name="myform" method="post" target="_self">
<input type="text" name="events" placeholder="enter event name">
<input type="hidden" name="pdate" value="<%=pdate1%>">
<input type="hidden" name="date1" value="<%=date11%>">
<input type="submit" value="go"></div><%
String pdate=request.getParameter("pdate");
String date1=request.getParameter("date1");
String events=request.getParameter("events");
ResultSet rs;
int total,i;
	if(!(events.equals(""))&&(!pdate.equals(""))&&(!date1.equals("")))
{%>
	DEPOSIT DETAILS
<%
rs=st.executeQuery("select * from bankdepodetails where events1='"+events+"' and date1 between '"+pdate+"' and '"+date1+"'");
total=0;i=1;
if(rs.next())
{%>
<table id="itrix"><h2><tr><th>SNO</th><th>ID</th><th>DATE</th><th>NAME</th><th>EVENT</th><th>FROM</th><th>PAYMENT MODE</th><th>CHEQUE/DD NO</th><th>AMOUNT</th></tr></h2>
<%
do
{%>
	<tr><td><%=i%>&nbsp&nbsp&nbsp&nbsp</td>
	<td><%=rs.getString(1)%>&nbsp&nbsp&nbsp&nbsp</td>
	<td><%=rs.getString(8)%>&nbsp&nbsp&nbsp&nbsp</td>
	<td><%=rs.getString(2)%>&nbsp&nbsp&nbsp&nbsp</td>
	<td><%=rs.getString(4)%>&nbsp&nbsp&nbsp&nbsp</td>
	<td><%=rs.getString(5)%>&nbsp&nbsp&nbsp&nbsp</td>
	<td><%=rs.getString(6)%>&nbsp&nbsp&nbsp&nbsp</td>
	<td><%=rs.getString(7)%>&nbsp&nbsp&nbsp&nbsp</td>
	<td><%=rs.getInt(3)%></td>
	</tr>
	<% total=total+rs.getInt(3);i++;
}while(rs.next());%>
</table>
<h4> TOTAL=<%=total%></h4>
<%
}
}

else
{
 rs=st.executeQuery("select * from bankdepodetails where date1 between '"+pdate+"' and '"+date1+"'");
total=0;i=1;%>
DEPOSIT DETAILS
<table id="itrix"><h2><tr><th>SNO</th><th>ID</th><th>DATE</th><th>NAME</th><th>EVENT</th><th>FROM</th><th>PAYMENT MODE</th><th>CHEQUE/DD NO</th><th>AMOUNT</th></tr></h2>
<%
while(rs.next())
{%>
	<tr><td><%=i%></td>
	<td><%=rs.getString(1)%>&nbsp </td>
	<td><%=rs.getString(8)%>&nbsp&nbsp&nbsp&nbsp</td>
	<td><%=rs.getString(2)%>&nbsp </td>
	<td><%=rs.getString(4)%>&nbsp </td>
	<td><%=rs.getString(5)%>&nbsp </td>
	<td><%=rs.getString(6)%></td>
	<td><%=rs.getString(7)%></td>
	<td><%=rs.getInt(3)%></td>
	</tr>
	<% total=total+rs.getInt(3);i++;
}%>
</table>
<h4> TOTAL=<%=total%></h4>
<%
}%>
<div id="b4" style="width:400px;float:right"><a href="bankdetails.jsp">BACK</a>&nbsp&nbsp&nbsp <button onclick="myfunc()">generate pdf</button></div><%
}
catch(Exception e)
{
out.println("error:"+e.getMessage());
}
%>
</html>