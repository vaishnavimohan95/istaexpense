<html>
<head>
<link href="style1.css" rel="stylesheet" type="text/css" />
<style>
#itrix {
    font-family: "trebuchet MS", Arial, Helvetica, sans-serif;
    width: 80%;
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
a:link {text-decoration:none;color:blue;}   
a:visited {text-decoration:none;color:blue;} 
a:hover {text-decoration:none;color:blue;}   
a:active {text-decoration:none;color:blue;}
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
<%
   
    try
    {%>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/ista","root","root");
Statement st=con.createStatement();
int s=0;
String name=request.getParameter("name");
Integer amount=Integer.parseInt(request.getParameter("amt"));
String events=request.getParameter("type");
String reason=request.getParameter("reason");
String date1=request.getParameter("date");
String month=date1.substring(5,7);
int year=Integer.parseInt(date1.substring(0,4));
if((month.substring(1,2)).equals("-"))
{
	s=Integer.parseInt(month.substring(0,1));
}
else{s=Integer.parseInt(month);}
String mode=request.getParameter("paymode");
String cdno=request.getParameter("cdno");
String id,s2,s3,id1,str,str1;
int pyear=0;
int i=0;
ResultSet rs;
String pdate,date2;
		if(s<7){
		pyear=year-1;
		pdate=pyear+"-07-01";
		date2=year+"-06-30";
		s2=pdate.substring(2,4);
		s3=date2.substring(2,4);}
		else{
		pyear=year+1;
		date2=pyear+"-06-30";
		pdate=year+"-07-01";
		s2=pdate.substring(2,4);
		s3=date2.substring(2,4);}
		if(pyear<year){
		rs=st.executeQuery("select * from expensedetails where date between '"+pdate+"' and '"+date2+"'");}
		else{
		 rs=st.executeQuery("select * from expensedetails where date between '"+pdate+"' and '"+date2+"'");
		}
		
while(rs.next()){ 
id1=rs.getString(1);
str=id1.substring(0,8);
str1=id1.replace(str,"");
i=Integer.parseInt(str1);
}
id="ista"+s2+s3+(i+1);
PreparedStatement ps=con.prepareStatement("insert into expensedetails values(?,?,?,?,?,?,?,?)");
ps.setString(1,id);
ps.setString(2,name);
ps.setInt(3,amount);
ps.setString(4,events);
ps.setString(5,reason);
ps.setString(6,mode);
ps.setString(7,cdno);
ps.setString(8,date1);
int b=ps.executeUpdate();
if(b!=0)
{%><br><br><%
	out.println("entered successfully");
	
    rs=ps.executeQuery("select * from expensedetails where id='"+id+"'");
	%>	<br><br>
	<div id="b3" style="background-color:lightgrey;width:1050px;float:right;color:black"><br><br><center>
<div id="b6" style="width:1000px;float:center;color:black">
	<table border="2" cellpadding="8" cellspacing="2" id="itrix">
	<tr>
	<th></th>
	<th><b>NAME</b></th>
	<th><b>AMOUNT</b></th><th><b>EVENT</b></th><th><b>REASON</b></th><th><b>PAYMENT MODE</b></th><th><b>CHEQUE/DD NO</b></th><th><b>DATE</b></th>
	</tr><%
	while(rs.next())
	{%>
		<tr>
		<td><t><%=rs.getString(1)%></t></td>
		<td><t><%=rs.getString(2)%></t></td>
		<td><t><%=rs.getInt(3)%></t></td>	
		<td><t><%=rs.getString(4)%></t></td>
		<td><t><%=rs.getString(5)%></t></td>
		<td><t><%=rs.getString(6)%></t></td>
		<td><t><%=rs.getString(7)%></t></td>
		<td><t><%=rs.getString(8)%></t></td>
		</tr><%
	}%></table></div></center><br></div>
	  <%
}
else
{
out.println("not registreed");
}
	}
	catch(Exception e)
	{
	out.println("error:"+e.getMessage());
	}%><br><br>
<a href="expenseentry.jsp"><button>BACK</button></a>

</div>
</div>
</body>
</html>
