<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="home.product.ProductDAO" %>
<%@ page import="home.product.PocketDTO" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="dto" scope="page" class="home.product.PocketDTO"/>
<jsp:setProperty name="dto" property="*"/>

<%
ProductDAO dao = ProductDAO.getInstance();
boolean result = dao.PocketCheck(dto.getNo());
if(result){
%>
   	<script>
    	alert("이미 등록되었습니다.");
    	history.go(-1);  
  	</script>	
<%}else{
	dao.Pocketinsert(dto);
%>
	<script>
    	alert("등록되었습니다.")
    	history.go(-1);  
  	</script>	
<%}%>
