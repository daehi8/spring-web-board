<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="home.model.home.MemberDAO"%>

<jsp:useBean id="dto" class="home.model.home.MemberDTO" />
<jsp:setProperty property="*" name="dto"/>	
<%
		MemberDAO dao = new MemberDAO();
	    boolean result = dao.loginCheck(dto);

		if(result){
			session.setAttribute("id",dto.getId());
			session.setAttribute("pw",dto.getPw());
			response.sendRedirect("/home/main.do");
		}else{
	%>
	<script> 
	  alert("아이디나 비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
<%}	%>	