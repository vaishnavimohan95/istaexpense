<html>
<title>ISTA EXPENSE TRACKER</title>
<head>
<link href="style1.css" rel="stylesheet" type="text/css" />

<style>
b{
	font-size:17;
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
          <li><a href="adminlogin.jsp"><b>ADMIN</b></a></li>
		  <li><a href="memberlogin.jsp"><b>MEMBER</b></a></li>
         </li>
      </ul>
   </nav>
</div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
<br>
<br><br>
<center>
<form name="myform" method="post" action="membersignconf.jsp" onsubmit="return validateForm()">
<table>
<tr><th>USERNAME:</th><th><input type="text" name="uname"></th></tr>
<tr></tr><tr></tr>
<tr><th>PASSWORD:</th><th><input type="password" name="pwd"></th></tr></table><br>
<input type="submit" value="SIGNIN"></form><br><a href="home.jsp"><button>BACK</button></a>
</div>
</div>
</body>
</html>

