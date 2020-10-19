<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

</style>



<form>
	<div class ="container">
		<h1>회원가입</h1>
		<p>계정을 만들려면 양식에 따라 작성해주세요.</p>
		<hr>
		
		<label for ="id"><b>아이디</b></label>
		<input type ="text" name = "id" required>
		
		<label for ="pw"><b>비밀번호</b></label>
		<input type ="password" name ="pw" required>
		
		<label for ="pw-check"><b>비밀번호 확인</b></label>
		<input type ="password" name ="pw-check" required>
		
		<label for ="name"><b>이름</b></label>
		<input type ="text" name = "name" required>
		
		<label for ="gender"><b>성별</b></label>
		 남<input type = "radio" name = "gender" value = "남"/> 
    	여<input type = "radio" name = "gender" value = "여"/>
		
		<label for ="nickname"><b>닉네임</b></label>
		<input type ="text" name = "nickname" required>
		
		<label for ="phone"><b>핸드폰 번호</b></label>
		<input type ="text" name ="phone" required>
		
		<label for ="email1"><b>이메일</b></label>
		<input type ="text" name ="email1" required>
		<select name = "email2">
    		<option value="naver.com" selected>naver.com</option>
    		<option value="hanmail.net">hanmail.net</option>
    		<option value="gmail.com">gmail.com</option>
    	</select>
    	
    	<label for ="address1"><b>주소</b></label>
		<input type ="text" name ="address1" required>
		<label for ="address2"><b>상세주소</b></label>
		<input type ="text" name ="address2" required>
    	
    	<label for ="profile"><b>프로필사진</b></label>
    	
		<label>
		<input type = "checkbox" name ="auto-login">
		 자동 로그인
		</label>
		
		<p>계정을 생성함으로써 저희의 <a href="#" style="color:dodgerblue">약관 및 개인정보 보호 정책</a>에 동의하는 것입니다.</p>
		
		<div class ="clearfix">
			<button type="button" class="cancelbt">취소</button>
			<button type="submit" class="signupbt">회원가입</button>
		</div>
	</div>
</form>