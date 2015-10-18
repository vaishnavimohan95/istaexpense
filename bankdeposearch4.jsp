<html>
<head>
<link href="style2.css" rel="stylesheet" type="text/css" />
<style>
button
{
	width: 15em;  height: 2em;
}
a:link {text-decoration:none;color:black;}   
a:visited {text-decoration:none;color:black;} 
a:hover {text-decoration:none;color:black;}   
a:active {text-decoration:none;color:black;}
#itrix {
    font-family: "trebuchet MS", Arial, Helvetica, sans-serif;
    width: 100%;
	color:black;
    border-collapse: collapse;
}
#itrix td, #itrix th {
    font-size: 0.80em;
    border: 1px solid black;
    padding: 5px 7px 3px 7px;
}
#itrix th {
    font-size: 1em;
    text-align: left;
    padding-top: 5px;
    padding-bottom: 4px;
    background-color:lightblue;
    color:black;
}
@media print
{
	#b4{display:none;}
}
</style>
</head>
<body>
<center>
<div class="main">

  <div class="header">
    <div class="header_resize">
      <div class="logo"><h1>ISTA EXPENSE TRACKER</h1></div>
      <div id="b4" class="menu_nav">
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
<div id="b3" style="background-color:lightgrey;width:1050px;float:right;color:black"><br><br><center>
<div id="b6" style="width:890px;float:center;color:black">
<%String n1=request.getParameter("id");
String n2=request.getParameter("name");
String n3=request.getParameter("amt");
String n4=request.getParameter("events");
String n5=request.getParameter("reason");
String n6=request.getParameter("mode");
String n7=request.getParameter("cdno");
String n8=request.getParameter("date");
String n9=request.getParameter("from");
String n10=request.getParameter("to");
if(!n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where id1='"+n1+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where events1='"+n4+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where from1='"+n5+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where mode1='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and events1='"+n4+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and from1='"+n5+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and mode1='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and events1='"+n4+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and from1='"+n5+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and mode1='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and date1 between '"+n9+"' and '"+n10+"' ");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where events1='"+n4+"' and from1='"+n5+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where events1='"+n4+"' and mode1='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where events1='"+n4+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where events1='"+n4+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where events1='"+n4+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where from1='"+n5+"' and mode1='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where from1='"+n5+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where from1='"+n5+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where from1='"+n5+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where mode1='"+n6+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where chequedd_no1='"+n7+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and from1='"+n5+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and mode1='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and events1='"+n4+"' and from1='"+n5+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and events1='"+n4+"' and mode1='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and events1='"+n4+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and events1='"+n4+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and events1='"+n4+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and from1='"+n5+"' and mode1='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and from1='"+n5+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and from1='"+n5+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and from1='"+n5+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and mode1='"+n6+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and chequedd_no1='"+n7+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and events1='"+n4+"' and mode1='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and events1='"+n4+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and events1='"+n4+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and events1='"+n4+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and from1='"+n5+"' and mode1='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and from1='"+n5+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and from1='"+n5+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and from1='"+n5+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and mode1='"+n6+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and chequedd_no1='"+n7+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and  chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  events1='"+n4+"' and from1='"+n5+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  events1='"+n4+"' and from1='"+n5+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  events1='"+n4+"' and from1='"+n5+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  events1='"+n4+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  events1='"+n4+"' and mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  events1='"+n4+"' and mode1='"+n6+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  events1='"+n4+"' and chequedd_no1='"+n7+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  events1='"+n4+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  from1='"+n5+"' and mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  from1='"+n5+"' and mode1='"+n6+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  from1='"+n5+"' and chequedd_no1='"+n7+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  from1='"+n5+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  amount1='"+n3+"' and events1='"+n4+"' and mode1='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  amount1='"+n3+"' and events1='"+n4+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  amount1='"+n3+"' and events1='"+n4+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  amount1='"+n3+"' and events1='"+n4+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  amount1='"+n3+"' and from1='"+n5+"' and mode1='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  amount1='"+n3+"' and from1='"+n5+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  amount1='"+n3+"' and from1='"+n5+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  amount1='"+n3+"' and from1='"+n5+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  amount1='"+n3+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  amount1='"+n3+"' and mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  amount1='"+n3+"' and mode1='"+n6+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  amount1='"+n3+"' and date1='"+n8+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  amount1='"+n3+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  events1='"+n4+"' and from1='"+n5+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  events1='"+n4+"' and from1='"+n5+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  events1='"+n4+"' and from1='"+n5+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  events1='"+n4+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  events1='"+n4+"' and mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  events1='"+n4+"' and mode1='"+n6+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  events1='"+n4+"' and chequedd_no1='"+n7+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  events1='"+n4+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  from1='"+n5+"' and mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  from1='"+n5+"' and mode1='"+n6+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  from1='"+n5+"' and date1='"+n8+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and  from1='"+n5+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and   mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and   mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   events1='"+n4+"' and from1='"+n5+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   events1='"+n4+"' and from1='"+n5+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   events1='"+n4+"' and from1='"+n5+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   events1='"+n4+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   events1='"+n4+"' and mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   events1='"+n4+"' and mode1='"+n6+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   events1='"+n4+"' and date1='"+n8+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   events1='"+n4+"' and  chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   from1='"+n5+"' and mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   from1='"+n5+"' and mode1='"+n6+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   from1='"+n5+"' and date1='"+n8+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   from1='"+n5+"' and  chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   mode1='"+n6+"' and date1='"+n8+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and   mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where events1='"+n4+"' and   from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where events1='"+n4+"' and   from1='"+n5+"' and mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where events1='"+n4+"' and   from1='"+n5+"' and mode1='"+n6+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where events1='"+n4+"' and   from1='"+n5+"' and chequedd_no1='"+n7+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where events1='"+n4+"' and   from1='"+n5+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where events1='"+n4+"' and   mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where events1='"+n4+"' and   mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where from1='"+n5+"' and   mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where from1='"+n5+"' and   mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and mode1='"+n6+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and date1='"+n8+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and from1='"+n5+"' and mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and from1='"+n5+"' and mode1='"+n6+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and from1='"+n5+"' and date1='"+n8+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and from1='"+n5+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and date1='"+n8+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and date1='"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and events1='"+n4+"' and from1='"+n5+"' and date1='"+n8+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and events1='"+n4+"' and from1='"+n5+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and events1='"+n4+"' and date1='"+n8+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and events1='"+n4+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and date1='"+n8+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"' and date1='"+n8+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"'and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and events1='"+n4+"' and date1='"+n8+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and events1='"+n4+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and date1='"+n8+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where amount1='"+n3+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where date1='"+n8+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"' and date1='"+n8+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and date1='"+n8+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and events1='"+n4+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and date1='"+n8+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and amount1='"+n3+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and date1='"+n8+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where name1='"+n2+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1 between '"+n9+"' and '"+n10+"'");
}
else if(n1.equals("") && n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  amount1='"+n3+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"' and date1='"+n8+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && !n8.equals("") && n9.equals("") && n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  amount1='"+n3+"' and name='"+n2+"' and date1='"+n8+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'");
}
else if(n1.equals("") && !n2.equals("") && !n3.equals("") && !n4.equals("") && !n5.equals("") && !n6.equals("") && !n7.equals("") && n8.equals("") && !n9.equals("") && !n10.equals(""))
{
rs=st.executeQuery("select * from bankdepodetails where  amount1='"+n3+"' and name='"+n2+"' and events1='"+n4+"' and from1='"+n5+"' and mode1='"+n6+"' and chequedd_no1='"+n7+"'and date1 between '"+n9+"' and '"+n10+"'");
}
else
{%>
<jsp:forward page="bankdeposearch2.jsp"/><%
}%>
<table border="5" id="itrix">
<tr>
<th>ID</th>
<th>DATE</th>
<th>NAME</th>
<th>EVENTS</th>
<th>FROM</th>
<th>MODE</th>
<th>CHEQUE/DD NO</th>
<th>AMOUNT</th>
</tr><%
while(rs.next())
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
}%>
</table>
</div></center><br><br></div>
<div id="b4" style="width:300px;float:left">
<ul>
<h4><a href="#" onClick="print()"><button>save as pdf</button></a></h4>
<h4><a href="bankdeposearch2.jsp"><button>back</button></a></h4></ul>
</ul></div><%
}
catch(Exception e)
{
out.println("error:"+e.getMessage());
}%> 
</div>
</div>
</div>
</body>
</html>