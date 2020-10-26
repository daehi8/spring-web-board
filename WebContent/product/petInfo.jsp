<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "home.product.ProductDTO" %>
<%@ page import = "home.product.ProductDAO" %>

<%
int number = Integer.parseInt(request.getParameter("number"));
int no = Integer.parseInt(request.getParameter("no"));
try{
	ProductDAO dao = ProductDAO.getInstance();
	ProductDTO dto = dao.getproduct(no);
%>

<form>
	<table>
		<tr>
			<td>글번호</td>
			<td><%=number+1%></td>
			<td>이름</td>
			<td></td>
			<td>조회수</td>
			<td><%=dto.getReadcount()%>
		</tr>
		<tr>
			<td><%=dto.getImg() %></td>
		</tr>
		<tr>
			<td><%=dto.getMenual() %>
		</tr>
		<tr>
			<td>지역</td>
			<td><%=dto.getCity() %></td>
			<td>품종</td>
			<td><%=dto.getKind() %></td>
		</tr>
		<tr>
			<td>
				<input type="button" value="목록" 
       		onclick="document.location.href='/home/product/list.jsp'">
       			<input type="button" value="장바구니" 
       		onclick="document.location.href='/home/product/petPocketPro.jsp'">
       		<input type="button" value="구매" 
       		onclick="document.location.href='/home/product/petPocketPro.jsp'">
			</td>
		</tr>	
	</table>
</form>
<%}catch(Exception e){}%>