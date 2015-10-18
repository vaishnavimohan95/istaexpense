<html>
<head>
<link href="style1.css" rel="stylesheet" type="text/css" />
<style>
@media print{
	#b2{display:none;}
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
      <div id="b2" class="menu_nav">
        <div class="nav-wrapper">
		<nav class="nav-menu">
          <ul class="clearfix">
          <li><a href="memberhome.jsp">Home</a></li>
         <li><a href="expensedetails1.jsp">Expense Details</a> <ul class="sub-menu"> 
            <li><a href="itrixexpenses1.jsp">Itrix</a></li> 
            <li><a href="i++expense1.jsp">I++</a></li> 
			 <li><a href="otherexpense1.jsp">Others</a></li> 
			  <li><a href="fullexpenses1.jsp">Full</a></li> </li>
         </ul> <li><a href="bankdetails1.jsp">Bank Details</a></li>
		  <li><a href="memberlogin.jsp">Logout</a></li>
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
<%
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/ista","root","root");
Statement st=con.createStatement();
%>
<div id="b2">
<form name="myform" method="post" action="piechart6.jsp">
from date:<input type="text" name="pdate">
to date:<input type="text" name="date1">
event:<input type="text" name="events">
<input type="submit" value="create chart">
</form></div><br>
<img src="piechart5.png" width="500" height="350" border="0" usemap="#chart" onClick="window.location.reload()" >
<br><br>
<%
	}
	catch(Exception e){out.println("error:"+e.getMessage());}%>
</div>
</div>
</body>
</html>
