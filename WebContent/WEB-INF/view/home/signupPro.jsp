<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "home.model.dao.MemberDAO" %>
<%@ page import = "home.model.dto.MemberDTO" %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<h1> insert page </h1>

	<%--
		request.setCharacterEncoding("UTF-8");
			MemberDTO dto = new MemberDTO();
			dto.setId(request.getParameter("id"));
			dto.setPw(request.getParameter("pw"));
			dto.setName(request.getParameter("name"));
			dto.setEmail(request.getParameter("email"));
			
			MemberDAO dao = new MemberDAO();
		    boolean result = dao.selectId(dto.getId());
		    if(result){
	--%>
	<c:if test="${result == true}"> 
   		 <script>
    		alert("이미 등록되었습니다.");
    		window.location = "/home/signup.do";  
  		</script>
  	</c:if>
  	  <%--}else{
    	dao.insert(dto);
    --%>
    <c:if test="${result == false}">
    	<script>
    		alert("등록되었습니다.");
    		window.location = "/home/main.do";   
    	</script>
    </c:if>
    <%--}--%>
