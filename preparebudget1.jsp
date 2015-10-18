<html>
<head>
<link href="style1.css" rel="stylesheet" type="text/css" />
<style>

a:link {text-decoration:none;color:black;}   
a:visited {text-decoration:none;color:black;} 
a:hover {text-decoration:none;color:black;}   
a:active {text-decoration:none;color:black;}
</style>
<script>
function removefunc()
{
	var eve=document.forms[myform][ex].value;
	var amt=document.forms[myform][amt].value;
	alert(eve);
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
<form name="myform" method="post" target="_self">
<input type="text" name="type" >
<input type="submit" value="create"><br><br>
<a href="budget.jsp">BACK</a>
<%
String type1=request.getParameter("type");
int a=0;
if(type1.equals("itrix"))
{
	st.executeUpdate("drop table budgetitrix");
	st.executeUpdate("create table budgetitrix(details varchar(30),amount int)");
ResultSet rs=st.executeQuery("select * from budgetinitialdetails ");
if(rs.next())
{
PreparedStatement ps=con.prepareStatement("insert into budgetitrix(details,amount) select details,amount from budgetinitialdetails ");
 a=ps.executeUpdate();
}
}
else if(type1.equals("i++"))
{
	st.executeUpdate("drop table budgetiplus");
	st.executeUpdate("create table budgetiplus(details varchar(30),amount int)");
ResultSet rs=st.executeQuery("select * from budgetinitialdetails ");
if(rs.next())
{
PreparedStatement ps=con.prepareStatement("insert into budgetiplus(details,amount) select details,amount from budgetinitialdetails ");
 a=ps.executeUpdate();
}
}
else if(type1.equals("meeting"))
{
	st.executeUpdate("drop table budgetmeet");
	st.executeUpdate("create table budgetmeet(details varchar(30),amount int)");
ResultSet rs=st.executeQuery("select * from budgetinitialdetails ");
if(rs.next())
{
	PreparedStatement ps=con.prepareStatement("insert into budgetmeet(details,amount) select details,amount from budgetinitialdetails ");
 a=ps.executeUpdate();
}	
}
else if(type1.equals("conference"))
{
	st.executeUpdate("drop table budgetcon");
	st.executeUpdate("create table budgetcon(details varchar(30),amount int)");
ResultSet rs=st.executeQuery("select * from budgetinitialdetails ");
if(rs.next())
{
	PreparedStatement ps=con.prepareStatement("insert into budgetcon(details,amount) select details,amount from budgetinitialdetails ");
 a=ps.executeUpdate();
}	
}
else if(type1.equals("fresher's day"))
{
	st.executeUpdate("drop table budgetfresh");
	st.executeUpdate("create table budgetfresh(details varchar(30),amount int)");
ResultSet rs=st.executeQuery("select * from budgetinitialdetails ");
if(rs.next())
{
	PreparedStatement ps=con.prepareStatement("insert into budgetfresh(details,amount) select details,amount from budgetinitialdetails ");
 a=ps.executeUpdate();
}	
}
else
{
	st.executeUpdate("drop table budgetothers");
	st.executeUpdate("create table budgetothers(details varchar(30),amount int)");
ResultSet rs=st.executeQuery("select * from budgetinitialdetails ");
if(rs.next())
{
	PreparedStatement ps=con.prepareStatement("insert into budgetothers(details,amount) select details,amount from budgetinitialdetails ");
 a=ps.executeUpdate();
}	
}
if(a!=0)
{%>
<jsp:forward page="preparebudget.jsp">
<jsp:param name="type1" value="<%=type1%>"/>
</jsp:forward>
<%
}

}
catch(Exception e)
{
	e.printStackTrace();
}
	%>
	</html>

