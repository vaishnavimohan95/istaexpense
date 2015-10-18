<html>
<title>ISTA EXPENSE TRACKER</title>
<head>
<link href="style2.css" rel="stylesheet" type="text/css" />
<style>

input[type="text"]{
border:2px solid black;
border-radius:10px;
height:22px;
width:180px;
}
input[type=submit] {
    width: 12em;  height: 2em;
}
button
{
	width: 12em;  height: 2em;
}
@media print
    {
    	#b1 { display: none; }
		#b2 { display: none; }
    	#container { display: block; }
    }
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
  </div>
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
String events="i++";%>
<h3>EXPENSE DETAILS</h3>
<div style="width:1050px;float:right">
<% 
Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
        int day = localCalendar.get(Calendar.DATE);
      int month = localCalendar.get(Calendar.MONTH) + 1;
      int year = localCalendar.get(Calendar.YEAR);
		String pdate,date1;
		int pyear=0;
		if(month<7){
		pyear=year-1;
		pdate=pyear+"-07-01";
		date1=year+"-06-30";}
		else{pyear=year+1;
		date1=pyear+"-06-30";
		pdate=year+"-07-01";}%><center>
		<div id="b3" style="background-color:lightgrey;width:1020px;color:black"><br><br><center>
		<div id="b6" style="width:1000px;float:center;color:black">
		<%
		ResultSet rs;
		if(pyear<year){
		rs=st.executeQuery("select * from expensedetails where events='"+events+"' and date between '"+pdate+"' and '"+date1+"'");}
		else{
		 rs=st.executeQuery("select * from expensedetails where events='"+events+"' and date between '"+pdate+"' and '"+date1+"'");
		}%>
<table border="3" id="itrix">
<tr>
<th><b>ID</b></th>
<th><b>DATE</b></th>
<th><b>NAME</b></th>
<th><B>TYPE</B></th>
<th><B>REASON</B></th>
<th><B>PAYMENT MODE</B></th>
<th><B>CHEQUE/DD NO</B></th>
<th><B>AMOUNT</B></th>
</tr><%
int total=0;
while(rs.next())
{%>
<tr>

<td><t><%=rs.getString(1)%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</t></td>
<td><t><%=rs.getString(8)%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</t></td>
<td><t><%=rs.getString(2)%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</t></td>
<td><t><%=rs.getString(4)%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</t></td>
<td><t><%=rs.getString(5)%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</t></td>
<td><t><%=rs.getString(6)%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</t></td>
<td><t><%=rs.getString(7)%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</t></td>
<td><t><%=rs.getString(3)%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</t></td>
</tr>
<%
total=total+rs.getInt(3);%>
<%}
%></table><h4>TOTAL AMOUNT SPENT=<%=total%></h4><br>
</div></center></div></div>
<div id="b2" style="width:300px;height:900px;float:left">
<table>
<form name="myform" method="post" action="budgetvariancei++.jsp"><input type="hidden" name="events"" value="<%=events%>">
<tr><input type="submit" value="budgetvariance"></tr></form><br><br>
<form name="myform" method="post" action="expenseremove.jsp"><tr><input type="submit"  value="remove details"></tr></form><br><br>
<form name="myform" method="post" action="expensesearch.jsp"><input type="hidden" name="pdate" value="<%=pdate%>"><input type="hidden" name="date1" value="<%=date1%>">
<tr><input type="submit" value="search"></tr></form><br><br>
<form name="myform" method="post" action="piechart.jsp"><input type="hidden" name="pdate" value="<%=pdate%>"><input type="hidden" name="date1" value="<%=date1%>"><input type="hidden" name="events" value="<%=events%>">
<tr><input type="submit" value="create chart"></tr></form><br><br>
<form name="myform" method="post" action="expenseedit.jsp"><tr><input type="submit" value="edit details"></tr></form><br><br>
<form name="myform" method="post" action="prevexpense.jsp"><input type="hidden" name="type" value="<%=events%>">
<tr><input type="submit" value="previous year expenses"></tr></form><br><br>
<tr><a href="expenseentry.jsp"><button>add details</button></tr></a><br> <br> 
<tr><form name="myform" method="post" action="viewbudget1.jsp"><input type="hidden" name="events" value="<%=events%>">
<input type="submit" value="view budget"></form></tr><br><br>           
<form name="myform" method="post" action="saveexpense.jsp"><input type="hidden" name="pdate" value="<%=pdate%>"><input type="hidden" name="date1" value="<%=date1%>"><input type="hidden" name="events" value="<%=events%>">
<tr><input type="submit" value="save as pdf"></tr></form><br><br>
<a href="javascript:history.back()"><button>BACK</button></a>
</div>
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

