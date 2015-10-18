<html>
<head>
<title>ISTA EXPENSE TRACKER</title>
<link href="style1.css" rel="stylesheet" type="text/css" />
<style>
button{
border:2px solid black;
border-radius:10px;
height:100px;
width:250px;
}

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
  </div><br><br><br>
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
<a href="itrixexpenses.jsp">
<button><div id="b1" style="width:150px;height:75"><br><br><b>ITRIX</b></div></button></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="i++expense.jsp"><button>
<div id="b1" style="width:150px;height:75"><br><br><b>I++</b></div></button></a>
<br><br>
<a href="otherexpense.jsp"><button>
<div id="b1" style="width:150px;height:75"><br><br><b>OTHER EXPENSES</b></div></button></a>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="fullexpenses.jsp"><button>
<div id="b1" style="width:150px;height:75"><br><br><b>OVERALL EXPENSES</b></div></button></a>
<%}
catch(Exception e)
{
out.println("error:"+e.getMessage());
}%>
</div>
</div>
</div>
</body>
</html>

