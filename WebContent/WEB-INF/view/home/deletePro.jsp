<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="home.model.dao.MemberDAO" %>
<%@ page import="home.model.dto.MemberDTO" %>
    <%
    	String sessionId = (String)session.getAttribute("id");
                    	if(sessionId == null){
                    	response.sendRedirect("/home/main.do");
                    }
    %>
    
    <jsp:useBean id = "dto" class = "home.model.dto.MemberDTO" />
    <jsp:setProperty property="*" name="dto" />
    
    <%
        	MemberDAO dao = new MemberDAO();
           	boolean result = dao.loginCheck(dto);
           	if(result){
            	dao.delete(dto);
            	session.invalidate();
        %>
    	<script>
    		alert("탈퇴되었습니다");
    		window.location = "/home/main.do"
    	</script>
   	<%}else{%>
   		<script>
   			alert("비밀번호가 맞지 않습니다.");
   			window.location = "/home/deleteform.do"
   		</script>		
   	<%}%>