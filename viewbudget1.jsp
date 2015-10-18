<html>
<head>
<link href="style2.css" rel="stylesheet" type="text/css" />
<style>
button
{
	width: 15em;  height: 2em;
}
input[type=submit] {
    width: 15em;  height: 2em;
}
#itrix {
    font-family: "trebuchet MS", Arial, Helvetica, sans-serif;
    width: 80%;
	color:black;
    border-collapse: collapse;
}

#itrix td, #itrix th {
    font-size: 0.85em;
    border: 1px solid black;
    padding: 3px 7px 2px 7px;
}

#itrix th {
    font-size: 1em;
    text-align: left;
    padding-top: 5px;
    padding-bottom: 4px;
    background-color:lightblue;
    color:black;
}
a:link {text-decoration:none;color:black;}   
a:visited {text-decoration:none;color:black;} 
a:hover {text-decoration:none;color:black;}   
a:active {text-decoration:none;color:black;}
</style>
</head>
<body>
<center>
<div class="main">

  <div class="header">
    <div class="header_resize">
      <div class="logo"><h1>ISTA EXPENSE TRACKER</h1></div>
      <div class="menu_nav">
        <div class="nav-wrapper">
		<nav class="nav-menu">
      <ul class="clearfix">
          <li><a href="adminhome.jsp">Home</a></li>
         <li><a href="expensehome.jsp">Expense Details</a> <ul class="sub-menu"> 
            <li><a href="itrixexpenses.jsp">Itrix</a></li> 
            <li><a href="i++expense.jsp">I++</a></li> 
			 <li><a href="otherexpense.jsp">Others</a></li> 
			  <li><a href="fullexpenses.jsp">Full</a></li> </li>
         </ul> <li><a href="bankdetails.jsp">Bank Details</a></li>
		  <li><a href="budget.jsp">Budget</a><ul class="sub-menu"> 
            <li><a href="preparebudget1.jsp">Create budget</a></li> 
            <li><a href="viewbudget.jsp">View budget</a></li>
         </ul>  </li>
		  <li><a href="adminlogin.jsp">Logout</a></li>
         </li>
      </ul>
   </nav>
</div>
      </div>
      <div class="clr"></div>
    </div>
  </div><br><br>
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
String type1=request.getParameter("events");
ResultSet rs;
%>
<br>
<div id="b2" style="width:900px;float:right">
<center>
<div id="b3" style="background-color:lightgrey;width:600px;float:left;color:black"><br><br><center>
<div id="b6" style="width:580px;float:center;color:black">
<center>
<%
if(type1.equals("itrix"))
{
	rs=st.executeQuery("select * from budgetitrix");
}
else if(type1.equals("i++"))
{
	rs=st.executeQuery("select * from budgetiplus");
}
else if(type1.equals("meeting"))
{
	rs=st.executeQuery("select * from budgetmeet");
}
else if(type1.equals("conference"))
{
	rs=st.executeQuery("select * from budgetcon");
}
else if(type1.equals("fresher's day"))
{
	rs=st.executeQuery("select * from budgetfresh");
}
else
{
	rs=st.executeQuery("select * from budgetothers");
}
int total=0;
if(rs.next())
{%>
<table border="1" id="itrix"><tr><th>DETAILS</th><th></th><th>AMOUNT</th></tr>
<%
do
{%>
	<tr>
	<td><%=rs.getString(1)%></td><td></td>
	<td><%=rs.getInt(2)%></td>
	</tr>
	</tr>
	<% total=total+rs.getInt(2);
}while(rs.next());%>
</table>
<h3> TOTAL=<%=total%> </h3><br>
</div></center></div></div>
<div id="b1" style="width:300px;float:left">
<h4><form name="myform" method="post" action="savebudget.jsp"><input type="hidden" name="type1" value="<%=type1%>">
<input type="submit" value="save"></form></h4>
<h4><form name="myform" method="post" action="preparebudget.jsp"><input type="hidden" name="type1" value="<%=type1%>">
<input type="submit" value="edit budget"></form></h4>
<h4><form name="myform" method="post" action="piechart12.jsp"><input type="hidden" name="type1" value="<%=type1%>">
<input type="submit" value="chart"></form></h4>
<h4><a href="javascript:history.back()"><button>back</button></a></h4></div><%
}
else
{
	out.println("budget not yet prepared");
}
}
catch(Exception e)
{
e.printStackTrace();
}
%>
</html>