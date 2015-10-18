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
@media print{
	#b4{display:none;}
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
Statement st=con.createStatement();%>
<div id="b2" style="width:1000px;float:right">
<center>
<div id="b3" style="background-color:lightgrey;width:950px;float:left;color:black"><br><br><center>
<div id="b6" style="width:870px;float:center;color:black">
<% 
String type1=request.getParameter("type");
String pyear=request.getParameter("pyear");
String year=request.getParameter("year");
		String pdate,date1;
		pdate=pyear+"-07-01";
		date1=year+"-06-30";
		if(!(type1.equals(""))&& !(type1.equals("other"))){
		ResultSet rs=st.executeQuery("select * from expensedetails where events='"+type1+"' and date between '"+pdate+"' and '"+date1+"'");%>
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
<td><t><%=rs.getInt(3)%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</t></td>
</tr>
<%
total=total+rs.getInt(3);%>
<%}
%></table><h4>TOTAL AMOUNT SPENT=<%=total%></h4>
<%
}
else if(!type1.equals("")&& type1.equals("other"))
{
	ResultSet rs=st.executeQuery("select * from expensedetails where events!='itrix' and events!='i++' and date between '"+pdate+"' and '"+date1+"'");%>
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
<td><t><%=rs.getInt(3)%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</t></td>
</tr>
<%
total=total+rs.getInt(3);%>
<%}
%></table><h4>TOTAL AMOUNT SPENT=<%=total%></h4>	<%
}
else
{
	ResultSet rs=st.executeQuery("select * from expensedetails where date between '"+pdate+"' and '"+date1+"'");%>
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
<td><t><%=rs.getInt(3)%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</t></td>
</tr>
<%
total=total+rs.getInt(3);%>
<%}
%></table><h4>TOTAL AMOUNT SPENT=<%=total%></h4>	<%
}	%>
</div></center></div></div>
<div id="b4" style="width:300px;height:700px;float:left">
<ul>
<h4><a href="#"onClick="print()"><button>save as pdf</button></a></h4>
<h4><form name="myform" method="post" action="expensesearch1.jsp"><input type="hidden" name="pdate" value="<%=pdate%>"><input type="hidden" name="date1" value="<%=date1%>">
<input type="submit" value="search"></form></h4>
<h4><form name="myform" method="post" action="piechart6.jsp"><input type="hidden" name="events"><input type="hidden" name="pdate" value="<%=pdate%>"><input type="hidden" name="date1" value="<%=date1%>">
<input type="submit" value="create chart"></form></h4>
<h4><a href="javascript:history.back()"><button>Go Back</button></a></h4>
</div>
<%}
catch(Exception e)
{
out.println("error:"+e.getMessage());
}%>
</div>
</div>
</body>
</html>

