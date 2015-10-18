<html>
<head>
<link href="style2.css" rel="stylesheet" type="text/css" />
<style>
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
    background-color:lightgrey;
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
%>
<br>
<form name="myform" method="post" action="#">
<input type="text" name="type1">
<input type="submit" value="view"></form><br><a href="javascript:history.back()">BACK</a>
<%
String type1=request.getParameter("type1");
if(type1.equals("itrix"))
{%>
<jsp:forward page="budgetvarianceitrix.jsp">
<jsp:param name="events" value="itrix"/></jsp:forward>
<%
}
else if(type1.equals("i++"))
{%>
<jsp:forward page="budgetvariancei++.jsp">
<jsp:param name="events" value="i++"/></jsp:forward>
<%
}
else
{%>
<jsp:forward page="budgetvarianceothers.jsp"></jsp:forward>
<%
}
}
catch(Exception e)
{
e.printStackTrace();
}
%>
</html>