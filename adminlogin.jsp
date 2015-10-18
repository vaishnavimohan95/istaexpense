<html>
<title>ISTA EXPENSE TRACKER</title>
<head>
<link href="style1.css" rel="stylesheet" type="text/css" />
<style>
b{
	font-size:17;
}
h3{
	font-size:15;
}
h4{
	font-size:13;
}
input[type="text"]{
border:2px solid blue;
border-radius:10px;
height:22px;
width:230px;
}
input[type="password"]{
border:2px solid blue;
border-radius:10px;
height:22px;
width:230px;
}
a:link {text-decoration:none;color:blue;}   
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
       <ul>
	  <li><a href="adminlogin.jsp"><b>ADMIN</b></a></li>
	  <li><a href="memberlogin.jsp"><b>MEMBER</b></a></li>
	  </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
<h3>LOGIN HERE</h3>
<form name="myform" method="post" onsubmit="return validateForm()" action="adminsignconf.jsp">

<h4>USERNAME:  <input type="text" name="uname" required></h4>

<h4>PASSWORD:  <input type="password" name="pwd" required></h4><br>
<input type="submit" value="SIGNIN"><br><br>
</form><a href="home.jsp"><button>BACK</button></a>
</div>
</div>
</body>
</html>

