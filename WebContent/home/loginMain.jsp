<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<table width="800" border="1" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<jsp:include page = "top.jsp" flush = "false" ></jsp:include>
		</td>
		<td width = "150">
			<jsp:include page = "loginHome.jsp" flush = "false"></jsp:include>
		</td>
	</tr>
	<tr>
		<td colspan = "2">
			<jsp:include page = "loginForm.jsp" flush = "false"></jsp:include>
		</td>
	</tr>
	<tr>
		<td colspan = "2">
			<jsp:include page = "bottom.jsp" flush = "false"></jsp:include>
		</td>
	</tr>				
</table>