<html>
<title>ISTA EXPENSE TRACKER</title>
<head>
<link href="style2.css" rel="stylesheet" type="text/css" />
<style>

input[type=submit] {
    width: 15em;  height: 2em;
}
button
{
	width: 15em;  height: 2em;
}
 @media print
    {
    	#b4 { display: none; }
    	#b5 { display: none; }
    	#b1 { display: none; }
    	#container { display: block; }
    }

input[type="text"]{
border:2px solid black;
border-radius:10px;
height:22px;
width:180px;
}
#itrix {
    font-family: "trebuchet MS", Arial, Helvetica, sans-serif;
    width: 100%;
	color:black;
    border-collapse: collapse;
}

#itrix td, #itrix th {
    font-size: 0.85em;
    border: 1px solid blue;
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
      <div id="b1"class="menu_nav">
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
ResultSet rs=null;%><br><br>
<div id="b2" style="width:950px;float:right">
<center>
<div id="b3" style="background-color:lightgrey;width:850px;float:left;color:black"><br><center>
<div id="b6" style="width:830px;float:center;color:black">
<%String n2=request.getParameter("name");
String n3=request.getParameter("amt");
String n4=request.getParameter("type");
String n5=request.getParameter("reason");
String n8=request.getParameter("date");
String n1=request.getParameter("id");
String n6=request.getParameter("mode");
String n7=request.getParameter("cdno");
String n9=request.getParameter("from");
String n10=request.getParameter("to");
if(!n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where id='"+n1+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where events='"+n4+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where reason='"+n5+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where mode='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and events='"+n4+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and reason='"+n5+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and mode='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and events='"+n4+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and reason='"+n5+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and mode='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and date between '"+n9+"' and '"+n10+"' ");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where events='"+n4+"' and reason='"+n5+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where events='"+n4+"' and mode='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where events='"+n4+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where events='"+n4+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where events='"+n4+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where reason='"+n5+"' and mode='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where reason='"+n5+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where reason='"+n5+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where reason='"+n5+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where mode='"+n6+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where chequedd_no='"+n7+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and reason='"+n5+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and mode='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and events='"+n4+"' and reason='"+n5+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and events='"+n4+"' and mode='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and events='"+n4+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and events='"+n4+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and events='"+n4+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and reason='"+n5+"' and mode='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and reason='"+n5+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and reason='"+n5+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and reason='"+n5+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and mode='"+n6+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and chequedd_no='"+n7+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and events='"+n4+"' and mode='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and events='"+n4+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and events='"+n4+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and events='"+n4+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and reason='"+n5+"' and mode='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and reason='"+n5+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and reason='"+n5+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and reason='"+n5+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and mode='"+n6+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and chequedd_no='"+n7+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and  chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  events='"+n4+"' and reason='"+n5+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  events='"+n4+"' and reason='"+n5+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  events='"+n4+"' and reason='"+n5+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  events='"+n4+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  events='"+n4+"' and mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  events='"+n4+"' and mode='"+n6+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  events='"+n4+"' and chequedd_no='"+n7+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  events='"+n4+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  reason='"+n5+"' and mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  reason='"+n5+"' and mode='"+n6+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  reason='"+n5+"' and chequedd_no='"+n7+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  reason='"+n5+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  mode='"+n6+"' and chequedd_no='"+n7+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  mode='"+n6+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  amount='"+n3+"' and events='"+n4+"' and mode='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  amount='"+n3+"' and events='"+n4+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  amount='"+n3+"' and events='"+n4+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  amount='"+n3+"' and events='"+n4+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  amount='"+n3+"' and reason='"+n5+"' and mode='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  amount='"+n3+"' and reason='"+n5+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  amount='"+n3+"' and reason='"+n5+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  amount='"+n3+"' and reason='"+n5+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  amount='"+n3+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  amount='"+n3+"' and mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  amount='"+n3+"' and mode='"+n6+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  amount='"+n3+"' and date='"+n8+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  amount='"+n3+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  events='"+n4+"' and reason='"+n5+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  events='"+n4+"' and reason='"+n5+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  events='"+n4+"' and reason='"+n5+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  events='"+n4+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  events='"+n4+"' and mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  events='"+n4+"' and mode='"+n6+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  events='"+n4+"' and chequedd_no='"+n7+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  events='"+n4+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  reason='"+n5+"' and mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  reason='"+n5+"' and mode='"+n6+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  reason='"+n5+"' and date='"+n8+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and  reason='"+n5+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and   mode='"+n6+"' and chequedd_no='"+n7+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and   mode='"+n6+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   events='"+n4+"' and reason='"+n5+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   events='"+n4+"' and reason='"+n5+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   events='"+n4+"' and reason='"+n5+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   events='"+n4+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   events='"+n4+"' and mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   events='"+n4+"' and mode='"+n6+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   events='"+n4+"' and date='"+n8+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   events='"+n4+"' and  chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   reason='"+n5+"' and mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   reason='"+n5+"' and mode='"+n6+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   reason='"+n5+"' and date='"+n8+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   reason='"+n5+"' and  chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   mode='"+n6+"' and date='"+n8+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and   mode='"+n6+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where events='"+n4+"' and   reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where events='"+n4+"' and   reason='"+n5+"' and mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where events='"+n4+"' and   reason='"+n5+"' and mode='"+n6+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where events='"+n4+"' and   reason='"+n5+"' and chequedd_no='"+n7+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where events='"+n4+"' and   reason='"+n5+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where events='"+n4+"' and   mode='"+n6+"' and chequedd_no='"+n7+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where events='"+n4+"' and   mode='"+n6+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where reason='"+n5+"' and   mode='"+n6+"' and chequedd_no='"+n7+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where reason='"+n5+"' and   mode='"+n6+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and mode='"+n6+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and date='"+n8+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and reason='"+n5+"' and mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and reason='"+n5+"' and mode='"+n6+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and reason='"+n5+"' and date='"+n8+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and reason='"+n5+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and date='"+n8+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and mode='"+n6+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and date='"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and events='"+n4+"' and reason='"+n5+"' and date='"+n8+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and events='"+n4+"' and reason='"+n5+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and events='"+n4+"' and date='"+n8+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and events='"+n4+"' and mode='"+n6+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and date='"+n8+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"' and date='"+n8+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"'and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and events='"+n4+"' and date='"+n8+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and events='"+n4+"' and mode='"+n6+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and date='"+n8+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where amount='"+n3+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where date='"+n8+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"' and date='"+n8+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and date='"+n8+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and events='"+n4+"' and mode='"+n6+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and date='"+n8+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and amount='"+n3+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and date='"+n8+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where name='"+n2+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"' and date between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  amount='"+n3+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"' and date='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  amount='"+n3+"' and name='"+n2+"' and date='"+n8+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from expensedetails where  amount='"+n3+"' and name='"+n2+"' and events='"+n4+"' and reason='"+n5+"' and mode='"+n6+"' and chequedd_no='"+n7+"'and date between '"+n9+"' and '"+n10+"'");
}
else
{%>
	<jsp:forward page="expensesearch.jsp"/><%
}
if(rs.next()){%>
<table border="5" id="itrix">
<h3>
<tr>
<th>ID</th>
<th>DATE</th>
<th>NAME</th>
<th>EVENT</th>
<th>REASON</th>
<th>PAYMENT MODE</th>
<th>CHEQUE/DD NO</th>
<th>AMOUNT</th>
</tr></h3><%
do
{%>
<tr>
		<td><t><%=rs.getString(1)%></t></td>
		<td><t><%=rs.getString(8)%></t></td>
		<td><t><%=rs.getString(2)%></t></td>	
		<td><t><%=rs.getString(4)%></t></td>
		<td><t><%=rs.getString(5)%></t></td>
		<td><t><%=rs.getString(6)%></t></td>
		<td><t><%=rs.getString(7)%></t></td>
		<td><t><%=rs.getInt(3)%></t></td>
</tr>
<%
}while(rs.next());%>
</table><%
}
else
{%>
	<jsp:forward page="expensesearch.jsp"/><%
}%><br><br></div></center></div></div>
<div id="b5" style="width:300px;height:900px;float:left">
<ul>
<h4><a href="expenseremove.jsp"><button>remove details</button></a></h4>
<h4><a href="expenseedit.jsp"><button>edit details</button></a></h4>
<h4><a href="#" onclick="print()"><button>save as pdf</button></a></h4>
<h4><a href="javascript:history.back()"><button>Go Back</button></a></h4>
</ul>
</div><%
}
catch(Exception e)
{
out.println("error:"+e.getMessage());
}%> 
</div>
</div>
</body>
</html>