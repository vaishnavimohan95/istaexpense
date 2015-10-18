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
		#b4 { display: none; }
		#b7 { display: none; }
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
<div class="main">

  <div class="header">
    <div class="header_resize">
      <div class="logo"><h1>ISTA EXPENSE TRACKER</h1></div>
      <div id="b1" class="menu_nav">
       <div id="b2"class="nav-wrapper">
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
<div id="b4" style="float:right"><ul>
<li><a href="#" onClick="print()">Save As PDF</a></li>
<li><a href="javascript:history.back()">Back</a></li></ul>
</ul></center>
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
Statement st1=con.createStatement();
String events1="meeting";
String events="freshers day";
String events2="conference";%>
<center><h3>BUDGET VARIANCE</h3></center>
<center>
<div style="width:1100px">
<div style="width:550px;float:left">
<% 
Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
        int day = localCalendar.get(Calendar.DATE);
      int month = localCalendar.get(Calendar.MONTH) + 1;
      int year = localCalendar.get(Calendar.YEAR);
	  ResultSet rs=null;
	  ResultSet rs1=null;
		String pdate,date1;
		int pyear=0;
		if(month<7){
		pyear=year-1;
		pdate=pyear+"-07-01";
		date1=year+"-06-30";}
		else{pyear=year+1;
		date1=pyear+"-06-30";
		pdate=year+"-07-01";}%>
		<center>
		<div id="b3" style="background-color:lightgrey;width:500px;float:left;color:black"><br>
		<div id="b7"><button style="width:5px; height: 14px;background-color:red"></button>&nbsp<b>expense>budget</b>&nbsp&nbsp&nbsp&nbsp<button style="width:5px; height: 14px;background-color:blue"></button>&nbsp<b>budget>=expense</b>&nbsp&nbsp&nbsp <button style="width:9px; height: 18px"><b>-</b></button>&nbsp budget not made</div>
		<center>
		 <div id="b6" style="width:480px;float:center">
		<%
		rs=st.executeQuery("select expensedetails.reason,expensedetails.amount,budgetfresh.details,budgetfresh.amount from expensedetails inner join budgetfresh on expensedetails.reason=budgetfresh.details where expensedetails.events='"+events+"' and date between '"+pdate+"' and '"+date1+"'"); %>
		<table border="3"  id="itrix">
		<h4>FRESHER'S DAY</h4>
<tr>
<th><B>MODE OF EXPENSE</B></th>
<th><B>BUDGET AMOUNT</B></th>
<th><B>ACTUAL EXPENSE</B></th>
<th><B>VARIANCE</B></th>
</tr><%
		int amt=0;
			if(rs.next()){
				do{%>
	<tr>
				<td><t><%=rs.getString(1)%></t></td>
				<td><t><%=rs.getInt(4)%></t></td>
				<td><t><%=rs.getInt(2)%></t></td><%
				amt=rs.getInt(4)-rs.getInt(2);
				if(amt<0){ amt = -amt;%> <td><t><font style="color:red"><%=amt%></font></t></td><%}
				else{%><td><t><font style="color:blue"><%=amt%></font></t></td><%}%>
				</tr><%}while(rs.next());
			}
			rs=st.executeQuery("select * from budgetfresh");
			int i=0;
			while(rs.next())
			{
				i=i+1;
			}
			rs1=st1.executeQuery("select reason,amount from expensedetails where events='"+events+"' and date between '"+pdate+"' and '"+date1+"'");
			int j=0;
			while(rs1.next())
			{
				j=i;
				rs=st.executeQuery("select * from budgetfresh");
				while(rs.next())
				{
					if(!(rs.getString(1).equals(rs1.getString(1))))
					{
					j=j-1;
					}
				}
				if(j==0)
				{%>
				<tr>
				<td><t><%=rs1.getString(1)%></t></td>
				<td><t>-</t></td>
				<td><t><%=rs1.getInt(2)%></t></td>
				<td><t>-</t></td></tr><%
				}
			}
		%></table>
		
		<br>
</div></center></div><br><br><br><br>
		<div id="b3" style="background-color:lightgrey;width:500px;float:left;color:black"><br>
		<div id="b7"><button style="width:5px; height: 14px;background-color:red"></button>&nbsp<b>expense>budget</b>&nbsp&nbsp&nbsp&nbsp<button style="width:5px; height: 14px;background-color:blue"></button>&nbsp<b>budget>=expense</b>&nbsp&nbsp&nbsp <button style="width:9px; height: 18px"><b>-</b></button>&nbsp budget not made</div>
		<center>
		 <div id="b6" style="width:480px;float:center">
		<%
		rs=st.executeQuery("select expensedetails.reason,expensedetails.amount,budgetcon.details,budgetcon.amount from expensedetails inner join budgetcon on expensedetails.reason=budgetcon.details where expensedetails.events='"+events2+"'and date between '"+pdate+"' and '"+date1+"'"); %>
		<table border="3"  id="itrix">
		<h4>CONFERENCE</h4>
<tr>
<th><B>MODE OF EXPENSE</B></th>
<th><B>BUDGET AMOUNT</B></th>
<th><B>ACTUAL EXPENSE</B></th>
<th><B>VARIANCE</B></th>
</tr><%
		amt=0;
			if(rs.next()){
				do{%>
	<tr>
				<td><t><%=rs.getString(1)%></t></td>
				<td><t><%=rs.getInt(4)%></t></td>
				<td><t><%=rs.getInt(2)%></t></td><%
				amt=rs.getInt(4)-rs.getInt(2);
				if(amt<0){ amt = -amt;%> <td><t><font style="color:red"><%=amt%></font></t></td><%}
				else{%><td><t><font style="color:blue"><%=amt%></font></t></td><%}%>
				</tr><%}while(rs.next());
			}
			rs=st.executeQuery("select * from budgetcon");
			i=0;
			while(rs.next())
			{
				i=i+1;
			}
			rs1=st1.executeQuery("select reason,amount from expensedetails where events='"+events2+"' and date between '"+pdate+"' and '"+date1+"'");
		    j=0;
			while(rs1.next())
			{
				j=i;
				rs=st.executeQuery("select * from budgetcon");
				while(rs.next())
				{
					if(!(rs.getString(1).equals(rs1.getString(1))))
					{
					j=j-1;
					}
				}
				if(j==0)
				{%>
				<tr>
				<td><t><%=rs1.getString(1)%></t></td>
				<td><t>-</t></td>
				<td><t><%=rs1.getInt(2)%></t></td>
				<td><t>-</t></td></tr><%
				}
			}
		%></table>
		
		<br>
</div></center></div><br><br></div>
<center>
<div style="width:550px;float:right">
<div id="b3" style="background-color:lightgrey;width:500px;float:left;color:black"><br>
		<div id="b7"><button style="width:5px; height: 14px;background-color:red"></button>&nbsp<b>expense>budget</b>&nbsp&nbsp&nbsp&nbsp<button style="width:5px; height: 14px;background-color:blue"></button>&nbsp<b>budget>=expense</b>&nbsp&nbsp&nbsp <button style="width:9px; height: 18px"><b>-</b></button>&nbsp budget not made</div>
		<center>
		 <div id="b6" style="width:480px;float:center">
		<%
		rs=st.executeQuery("select expensedetails.reason,expensedetails.amount,budgetmeet.details,budgetmeet.amount from expensedetails inner join budgetmeet on expensedetails.reason=budgetmeet.details where expensedetails.events='"+events1+"' and date between '"+pdate+"' and '"+date1+"'"); %>
		<table border="3"  id="itrix">
		<h4>MEETING</h4>
<tr>
<th><B>MODE OF EXPENSE</B></th>
<th><B>BUDGET AMOUNT</B></th>
<th><B>ACTUAL EXPENSE</B></th>
<th><B>VARIANCE</B></th>
</tr><%
		amt=0;
			if(rs.next()){
				do{%>
	<tr>
				<td><t><%=rs.getString(1)%></t></td>
				<td><t><%=rs.getInt(4)%></t></td>
				<td><t><%=rs.getInt(2)%></t></td><%
				amt=rs.getInt(4)-rs.getInt(2);
				if(amt<0){ amt = -amt;%> <td><t><font style="color:red"><%=amt%></font></t></td><%}
				else{%><td><t><font style="color:blue"><%=amt%></font></t></td><%}%>
				</tr><%}while(rs.next());
			}
			rs=st.executeQuery("select * from budgetmeet");
			i=0;
			while(rs.next())
			{
				i=i+1;
			}
			rs1=st1.executeQuery("select reason,amount from expensedetails where events='"+events1+"' and date between '"+pdate+"' and '"+date1+"'");
		    j=0;
			while(rs1.next())
			{
				j=i;
				rs=st.executeQuery("select * from budgetmeet");
				while(rs.next())
				{
					if(!(rs.getString(1).equals(rs1.getString(1))))
					{
					j=j-1;
					}
				}
				if(j==0)
				{%>
				<tr>
				<td><t><%=rs1.getString(1)%></t></td>
				<td><t>-</t></td>
				<td><t><%=rs1.getInt(2)%></t></td>
				<td><t>-</t></td></tr><%
				}
			}
		%></table>
		
		<br>
</div></center></div><br><br><br><br>
<div id="b3" style="background-color:lightgrey;width:500px;float:left;color:black"><br>
		<div id="b7"><button style="width:5px; height: 14px;background-color:red"></button>&nbsp<b>expense>budget</b>&nbsp&nbsp&nbsp&nbsp<button style="width:5px; height: 14px;background-color:blue"></button>&nbsp<b>budget>=expense</b>&nbsp&nbsp&nbsp <button style="width:9px; height: 18px"><b>-</b></button>&nbsp budget not made</div>
		<center>
		 <div id="b6" style="width:480px;float:center">
		<%
		rs=st.executeQuery("select expensedetails.reason,expensedetails.amount,budgetothers.details,budgetothers.amount from expensedetails inner join budgetothers on expensedetails.reason=budgetothers.details where expensedetails.events!='"+events+"' and expensedetails.events!='"+events1+"' and expensedetails.events!='"+events2+"'and expensedetails.events!='itrix' and expensedetails.events!='i++' and date between '"+pdate+"' and '"+date1+"'"); %>
		<table border="3"  id="itrix">
		<h4>OTHERS</h4>
<tr>
<th><B>MODE OF EXPENSE</B></th>
<th><B>BUDGET AMOUNT</B></th>
<th><B>ACTUAL EXPENSE</B></th>
<th><B>VARIANCE</B></th>
</tr><%
		amt=0;
			if(rs.next()){
				do{%>
	<tr>
				<td><t><%=rs.getString(1)%></t></td>
				<td><t><%=rs.getInt(4)%></t></td>
				<td><t><%=rs.getInt(2)%></t></td><%
				amt=rs.getInt(4)-rs.getInt(2);
				if(amt<0){ amt = -amt;%> <td><t><font style="color:red"><%=amt%></font></t></td><%}
				else{%><td><t><font style="color:blue"><%=amt%></font></t></td><%}%>
				</tr><%}while(rs.next());
			}
			rs=st.executeQuery("select * from budgetothers");
			i=0;
			while(rs.next())
			{
				i=i+1;
			}
			rs1=st1.executeQuery("select reason,amount from expensedetails where expensedetails.events!='"+events+"' and expensedetails.events!='"+events1+"' and expensedetails.events!='"+events2+"'and expensedetails.events!='itrix' and expensedetails.events!='i++' and date between '"+pdate+"' and '"+date1+"'");
		    j=0;
			while(rs1.next())
			{
				j=i;
				rs=st.executeQuery("select * from budgetothers");
				while(rs.next())
				{
					if(!(rs.getString(1).equals(rs1.getString(1))))
					{
					j=j-1;
					}
				}
				if(j==0)
				{%>
				<tr>
				<td><t><%=rs1.getString(1)%></t></td>
				<td><t>-</t></td>
				<td><t><%=rs1.getInt(2)%></t></td>
				<td><t>-</t></td></tr><%
				}
			}
		%></table>
		
		<br>
</div></center></div></div>
<%

}
catch(Exception e)
{
out.println("error:"+e.getMessage());
}%>
</div>
</div></div></div>
</div>
</body>
</html>

