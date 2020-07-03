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
	<!--   
	<form id="form_data">
	
	<div>
	ID : <input type= "text" placeholder="ID를 입력하세요" name = "id"><br>
	PW : <input type= "password" placeholder="PW를 입력하세요" name = "pw"><br>
	 -->
	<div id="result"></div>
	
	<input type="submit" value="전송" id="ajax">
	<!-- 
	</div>
	
	</form>
	-->
	 
	
	
	<script>
		$('#ajax').on('click', function(){

			var id = document.getElementsByName("id")[0].value;
			var pw = document.getElementsByName("pw")[0].value;
		
			var form = {
				id : "shin021",
				pw : "123123"
			}
			
			$.ajax({
				url : "aca_LoginPage_form2",
				type :"POST",
				contentType : "aaplication/json; charset=utf-8;",
				data: JSON.stringify(form),
				success : function(data){
					var x = data.id + data.pw;
	                $('#result').text(x);
	            },
	            error: function(){
	                alert("simpleWithObject err");
	            }
			});
			return false;
		});
	
	
	</script>
	
</body>
</html>