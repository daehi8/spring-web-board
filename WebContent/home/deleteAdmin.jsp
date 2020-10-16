<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> 
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<%@ page import="home.sign.model.SignupDTO"%>
<%@ page import="home.sign.model.SignupDAO"%>
<%@ page import="java.io.File" %>
  <%request.setCharacterEncoding("UTF-8"); %>
	<%	
		String id = request.getParameter("id");
		SignupDAO dao = new SignupDAO();
		String img = dao.selectImg(id);
		if(img != null){
			String path = request.getRealPath("save");
			File f = new File(path+"//"+img);
			if(f.exists()){
				f.delete();
			}
		}
		dao.deleteAdmin(id);
	%>	
		<script>
			alert("탈퇴되었습니다.")
			window.location="Admin.jsp"
		</script>