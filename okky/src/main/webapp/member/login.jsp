<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
	.login {
		width: 700px;
 		margin: 0 auto;
 		text-align: center; 
		
	}
	.label {
		width: 300px;
		text-align: left;
		margin: 0 auto;
		margin-bottom: 10px;
	}
	input[type="text"] {
		width: 300px;
		height: 30px;
		box-sizing: border-box;
		margin-bottom: 10px;
	}
	#btn_login {
		width: 300px;
		height: 50px;
		font-size: 24px;
		font-weight: bold;
		margin: 30px 0px;
	}
</style>
</head>
<body>
	<div id="loginHeader" class="login">
		<div>
			<div>
				<img alt="로고" src="">
			</div>
			<div><h2>OKKY에 오신 것을 환영합니다.</h2></div>
		</div>
		<hr>
	</div>
	
	<div id="loginMain" class="login">
		<h2>로그인</h2>
		<form id="frmLogin" action="">
			<div id="id" class="label">아이디</div>
			<div class="inputLogin">
				<input type="text" name="memberId" id="memberId" value="" />
			</div>
			<div id="pwd" class="label">비밀번호</div>
			<div class="inputLogin">
				<input type="text" name="pwd" id="pwd" value="" />
			</div>
			<div>
				<input type="submit" name="btn_login" id="btn_login" value="로그인" />
			</div>
		</form>
		
		<div id="regist">
			<span>아직 회원이 아니신가요?</span>
			<a href="./regist.jsp">회원가입</a>		
		</div>
	</div>
	
	
</body>
</html>