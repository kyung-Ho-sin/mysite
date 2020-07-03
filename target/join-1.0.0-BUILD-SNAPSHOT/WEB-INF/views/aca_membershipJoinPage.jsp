<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH</title>
</head>
<body>
	
	<div><h1> KH 회원가입 </h1></div>

	<form action="aca_membershipJoinPage_form" method="post">
	ID : <input type= "text" placeholder="ID를 입력하세요" name = "ac_id"><br>
	PW : <input type= "password" placeholder="PW를 입력하세요" name = "ac_pw"><br>
	<!--  
	E-mail : <input type= "text" placeholder="이메일을 입력하세요" name = "ac_el"> @
			 <select name = "ac_emlist">
			 	<option value="">이메일선택</option>
			 	<option value="naver.com">naver.com</option>
			 	<option value="daum.net">daum.net</option>
			 	<option value="yahoo.com">yahoo.com</option>
			 	<option value="nate.com">nate.com</option>
			 </select>
	-->
	<input type="submit" value="전송">
	</form> 
</body>
</html>