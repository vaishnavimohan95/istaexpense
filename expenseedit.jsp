<html>
<title>ISTA EXPENSE TRACKER</title>
<link href="style1.css" rel="stylesheet" type="text/css" />
<head>
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
h5{
	font-size:15;
}
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
  </div>
<%@ page import="java.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="javax.sql.*" %>
<%try
    {%>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/ista","root","root");
Statement st=con.createStatement();%>
<br><br>
<form name="myform" method="post" target="_self" onsubmit="return validateForm()">
<input type="text" name="id">
<input type="submit" value="edit">
</form><br><a href="javascript:history.back()"><button>Go Back</button></a>
<%
int a=0,amount=0;
ResultSet rs;
String name="",date1="",type1="",reason="";
String n2=request.getParameter("id");
String sub=n2.substring(0,5);
%><br><br><%
if(sub.equals("istaw"))
{
		rs=st.executeQuery("select * from bankwithdetails where id='"+n2+"'");
		if(rs.next()){%>
		<form method="post" action="expenseedit1.jsp"><%
		do{%> 
		<h5>NAME:       <input type="text" name="name1" value="<%=rs.getString(2)%>"></h5>
		<h5>AMOUNT: <input type="text" name="amount" value="<%=rs.getInt(3)%>"></h5>
		<h5>EVENTS: <input type="text" name="events" value="<%=rs.getString(4)%>"></h5>
		<h5>Date1:    <input type="text" name="date1" value="<%=rs.getString(5)%>"></h5>
		<input type="hidden" name="id" value="<%=n2%>">
		<input type="submit" value="update">
		<%}while(rs.next());%></form><%
		}
		else
		{%>
			<h5>no record found</h5><%
		}
}
else if(sub.equals("istad")){
	rs=st.executeQuery("select * from bankdepodetails where id1='"+n2+"'");
	if(rs.next()){%>
	<form method="post" action="expenseedit1.jsp"><%
		do{%>
		<h5>NAME:<input type="text" name="name1" value="<%=rs.getString(2)%>"></h5>
		<h5>AMOUNT:<input type="text" name="amount" value="<%=rs.getInt(3)%>"></h5>
		<h5>EVENTS:<input type="text" name="events" value="<%=rs.getString(4)%>"></h5>
		<h5>REASON:<input type="text" name="reason" value="<%=rs.getString(5)%>"></h5>
		<h5>PAYMENT MODE:<input type="text" name="mode" value="<%=rs.getString(6)%>"></h5>
		<h5>CHEQUE/DD NO:<input type="text" name="cdno" value="<%=rs.getString(7)%>"></h5>
		<h5>Date1:</td><td><input type="text" name="date1" value="<%=rs.getString(8)%>"></h5>
		<input type="hidden" name="id" value="<%=n2%>">
		<input type="submit" value="update">
		<%}while(rs.next());%></form><%
		}
		else
		{%>
			<h5>no record found</h5><%
		}
	}
	else{
	rs=st.executeQuery("select * from expensedetails where id='"+n2+"'");
	if(rs.next()){%>
	<form method="post" action="expenseedit1.jsp"><%
		do{%>
		<h5>NAME:<input type="text" name="name1" value="<%=rs.getString(2)%>"></h5>
		<h5>AMOUNT:<input type="text" name="amount" value="<%=rs.getInt(3)%>"></h5>
		<h5>EVENTS:<input type="text" name="events" value="<%=rs.getString(4)%>"></h5>
		<h5>REASON:<input type="text" name="reason" value="<%=rs.getString(5)%>"></h5>
		<h5>PAYMENT MODE:<input type="text" name="mode" value="<%=rs.getString(6)%>"></h5>
		<h5>CHEQUE/DD NO:<input type="text" name="cdno" value="<%=rs.getString(7)%>"></h5>
		<h5>Date1:<input type="text" name="date1" value="<%=rs.getString(8)%>"></h5>
		<input type="hidden" name="id" value="<%=n2%>">
		<input type="submit" value="update">
		<%}while(rs.next());%></form><%
		}
		else
		{%>
			<h5>no record found</h5><%
		}
}%>
<br><a href="javascript:history.back()"><button>Go Back</button></a><%
}
catch(Exception e)
{
e.printStackTrace();
}%>
</div>
</div>
</body>
</html>