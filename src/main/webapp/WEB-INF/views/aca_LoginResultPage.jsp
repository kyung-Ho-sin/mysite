<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="login_bootstrap/vendor/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
	
	<%
		String login_session = (String)request.getAttribute("conn_se");
		System.out.println("login_session : "+ login_session);
		
		if(login_session != null){
	%>		
		${msg }
		<form action="aca_Logout" method="POST">
		<button id ="logout">로그아웃</button>
		</form>
	<%	
		}else{
	%>		
		아이디가 로그아웃되어있습니다. 다시 로그인해주세요.
		<form action="aca_LoginPage" method="POST">
		<button id ="Login">로그인하러가기</button>
		</form>	
	<%
		}
	%>
	<script>
		$('#logout').on('click', function(){
			alert("로그아웃되었습니다.")
			})
	</script>
</body>
</html>