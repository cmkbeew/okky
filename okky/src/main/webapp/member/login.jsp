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
 		margin: 30px auto;
 		text-align: center; 
	}
	h2 {
		margin-bottom: 20px;
	}
	.label {
		width: 300px;
		text-align: left;
		margin: 0 auto;
		margin-bottom: 10px;
	}
	input[type="text"], input[type="password"]{
		width: 300px;
		height: 30px;
		box-sizing: border-box;
		margin-bottom: 10px;
	}
	.warning {
		width: 300px;
		margin: 0 auto;
		margin-bottom: 10px;
		color: red;
		text-align: left;
		font-size: 20px;
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
	<jsp:include page="/common/header.jsp" />
	<div id="loginHeader" class="login">
		<div>
			<div>
				<a href="../main.jsp"><img alt="로고" src="https://okky.kr/okky-munchkin-logo.svg" width="300"></a>
			</div>
			<div><h2>OKKY에 오신 것을 환영합니다.</h2></div>
		</div>
		<hr>
	</div>
	
	<div id="loginMain" class="login">
		<h2>로그인</h2>
		<form name="frmLogin" id="frmLogin" action="">
			<div id="memberIdLabel" class="label">아이디</div>
			<div class="inputLogin">
				<input type="text" name="memberId" id="memberId" value="" placeholder="아이디 4~15자 이내"/>
			</div>
			<div id="warn-memberId" class="warning"></div>
			
			<div id="pwdLabel" class="label">비밀번호</div>
			<div class="inputLogin">
				<input type="password" name="pwd" id="pwd" value="" placeholder="영문+숫자+특수문자 포함 6~20자 이내"/>
			</div>
			<div id="warn-pwd" class="warning"></div>
			
			<div>
				<input type="submit" id="btn_login" value="로그인" />
			</div>
		</form>
		
		<div id="regist">
			<span>아직 회원이 아니신가요?</span>
			<a href="./regist.jsp">회원가입</a>		
		</div>
	</div>
	
	<script>
		document.querySelector("#frmLogin").addEventListener("submit", function(e) {
			e.preventDefault();
			
			const memberId = document.querySelector("#memberId");
			const pwd = document.querySelector("#pwd");
			
			// 아이디, 비밀번호 미입력 시 오류 메세지
			const warnMemberId = document.querySelector("#warn-memberId");
			const warnPwd = document.querySelector("#warn-pwd");
			
			if(memberId.value.trim().length == 0 && pwd.value.length == 0) {
				warnMemberId.style.display = "";
				warnMemberId.innerText = "아이디를 입력하세요.";
				warnPwd.style.display = "";
				warnPwd.innerText = "비밀번호를 입력하세요.";
				
				memberId.focus();
				e.preventDefault();
				
				return false;
			} else if(memberId.value.trim().length == 0 && pwd.value.length != 0) { // 아이디 미입력
				warnMemberId.style.display = "";
				warnMemberId.innerText = "아이디를 입력하세요.";
				warnPwd.style.display = "none";
				
				return false;
			} else if(memberId.value.trim().length != 0 && pwd.value.trim().length == 0) { // 비밀번호 미입력
				warnMemberId.style.display = "none";
				warnPwd.style.display = "";
				warnPwd.innerText = "비밀번호를 입력하세요.";
				
				return false;
			} else {
				const frm = document.querySelector("#frmLogin");
				
				frm.submit();
			}			
		}, false);
	</script>
</body>
</html>