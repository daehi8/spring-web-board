<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<h1>insertForm 페이지</h1>
	
	<%request.setCharacterEncoding("UTF-8"); %>
	
	<form action="insertPro.jsp" method="post" enctype="multipart/form-data">
		학생 이름 : <input type="text" name="name" /> <br />
		사진 : <input type="file" name="img"/> <br />
		지역 : <input type="text" name="city" /> <br />
		품종 : <input type="text" name="kind" /> <br />
		설명 : <input type="text" name="menual" /> <br />
		<input type="submit" value="등록" /> <br />
	</form>