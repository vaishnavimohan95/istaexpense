<html>
<title>ISTA EXPENSE TRACKER</title>
<head>
<link href="style1.css" rel="stylesheet" type="text/css" />
<script>
function validateForm()
{
var y=document.forms["myform"]["pyear"].value;
if(y==null || y =="" || yisNAN(y))
{
alert("Enter a valid year");
return false;
}
var x=document.forms["myform"]["year"].value;
if(x==null || x =="" || xisNAN(x))
{
alert("Enter a valid year");
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
      </div>
      <div class="clr"></div>
    </div>
  </div><br>
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
Statement st=con.createStatement();%>
<br><%
String type1=request.getParameter("type");%><br><br>
<font style="color:black">
<form name="myform" method="post" action="prevexpense3.jsp" onsubmit="return validateForm()">
enter th year
from: <input type="text" name="pyear" placeholder="2015" required>
to: <input type="text" name="year"placeholder="2016" required>
<input type="hidden" name="type" value="<%=type1%>">
<input type="submit" value="go">
</form><br>
<a href="javascript:history.back()">Go Back</a></font>
<%
}
catch(Exception e)
{
out.println("error:"+e.getMessage());
}%>
<div></div>
</div>
</body>
</html>
