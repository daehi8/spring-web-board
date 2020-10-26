<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "home.product.ProductDAO" %>
<%@ page import = "home.product.ProductDTO" %> 


<%
    int count = 0;										// 전체 게시글 개수
    
    List petList = null;
    ProductDAO dao = ProductDAO.getInstance();		
    count = dao.getAnimalsCount();
    String sessionId = (String)session.getAttribute("id");
%>
<html>
<head>
	<title>게시판</title>
	<link href="/home/board/write.css" rel="stylesheet">
</head>
<body>

<table>
	<tr>
		<td>
			<%if(sessionId != null){ %>
			<input type= "button" class = "listbt" value = "글쓰기" onclick = "location.href='/home/board/writeForm.jsp'"/>
			<input type= "button" value="게시판" onclick="window.location='/home/board/list.jsp'" />
			<input type= "button" value="나의 작성글목록" onclick="window.location='/home/board/myList.jsp'" />
			<input type= "button" value="회원탈퇴" onclick="window.location='/home/home/deleteForm.jsp'" />
			<input type= "button" value="내정보확인" onclick="window.location='/home/home/myInfo.jsp'" />
			<input type= "button" value="로그아웃" onclick="window.location='/home/home/logout.jsp'" />
			<%}else{%>
			<input type= "button" class = "listbt" value = "로그인" onclick = "location.href='/home/home/loginForm.jsp'">
			<input type = "button"  value ="회원가입" onclick="window.location='/home/signup01.jsp'">
			<%}%>
		</td>
	</tr>
</table>

<% 
	if(count == 0){
%>
<table>
	<tr>
    	<td>
   		 	게시판에 저장된 글이 없습니다.
    	</td>
    <tr>
</table>
<% }else{ %>
<table>
	<%
	int j=0;
	for(int i = 0; i < petList.size(); i++) {
		ProductDTO dto= (ProductDTO)petList.get(i);
		if(j%4==0){
	%>
		<tr>
		<%}%>
		<td>
			<a href = "petInfo.jsp?no=<%=dto.getNo()%>">
				<img alt ="" src ="images/<%=dto.getImg()%>">
			</a><p>
			<b> 이름 : <%=dto.getName() %> </b></p>
		</td>
	<%}%>
<%}%>
</table>
</body>
</html>