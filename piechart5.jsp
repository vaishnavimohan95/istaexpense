<html>
<head>
<link href="style1.css" rel="stylesheet" type="text/css" />
<style>
@media print
    {
    	#b1 { display: none; }
		#b2 { display: none; }
		#b4 { display: none; }
		#b7 { display: none; }
    	#container { display: block; }
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
      <div  id="b1" class="menu_nav">
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
<div id="b4" style="float:right"><ul>
<li><a href="#" onClick="print()">Save As PDF</a></li>
<li><a href="javascript:history.back(1)">Back</a></li></ul>
</div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
<%@ page import="java.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="java.util.Calendar"%>
 <%@ page import="java.util.Date"%>
<%@ page import="java.util.TimeZone"%>
<%@ page  import="java.awt.*" %>
 <%@ page  import="java.io.*" %>
 <%@ page  import="org.jfree.chart.*" %>
 <%@ page  import="org.jfree.chart.entity.*" %>
 <%@ page  import ="org.jfree.data.general.*"%>
<%try
    {%>
	<div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
<%
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/ista","root","root");
Statement st=con.createStatement();
%>
<center>
<div id="b2">
<form name="myform" method="post" action="piechart4.jsp">
from date:<input type="text" name="pdate" required>
to date:<input type="text" name="date1" required>
<input type="submit" value="create chart">
</form></div><br>
<h3>DEPOSIT</h3>
<img src="piechart4.png" width="500" height="350" onclick="window.location.reload()" >
<br><br>
<%
	}
	catch(Exception e){out.println("error:"+e.getMessage());}%>
</div>
</div>
</body>
</html>
