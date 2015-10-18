<html>
<head>
<link href="style1.css" rel="stylesheet" type="text/css" />
<style>


a:link {text-decoration:none;color:black;}   
a:visited {text-decoration:none;color:black;} 
a:hover {text-decoration:none;color:black;}   
a:active {text-decoration:none;color:black;}
</style>
<script>
function myfunc(element)
{
	document.getElementById("demo").innerHTML=element.value;
}
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
<%@ page  import="java.awt.*" %>
 <%@ page  import="java.io.*" %>
 <%@ page  import="org.jfree.chart.*" %>
 <%@ page  import="org.jfree.chart.entity.*" %>
 <%@ page  import ="org.jfree.data.general.*"%>
<%try
    {%>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/ista","root","root");
Statement st=con.createStatement();
%>
	<div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
<%
String pdate=request.getParameter("pdate");
String date1=request.getParameter("date1");
final DefaultPieDataset data = new DefaultPieDataset();
 int i=0;
 String str="";
 double amt=0;	
ResultSet rs=st.executeQuery("select * from bankwithdetails where date between '"+pdate+"' and '"+date1+"'");
 while(rs.next())
 {
	 str=rs.getString(4);
	 amt=rs.getInt(3);
	 data.setValue(str,amt);
 }

 
            JFreeChart chart = ChartFactory.createPieChart
             ("Pie Chart ", data, true, true, false);
                 final ChartRenderingInfo info = new 
               ChartRenderingInfo(new StandardEntityCollection()); 
                 final File file1 = new File("C:/TcatServer7/webapps/examples/jsp/jsp2/ista1/piechart3.png");
                 ChartUtilities.saveChartAsPNG(file1, chart, 600, 400, info);
            
			 %>
			 <jsp:forward page="piechart3.jsp"/>
		  <%
			}
			catch (Exception e) {
                 out.println(e);
             }%>
		  </html>
			 