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
<%
int a=0,amount=0;
String name1="",date1="",type1="",reason="",name2="",name3="",mode="",cdno="",events="";
String n2=request.getParameter("id");
String sub=n2.substring(0,5);
if(sub.equals("istaw"))
{		
		name1=request.getParameter("name1");
		amount=Integer.parseInt(request.getParameter("amount"));
		date1=request.getParameter("date1");
		events=request.getParameter("events");
		a=st.executeUpdate("update bankwithdetails set name='"+name1+"' ,events='"+events+"', amount='"+amount+"' , date='"+date1+"' where id='"+n2+"'");
}
else if(sub.equals("istad")){
		name2=request.getParameter("name1");
		amount=Integer.parseInt(request.getParameter("amount"));
		reason=request.getParameter("reason");
		type1=request.getParameter("events");
		mode=request.getParameter("mode");
		cdno=request.getParameter("cdno");
		date1=request.getParameter("date1");
		a=st.executeUpdate("update bankdepodetails set name1='"+name2+"' ,mode1='"+mode+"',chequedd_no1='"+cdno+"', amount1='"+amount+"' , date1='"+date1+"' , from1='"+reason+"' where id1='"+n2+"'");
	}
	else{
		name3=request.getParameter("name1");
		amount=Integer.parseInt(request.getParameter("amount"));
		type1=request.getParameter("events");
		reason=request.getParameter("reason");
		mode=request.getParameter("mode");
		cdno=request.getParameter("cdno");
		date1=request.getParameter("date1");
		a=st.executeUpdate("update expensedetails set name='"+name3+"' , amount='"+amount+"' ,mode='"+mode+"' ,chequedd_no='"+cdno+"',date='"+date1+"' , reason='"+reason+"' , events='"+type1+"' where id='"+n2+"'");
		
}
if(a==0)
{
	out.println("updation unsuccessful");
}
else
{
	out.println("updated successfully");
}%>
<a href="javascript:history.back()"><button>Go Back</button></a><%
}
catch(Exception e)
{
out.println("error:"+e.getMessage());
}%>
</div>
</div>
</body>
</html>