<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> 
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="home.product.ProductDTO" %>
<%@ page import="home.product.ProductDAO" %>

<%request.setCharacterEncoding("UTF-8"); %>
<% 
	String save = request.getRealPath("save"); // 톰캣 서버에 만들어 놓은 폴더 이름 설정 
	int size = 1024*1024*10; // 파일크기 설정 (10MB
	String enc = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,save,size,enc,dp);

	ProductDTO dto = new ProductDTO();
	
	dto.setName(mr.getParameter("name"));
	dto.setImg(mr.getParameter("img"));
	dto.setCity(mr.getParameter("city"));
	dto.setKind(mr.getParameter("kind"));
	dto.setMenual(mr.getParameter("menual"));
	
	ProductDAO dao = ProductDAO.getInstance();
	dao.insert(dto);
	
	response.sendRedirect("/home/product/list");
%>