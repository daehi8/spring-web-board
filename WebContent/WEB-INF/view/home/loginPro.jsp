<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="home.home.model.SignupDAO"%>

<jsp:useBean id="dto" class="home.home.model.SignupDTO" />
<jsp:setProperty property="*" name="dto"/>	
<%	
	SignupDAO dao = new SignupDAO();
    boolean result = dao.loginCheck(dto);

	if(result){
		session.setAttribute("id",dto.getId());
		session.setAttribute("pw",dto.getPw());
		response.sendRedirect("main.jsp");
	}else{%>
	<script> 
	  alert("아이디나 비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
<%}	%>	