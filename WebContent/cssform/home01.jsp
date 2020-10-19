<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport"
content="width=device-width, initial-scale=1">
<title>homepage</title>
<style>
*{
	box-sizing : border-box;
}
body {
	font-family : Arial, Helvetica, sans-serif;
}
header {
	background-color : #666;
	padding : 30px;
	text-align : center;
	color : white;
}

nav{
	background-color : #555;
	list-style-type : none;
	margin : 0;
	padding : 0;
	overflow : hidden;
}
li{
	float : right;
}
li a {
	color : white;
	display : block;
	padding : 14px 16px;
	text-decoration : none;
}
section: after{
	content : "";
	display : table;
	clear : both;
}
.main{
	float : left;
	padding : 20px;
	width : 80%;
	background-color : #f1f1f1;
	height: 300px;
}
.sub{
	float : right;
	padding : 20px;
	width : 20%;
	background-color : white;
	height: 300px;
}
footer{
	background-color : #666;
	padding: 10px;
	text-align : center;
	color : white;
}
</style>
</head>
<body>

<header>
	<p>header</p>
</header>
<nav>
	<li><a href="#">signin</a></li>
	<li><a href="#">signup</a></li>
	<li><a href="#">contents</a></li>
	<li><a href="#">home</a></li>
</nav>
<section>
	<article class = "main">
		<p>hello</p>
	</article>
	<article class = "sub">
		<p>bye</p>
	</article>
</section>
<footer>
	<p>footer</p>
</footer>

</body>
</html>