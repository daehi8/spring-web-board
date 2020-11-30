<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "home.model.home.MemberDAO" %>
<%@ page import = "home.model.home.MemberDTO" %> 
	<h1> insert page </h1>

	<%
		request.setCharacterEncoding("UTF-8");
			MemberDTO dto = new MemberDTO();
			dto.setId(request.getParameter("id"));
			dto.setPw(request.getParameter("pw"));
			dto.setName(request.getParameter("name"));
			dto.setNickname(request.getParameter("nickname"));
			dto.setEmail(request.getParameter("email"));
			
			MemberDAO dao = new MemberDAO();
		    boolean result = dao.selectId(dto.getId());
		    if(result){
	%>
   		 <script>
    		alert("이미 등록되었습니다.");
    		window.location = "/home/home/main.jsp?main=signup01.jsp";  
  		</script>
  	  <%}else{
    	dao.insert(dto);
    %>
    	<script>
    		alert("등록되었습니다.");
    		window.location = "main.jsp";   
    	</script>
    <%}%>
