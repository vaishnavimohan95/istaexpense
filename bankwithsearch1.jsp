<html>
<title>ISTA EXPENSE TRACKER</title>
<head>
<link href="style1.css" rel="stylesheet" type="text/css" />
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
  </div><br><br>
<form name="myform" method="post" action="bankwithsearch.jsp">
<table>
<tr><th>ID:</th><th><input type="text" name="id"></th></tr><tr></tr>
<tr><th>NAME:</th><th><input type="text" name="name"></th></tr><tr></tr>
<tr><th>AMOUNT:</th><th><input type="text" name="amt"></th></tr><tr></tr>
<tr><th>EVENT:</th><th><input type="text" name="event"></th></tr><tr></tr>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<tr><th>DATE:</th><th><input type="text" name="date"></th><th>(yyyy-mm-dd)</th></tr><tr></tr>
<tr><th>FROM DATE:</th><th><input type="text" name="from"></th><th>(yyyy-mm-dd)</th></tr><tr></tr>
<tr><th>TO DATE:</th><th><input type="text" name="to"></th><th>(yyyy-mm-dd)</th></tr><tr></tr></table><br>
<input type="submit" value="SUBMIT"></form><br><a href="javascript:history.back()">Go Back</a>
</div>
</div>
</body>
</html>