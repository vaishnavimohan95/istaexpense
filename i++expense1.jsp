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
    	#b4 { display: none; }
		#b2 { display: none; }
    	#container { display: block; }
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
		
<table border="3" cell spacing="20" cell padding="20" id="itrix">
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
<div id="b4" style="width:300px;height:900px;float:left">
<ul>
<h4><form name="myform" method="post" action="expensesearch1.jsp"><input type="hidden" name="pdate" value="<%=pdate%>"><input type="hidden" name="date1" value="<%=date1%>">
<input type="submit" value="search"></form></h4>
<h4><form name="myform" method="post" action="piechart6.jsp"><input type="hidden" name="pdate" value="<%=pdate%>"><input type="hidden" name="date1" value="<%=date1%>"><input type="hidden" name="events" value="<%=events%>">
<input type="submit" value="create chart"></form></h4>
<h4><form name="myform" method="post" action="prevexpense2.jsp"><input type="hidden" name="type" value="<%=events%>">
<input type="submit" value="previous year expenses"></form></h4>
<h4><a href="#"onClick="print()"><button>save as pdf</button></a></h4>
<h4><a href="expensedetails1.jsp"><button>GO BACK</button></a></h4></ul>
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

