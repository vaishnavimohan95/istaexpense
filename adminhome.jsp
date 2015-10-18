<html>
<head>
<title>ISTA EXPENSE TRACKER</title>
<link href="style1.css" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
<div class="main">

  <div class="header">
    <div class="header_resize">
      <div class="logo"><h1>ISTA EXPENSE TRACKER</h1></div>
      <div class="menu_nav">
        <ul>
          <li><a href="adminlogin.jsp">LOGOUT</a></li>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
<%@ page import="java.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="javax.sql.*" %>
<%try
    {%>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/ista","root","root");
Statement st=con.createStatement();
%>
<div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
		<h2>
<a href="expensehome.jsp">
EXPENSE DETAILS</a></h2><br><br><h2><a href="bankdetails.jsp">
BANK DETAILS</a></h2>
<br><br><h2>
<a href="budget.jsp">BUDGET PREPARATION</a></h2>
<%}
catch(Exception e)
{
out.println("error:"+e.getMessage());
}%>
</div>
</div></div>
</div>
</div>
</div>
</div>
</body>
</html>

