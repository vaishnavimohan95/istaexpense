<html>
<head>
<link href="style2.css" rel="stylesheet" type="text/css" />
<style>
#itrix {
    font-family: "trebuchet MS", Arial, Helvetica, sans-serif;
    width: 100%;
	color:black;
    border-collapse: collapse;
}
#itrix td, #itrix th {
    font-size: 0.85em;
    border: 1px solid black;
    padding: 3px 7px 2px 7px;
	c
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
<script>
function myfunc(element)
{
	document.getElementById("demo").innerHTML=element.value;
}
</script>
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
<%
String type1=request.getParameter("type1");
ResultSet rs;%>
<div id="b2" style="width:350px;height:500px;float:left">

<div id="b5" style="width:200px;height:500px;float:center>">
<ul>
<h4><form method="post" action="removebudget.jsp">
<input type="hidden" name="type1" value="<%=type1%>">
enter the details name:<input type="text" name="events"><br>
<input type="submit" value="remove"></form></h4>
<h4><form method="post" action="addbudget.jsp">
<input type="hidden" name="type1" value="<%=type1%>">
enter the details name:<input type="text" name="details"><br>
enter the amount:<input type="text" name="amount"><br>
<input type="submit" value="add/update"></form></h4>
</ul>
</div></div>
<div id="b4" style="width:850px;float:right">
<div id="b3" style="background-color:lightgrey;width:550px;float:left;color:black"><br><br><center>
<div id="b6" style="width:530px;float:center;color:black">
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
%>
<table border="2" id="itrix"><tr>
<th>DETAILS</th><th></th><th>AMOUNT</th></tr><%
while(rs.next())
{%>
	<tr><td><%=rs.getString(1)%>&nbsp&nbsp&nbsp&nbsp</td><td></td>
	<td><%=rs.getInt(2)%>&nbsp&nbsp&nbsp&nbsp</td></tr>
	<%
	total=total+rs.getInt(2);
}
%>
</table>
<h3>TOTAL=<%=total%></h3><br>
</div>
<a href="budget.jsp"><button>finished</button></a>
<a href="budget.jsp"><button>BACK</button></a>
</center></div></div>
<%
}
catch(Exception e)
{
e.printStackTrace();
}
%>
</div>
</div>
</body>
</html>