<html>
<title>ISTA EXPENSE TRACKER</title>
<head>
<link href="style1.css" rel="stylesheet" type="text/css" />
<script>
function validateForm()
{
var x=document.forms["myform"]["id"].value;
if(x==null || x =="")
{
alert("Enter a valid id");
return false;
}
}
</script>
<style>
input[type="text"]{
border:2px solid black;
border-radius:10px;
height:22px;
width:180px;
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
<%try
    {%>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/ista","root","root");
Statement st=con.createStatement();%>
<form name="myform" method="post" onsubmit="return validateForm()" action="expenseremove1.jsp">
<input type="text" name="id">
<input type="submit" value="delete">
</form><br>
<a href="javascript:history.back()">Go Back</a>
<%
}
catch(Exception e)
{
out.println("error:"+e.getMessage());
}%>
</div>
</div>
</body>
</html>