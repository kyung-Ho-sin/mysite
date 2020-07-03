<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>KH</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="login_bootstrap/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="login_bootstrap/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login_bootstrap/vendor/bootstrap/css/bootstrap.min.css">
<!-- =============================================================================================== -->
	<link rel="stylesheet" type="text/css" href="login_bootstrap/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login_bootstrap/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<!-- <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css"> -->
<!--===============================================================================================-->	
	<!-- <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css"> -->
<!--===============================================================================================-->
	<!-- <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css"> -->
<!--===============================================================================================-->
	<!-- <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css"> -->
<!--===============================================================================================-->	
	<!-- <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css"> -->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login_bootstrap/css/util.css">
	<link rel="stylesheet" type="text/css" href="login_bootstrap/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				<form class="login100-form validate-form" action="" id="nameform">
					<span class="login100-form-title p-b-33">
					
						<h1>KH 로그인</h1>
					</span>
						<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
							<input class="input100" type="text" name="kh_id" placeholder="ID" >
							<span class="focus-input100-1"></span>
							<span class="focus-input100-2"></span>
						</div>
	
						<div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
							<input class="input100" type="password" name="kh_pw" placeholder="Password" id="test">
							<span class="focus-input100-1"></span>
							<span class="focus-input100-2"></span>
						</div>
						
						<div id="result"></div>
						
						<div class="container-login100-form-btn m-t-20">
							<button class="login100-form-btn" id="ajax"> <!-- form="nameform" -->
								로그인
							</button>
						</div>
					
					<div class="text-center p-t-45 p-b-4">
						
						<a href="login" class="txt2 hov1">
							아이디 / 비번 찾기
						</a>
					</div>

					<div class="text-center">

						<a href="aca_membershipJoinPage" class="txt2 hov1">
							회원가입
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
					 	<!-- 	
						. = class , # = id
						-->
	<%
		
	%>
	<script>

		$('#ajax').on('click', function(){
			var id = document.getElementsByName("kh_id")[0].value;
			var pw = document.getElementsByName("kh_pw")[0].value;
			var form = {
				id : id,
				pw : pw
			}
			$.ajax({
				url : "aca_LoginPage_form.p",
				type :"POST",
				contentType : "application/json; charset=utf-8", 
				data: JSON.stringify(form),
				success : function(data){
					var page = data.success;
					console.log(page);
					if(page == null){
						$('#result').text(data);
					}else{
						window.location.href = page;	
					}
	            },
	            error:function(request,status,error){
	    		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    		}
			});
			return false;
		});
	</script>
	
<!--===============================================================================================-->
	<script src="login_bootstrap/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="login_bootstrap/vendor/bootstrap/js/popper.js"></script>
	<script src="login_bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="login_bootstrap/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="login_bootstrap/vendor/daterangepicker/moment.min.js"></script>
	<script src="login_bootstrap/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="login_bootstrap/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<!--  <script src="login_bootstrap/js/main.js"></script> -->

</body>
</html>