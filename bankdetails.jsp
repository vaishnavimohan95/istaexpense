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
#itrix {
    font-family: "trebuchet MS", Arial, Helvetica, sans-serif;
    width: 95%;
    border-collapse: collapse;
}

#itrix td, #itrix th {
    font-size: 0.85em;
    border: 1px solid blue;
	color:black;
    padding: 5px 6px 3px 7px;
}

#itrix th {
    font-size: 1em;
    text-align: left;
    padding-top: 5px;
    padding-bottom: 4px;
    background-color:lightblue;
    color:black;
}
#itrix1 {
    font-family: "trebuchet MS", Arial, Helvetica, sans-serif;
    width: 100%;
    border-collapse: collapse;
}

#itrix1 td, #itrix th {
    font-size: 0.85em;
    border: 1px solid blue;
	color:black;
    padding: 5px 6px 3px 7px;
}

#itrix1 th {
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
	function mycalc(element)){
	 document.getElementById("demo").innerHTML=document.write(element);}
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
		  <li><a href="total.jsp">Total</a></li>
          <li><a href="adminhome.jsp">Home</a></li>
         <li><a href="expensehome.jsp">Expense Details</a> <ul class="sub-menu"> 
            <li><a href="itrixexpenses.jsp">Itrix</a></li> 
            <li><a href="i++expense.jsp">I++</a></li> 
			 <li><a href="otherexpense.jsp">Others</a></li> 
			  <li><a href="fullexpenses.jsp">Full</a></li>
         </ul> </li>
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
Statement st=con.createStatement();%>
<%
ResultSet rs=st.executeQuery("select * from amount");
%><center><br><font><%
if(rs.next())
{%>
	<B>INITIAL AMOUNT:<%=rs.getInt(2)%></B>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b>BALANCE:<%=rs.getInt(1)%></b>
<%}%></font></center>
<div id="b2" style="width:550px;float:left;color:black">
<h3>WITHDRAWAL</h3>
<font style="float:right">
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
		pdate=year+"-07-01";}
		if(pyear<year){  rs=st.executeQuery("select * from bankwithdetails where date between '"+pdate+"' and '"+date1+"'");}
		else{rs=st.executeQuery("select * from bankwithdetails  where date between '"+pdate+"' and '"+date1+"' ");}%>
<div id="t2" style="width:500px;height:50px;float:left">
<div id="t1" style="width:65px;height:25px;float:right">
<form name="myform" method="post" action="expenseremove.jsp">&nbsp<input type="submit" value="remove">
</form></div><div id="t1" style="width:65px;height:25px;float:right">
<form name="myform" method="post" action="bankwithsearch1.jsp">
<input type="hidden" name="pdate" value="<%=pdate%>">
<input type="hidden" name="date1" value="<%=date1%>">
<input type="submit" value="search">
</form></div>&nbsp&nbsp&nbsp <div id="t1" style="width:85px;height:25px;float:right">
<form name="myform" method="post" action="savebankwith.jsp">
<input type="hidden" name="pdate" value="<%=pdate%>">
<input type="hidden" name="date1" value="<%=date1%>">
<input type="hidden" name="events" >
<input type="submit" value="save as pdf">
</form></div><div id="t1" style="width:50px;height:25px;float:right">
<form name="myform" method="post" action="piechart2.jsp">
<input type="hidden" name="pdate" value="<%=pdate%>">
<input type="hidden" name="date1" value="<%=date1%>">
<input type="submit" value="chart">
</form></div>
<div id="t1" style="width:50px;height:30px;float:right">
<form name="myform" method="post" action="expenseedit.jsp">
<input type="submit" value="edit">
</form></div><div id="t1" style="width:40px;height:25px;float:right">
<a href="bankwith.jsp"><button>add</button></a></div>
<div id="t1" style="width:110px;height:25px;float:right">
<form name="myform" method="post" action="prevbankwith1.jsp"><input type="hidden" name="type" value="withdrawal"><input type="submit" value="previous year"></form></div></div>
<br><br><br>
<center>
<div id="b3" style="background-color:lightgrey;width:450px;float:right;color:black"><center>
<div id="b6" style="width:395px;float:center;color:black">
<br><br>
<table border="5" id="itrix1">
<tr>
<th><b>ID</b></th>
<th><B>DATE</B></th>
<th><B>NAME</B></th>
<th><B>EVENT</B></th>
<th><B>AMOUNT</B></th>
</tr><%
int total=0;
while(rs.next())
{%>
<tr>
<td><t><%=rs.getString(1)%></t></td>
<td><t><%=rs.getString(5)%></t></td>
<td><t><%=rs.getString(2)%></t></td>
<td><t><%=rs.getString(4)%></t></td>
<td><t><%=rs.getInt(3)%></t></td>
</tr>
<%total=total+rs.getInt(3);%>
<%}
int total1=total;
%></table><h4>total amount withdrawn=<%=total%></h4><br>
</font>
</div></center><br><br></div></center>
</div>
<div="b3" style="width:750px;float:right;color:black">
<h3>DEPOSIT</h3>
<%
		if(month<7){
		pyear=year-1;
		pdate=pyear+"-07-01";
		date1=year+"-06-30";}
		else{pyear=year+1;
		date1=pyear+"-06-30";
		pdate=year+"-07-01";}
		if(pyear<year){  rs=st.executeQuery("select * from bankdepodetails where date1 between '"+pdate+"' and '"+date1+"'");}
		else{rs=st.executeQuery("select * from bankdepodetails  where date1 between '"+pdate+"' and '"+date1+"' ");}%>
<div id="t2" style="width:600px;height:60px;float:right">
<div id="t1" style="width:65px;height:25px;float:left">
<form name="myform" method="post" action="expenseremove.jsp">
<input type="submit" value="remove">
</form></div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<div id="t1" style="width:55px;height:25px;float:left">
<form name="myform" method="post" action="bankdeposearch1.jsp">
<input type="hidden" name="pdate" value="<%=pdate%>">
<input type="hidden" name="date1" value="<%=date1%>">
<input type="submit" value="search"></form></div>
<div id="t1" style="width:95px;height:25px;float:left">
<form name="myform" method="post" action="piechart4.jsp">
<input type="hidden" name="pdate" value="<%=pdate%>">
<input type="hidden" name="date1" value="<%=date1%>">
<input type="submit" value="create chart">
</form></div><div id="t1" style="width:40;height:25px;float:left">
<form name="myform" method="post" action="expenseedit.jsp">
<input type="submit" value="edit">
</form></div><div id="t1" style="width:40px;height:25px;float:left"><a href="bankdepo.jsp"><button>add</button></a></div>
<div id="t1" style="width:100px;height:25px;float:left"><form name="myform" method="post" action="prevbankdepo1.jsp"><input type="hidden" name="type" value="deposit"><input type="submit" value="previous year"></a></form></div>
<div id="t1" style="width:80px;height:25px;float:left">
<form name="myform" method="post" action="savebankdepo.jsp">
<input type="hidden" name="pdate" value="<%=pdate%>">
<input type="hidden" name="date1" value="<%=date1%>">
<input type="hidden" name="events" >
<input type="submit" value="save as pdf">
</form></div></div>
<br><br><br><center>
<div id="b3" style="background-color:lightgrey;width:720px;float:left;color:black"><br><br><center>
<div id="b6" style="width:700px;float:center;color:black">
<table border="5" id="itrix">
<tr>
<th><b>ID</b></th>
<th><b>DATE</B></th>
<th><b>NAME</B></th>
<th><b>EVENT</b></th>
<th><b>FROM</b></th>
<th><B>MODE</b></th>
<th><b>CHEQUE/DD NO</th>
<th><B>AMOUNT</B></th>
</tr><% total=0;
while(rs.next())
{%>
<tr>
<td><t><%=rs.getString(1)%></t></td>
<td><%=rs.getString(8)%></td>
<td><t><%=rs.getString(2)%></t></td>
<td><t><%=rs.getString(4)%></t></td>
<td><t><%=rs.getString(5)%></t></td>
<td><t><%=rs.getString(6)%></t></td>
<td><t><%=rs.getString(7)%></t></td>
<td><t><%=rs.getInt(3)%></t></td>
</tr>
<%total=total+rs.getInt(3);%>
<%}
int total2=total;
%></table><h4>total amount deposited=<%=total%></h4><br>
</center>
</div></center><br><br></div>
</div>
<br><br><br>
<%
	}
catch(Exception e)
{
out.println("error:"+e.getMessage());
}%>
</font>
</div>
</div>
</div>
</body>
</html>

