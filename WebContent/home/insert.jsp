<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "home.sign.model.SignupDAO" %>
<%@ page import = "home.sign.model.SignupDTO" %> 
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> 
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
	<h1> insert page </h1>

	<%request.setCharacterEncoding("UTF-8");
	String save = request.getRealPath("save"); // 톰캣 서버에 만들어 놓은 폴더 이름 설정 
	int size = 1024*1024*10; // 파일크기 설정 (10MB
	String enc = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,save,size,enc,dp);

	SignupDTO dto = new SignupDTO();
	dto.setId(mr.getParameter("id"));
	dto.setPw(mr.getParameter("pw"));
	dto.setPw2(mr.getParameter("pw2"));
	dto.setName(mr.getParameter("name"));
	dto.setGender(mr.getParameter("gender"));
	dto.setNum(mr.getParameter("num"));
	dto.setEmail(mr.getParameter("email"));
	dto.setAddress(mr.getParameter("address"));
	dto.setImg(mr.getParameter("img"));
	
	SignupDAO dao = new SignupDAO();
    boolean result = dao.selectId(dto.getId());
    if(result){
    %>
   		 <script>
    		alert("이미 등록되었습니다.");
    		window.location = "main_signup";  
  		</script>
  	  <%}else{
    	dao.insert(dto);
    %>
    	<script>
    		alert("등록되었습니다.");
    		window.location = "main.jsp";   
    	</script>
    <%}%>
