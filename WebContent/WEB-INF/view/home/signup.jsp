<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> 
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="home.home.model.SignupDAO" %>
<%@ page import="home.home.model.SignupDTO" %>

<%request.setCharacterEncoding("UTF-8"); %>    
   
<form action = "insert.jsp" method = "post" enctype="multipart/form-data">
	<style>
	table{
		border-collapse:collapse; 
		font-size : 9pt; 
		width : 700px; 
		height : 400px; 
		padding: 10px; 
		border: 1px;
		border-style: solid none;
		margin : auto;
	}
	</style>

    <table>
      
  	  	<tr>
    		<td align = "center">아이디</td>
    		<td>
    			<input type = "text" size = 10 name = "id"/> 
    			<input type = "button" value = "중복확인" /> 
    		</td>
    	</tr>
        <tr>
    		<td align = "center">비밀번호</td>
    		<td><input type = "password" name = "pw"/></td>
    	</tr>
    	<tr>
    		<td align = "center">비밀번호 확인</td>
    		<td><input type = "password" name = "pw2"/></td>
    	</tr>
    	<tr>
    		<td align = "center">이름</td>
    		<td><input type = "text" size = 10 name = "name"/></td>
    	</tr>
    	<tr>
    		<td align = "center">성별</td>
    		<td>
    			남<input type = "radio" name = "gender" value = "남"/> 
    			여<input type = "radio" name = "gender" value = "여"/>
    		</td>
    	</tr>    	
    	<tr>
    		<td align = "center">닉네임</td>
    		<td><input type = "text" name = "nickname"/></td>
    	</tr> 
    	<tr>
    		<td align = "center">휴대폰 번호</td>
    		<td><input type = "text" placeholder = "-빼고 숫자만 입력" name = "num"/></td>
    	</tr>
    	<tr>
    		<td align = "center">이메일</td>
    		<td>
    			<input type = "text" size = 15 name = "email1"/>
    			<select name = "email2">
    				<option value="naver.com" selected>naver.com</option>
    				<option value="hanmail.net">hanmail.net</option>
    				<option value="gmail.com">gmail.com</option>
    			</select>
    		</td>
    	</tr>    	
     	<tr>
    		<td align = "center">주소</td>
    		<td ><input type = "text" size = 50 name = "address1"/></td>
    	</tr>
    	<tr>
    		<td align = "center">상세 주소 </td>
    		<td><input type = "text" name = "address2"/></td>
    	</tr>
    	<tr>
    		<td align = "center">프로필</td>
    		<td>
    			 <input type="file" name="img"/> <br />
				<input type="submit" value="등록" /> <br />
    		</td>
    	</tr>
    	<tr>
    		<td colspan = "2" align = "center">
    		<input type = "submit" value = "확인" />
    		<input type = "button" value = "취소" onclick="window.location='main.jsp'"/>
    		</td>
    	</tr>    	   	   	
    	    		
    </table>
</form>