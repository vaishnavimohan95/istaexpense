<html>
<title>ISTA EXPENSE TRACKER</title>
<head>
<link href="style1.css" rel="stylesheet" type="text/css" />
<script>
function validateForm()
{
var x=document.forms["myform"]["paymode"].value;
var y=document.forms["myform"]["cdno"].value;
var str1="cash";
var n = x.localeCompare(str1);
if(n==0)
{
if(y!="")
{
alert("cheque/dd number field must be empty");
return false;
}
}
else
{
	if(y==""||y==null)
	{
		alert("enter the cheque/dd no");
		return false;
	}
}
}
</script>
<style>
input[type="number"]{
border:2px solid blue;
border-radius:10px;
height:22px;
width:100px;
}
input[type="text"]{
border:2px solid blue;
border-radius:10px;
height:22px;
width:230px;
}
select{
border:2px solid blue;
border-radius:10px;
height:22px;
width:230px;
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
<%@ page import="java.util.Calendar"%>
 <%@ page import="java.util.Date"%>
<%@ page import="java.util.TimeZone"%>
<%try
{
	Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
        int day = localCalendar.get(Calendar.DATE);
        int month = localCalendar.get(Calendar.MONTH) + 1;
        int year = localCalendar.get(Calendar.YEAR);
		%>
		<br><br><br>
<form name="myform" method="post" action="bankdepositdb.jsp" onsubmit="return validateForm()">
<table>
<tr><th>NAME:</td><th><input type="text" name="name" required></th></tr><tr></tr>
<tr><th>AMOUNT:</th><th><input type="text" name="amt" pattern="[0-9]*" title="only numbers"required></th></tr><tr></tr>
<tr><th>EVENT:</th><th><input type="text" name="event" required></th></tr><tr></tr>
<tr><th>FROM:</th><th><input type="text" name="reason" required></th></tr><tr></tr>
<tr><th>PAYMENT MODE:</th><th><select name="paymode" required>
<option value="cash">cash</option>
  <option value="cheque">cheque</option>
   <option value="DD">DD</option>
</select></th></tr><tr></tr>
<tr><th>CHEQUE/DD NO:</th><th><input type="text" name="cdno"></th></tr><tr></tr>
<tr><th>DATE:</th><th><input type="text" name="date" value="<%=year%>-<%=month%>-<%=day%>" required></th></tr></table><br>
<input type="submit" value="SUBMIT"></form><br>
<a href="javascript:history.back()"><button>Back</button></a>
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

