<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH</title>
<script src="login_bootstrap/vendor/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
	
	<div><h1> KH 회원가입 </h1></div>

	<form action="aca_membershipJoinPage_form" method="post">
	ID : <input type= "text" placeholder="ID를 입력하세요" name = "ac_id" autofocus>
	<button type="button" id="id_check">중복체크</button>
	<br>
	PW : <input type= "password" placeholder="비밀번호를 입력하세요" name = "ac_pw"><br>
	<div id="pswd_checkMentbox" display=none></div>
	PW재확인  : <input type= "password" placeholder="비밀번호를 입력하세요" name = "ac_pw2"><br>
	<div id="pswd_checkMentbox2" display=none></div>
	E-mail : <input type= "text" placeholder="이메일을 입력하세요" name = "ac_el"> @
			 <select name = "ac_emlist">
			 	<option value="">이메일선택</option>
			 	<option value="naver.com">naver.com</option>
			 	<option value="daum.net">daum.net</option>
			 	<option value="yahoo.com">google.com</option>
			 	<option value="nate.com">nate.com</option>
			 </select>
	<button type="button" id="email_send">인증번호 받기</button><br>
	<div id=email_box style="display: none">
	인증번호:<input id="certification_email"> <button type="button" id="email_check">인증</button>
	</div>
	<div> 
	<input type="submit" value="회원가입">
	</div>
	</form>
	
	<script>
	
		var email_send = document.getElementById("email_box");
		
		email_send.style.display = "none";
		
		//아이디 중복체크 AJAX	
		$('#id_check').on('click', function(){
			var id = document.getElementsByName("ac_id")[0].value;
			console.log(id);
			
			var form = {
				id : id	
			}
			$.ajax({
	            url: "aca_Loginid_check.p",
	            type: "POST",
	            data: form,
	            success: function(data){
	            	console.log(data);
	            	if(data === 0){
	                alert("사용가능한 아이디입니다.");
	            	}else{
	            		alert("이미 사용중인아이디입니다.")
	            		$('input[name=ac_id]').val('');
	            		$('input[name=ac_id]').focus();
	            	}
	            },
	            error: function(){
	                alert("id_check err");
	            }
			});
		});
		
		//이메일 전송 AJAX
		$('#email_send').on('click', function(){
			
			var email_box = document.getElementById("email_box");
			email_box.style.display = "block";
			
			var first_email = document.getElementsByName("ac_el")[0].value;
			
			var second_email = $("select[name=ac_emlist]").val();
			//console.log("second_email : " + second_email);
			
			var email = first_email + '@' + second_email;
			console.log("email : " + email);
			
			$.ajax({
				url: "aca_emailsend.p",
				type: "POST",
				data: email,
				contentType : "application/json; charset=utf-8",
				success: function(){
					alert("인증메일이 발송되었습니다.");    	
	            },
	            error: function(){
	                alert("email err");
	            }
			});
		});
		//이메일 인증 AJAX
		$('#email_check').on('click', function(){
			var Auth = $('#certification_email').val();
			$.ajax({
				url: "aca_emailAuthentication.p",
				type: "POST",
				data: Auth,
				contentType : "application/json; charset=utf-8",
				success: function(data){
					if(data === 1){
						alert("인증되었습니다.");    	
					}else{
						alert("인증번호가 같지 않습니다.");
						$('#certification_email').val('');
						$('#certification_email').focus();
					}
	            },
	            error: function(){
	                alert("Auth err");
	            }
			})
		})
		
		var pswd_box = document.getElementById("pswd_checkMentbox");
		var pswd_box2 = document.getElementById("pswd_checkMentbox2");
		$("input[name=ac_pw]").blur(function(){
			var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

			var pw = $("input[name=ac_pw]").val();

			if(false === reg.test(pw)) {
				if(pswd_box.style.display === "none"){
					pswd_box.style.display = "block";
					$('#pswd_checkMentbox').text('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
				}else{
					$('#pswd_checkMentbox').text('');
					$('#pswd_checkMentbox').text('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
				}
			}else {
				pswd_box.style.display ="none"; 
			}
		}).keyup(function(event){	
			
		}).keypress(function(event){	//capslock event 처리
	    	var keyCode = 0;
	        var shiftKey = false;
	        keyCode = event.keyCode;
	        shiftKey = event.shiftKey;
	        if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
	            || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
	            if(pswd_box.style.display === "none"){
	            	pswd_box.style.display = "block";
	            	$('#pswd_checkMentbox').text("capsLock이 눌려있습니다.");
	            }else{
	            	$('#pswd_checkMentbox').text('');
					$('#pswd_checkMentbox').text("capsLock이 눌려있습니다.");
	            }    	
	        } else {
	        	pswd_box.style.display ="none"; 
	        }
		});
		
		$("input[name=ac_pw2]").blur(function(){
			var pswd1 = $('input[name=ac_pw]');
			var pswd2 = $('input[name=ac_pw2]');
			
			console.log(pswd1.val());
			console.log(pswd2.val());
			
			if(pswd1.val() == pswd2.val()){
				if(pswd_box2.style.display === "none"){
					pswd_box2.style.display = "block";
					$('#pswd_checkMentbox2').text("비밀번호가 일치합니다.");
				}else{
					$('#pswd_checkMentbox2').text("");
					$('#pswd_checkMentbox2').text("비밀번호가 일치합니다.");
				}
			}else{
				if(pswd_box2.style.display === "none"){
					pswd_box2.style.display = "block";
					$('#pswd_checkMentbox2').text("비밀번호가 일치하지 않습니다.")
				}else{
					$('#pswd_checkMentbox2').text("");
					$('#pswd_checkMentbox2').text("비밀번호가 일치하지 않습니다.")
				}
			}
		});
	</script>
</body>
</html>