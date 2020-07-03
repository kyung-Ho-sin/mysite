<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>stevelee login</title>
</head>
<body>

<%

String loginok = (String)request.getSession().getAttribute("loginok");
%>

<table border = 1>

<form action="loginchk">

<%
if(loginok != null){
   if("ok".equals(loginok)){
%>
   <tr>
      <td>로그인중 </td>
      <td><input type="submit" value="로그아웃 "></td>
   </tr>
<%
   }else{
%>
   <tr>
      <td>id</td>
      <td><input type="text" name="id"></td>
   </tr>
   <tr>
      <td>pw</td>
      <td><input type="text" name="pw"></td>
   </tr>
   <tr>
      <td>로그인실행</td>
      <td><input type="submit" value="로그인"></td>
   </tr>
<%
   }
}else{
%>
   <tr>
      <td>id</td>
      <td><input type="text" name="id"></td>
   </tr>
   <tr>
      <td>pw</td>
      <td><input type="text" name="pw"></td>
   </tr>
   <tr>
      <td>로그인실행</td>
      <td><input type="submit" value="로그인"></td>
   </tr>
<%

}
%>

</form>
</table>

</body>
</html>