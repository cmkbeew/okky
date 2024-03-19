<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<style>
	.regist {
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
	input[type="text"], input[type="password"] {
		width: 300px;
		height: 30px;
		box-sizing: border-box;
		margin-bottom: 10px;
	}
	#btn_regist {
		width: 300px;
		height: 50px;
		font-size: 24px;
		font-weight: bold;
		margin: 30px 0px;
	}
</style>
</head>
<body>
	<div id="registHeader" class="regist">
		<div>
			<div>
				<a href="./login.jsp"><img alt="로고" src=""></a>
			</div>
			<div><h2>OKKY에 오신 것을 환영합니다.</h2></div>
		</div>
		<hr>
	</div>
	
	<div id="registMain" class="regist">
		<h2>로그인</h2>
		<form id="frmRegist" action="">
			<div id="id" class="label">아이디</div>
			<div class="inputRegist">
				<input type="text" name="memberId" id="memberId" value="" />
<!-- 				<input type="checkbox" /> -->
			</div>
			<div id="pwd" class="label">비밀번호</div>
			<div class="inputRegist">
				<input type="password" name="pwd" id="pwd" value="" />
			</div>
			<div id="email" class="label">이메일</div>
			<div class="inputRegist">
				<input type="text" name="email" id="email" value="" />
			</div>
			<div id="name" class="label">실명</div>
			<div class="inputRegist">
				<input type="text" name="name" id="name" value="" />
			</div>
			<div id="nickname" class="label">닉네임</div>
			<div class="inputRegist">
				<input type="text" name="nickname" id="nickname" value="" />
			</div>
			<div>
				<input type="radio" name="type" id="type_1" /> 일반 회원
				<input type="radio" name="type" id="type_2" /> 기업 회원
			</div>
			
			<div id="companyInput" style="display: none">
				<div id="companyName" class="label">회사명</div>
				<div class="inputRegist">
					<input type="text" name="companyName" id="companyName" value="" />
				</div>
				<div id="compayNumber" class="label">사업자등록번호</div>
				<div class="inputRegist">
					<input type="text" name="compayNumber" id="compayNumber" value="" />
				</div>
				<div id="companyFile" class="label">사업자 등록증 파일</div>
				<div class="inputRegist">
					<input type="text" name="companyFile" id="companyFile" value="" />
				</div>
				<div id="managerName" class="label">담당자 이름</div>
				<div class="inputRegist">
					<input type="text" name="managerName" id="managerName" value="" />
				</div>
				<div id="managerPhone" class="label">담당자 연락처</div>
				<div class="inputRegist">
					<input type="text" name="managerPhone" id="managerPhone" value="" />
				</div>
			</div>
			
			<div>
				<input type="submit" name="btn_regist" id="btn_regist" value="회원가입" />
			</div>
		</form>
	</div>
	
	<script>
		document.querySelector("#type_1").addEventListener("click", function(e) {
			document.querySelector("#companyInput").style.display = "none";
		}, false);
		
		document.querySelector("#type_2").addEventListener("click", function(e) {
			document.querySelector("#companyInput").style.display = "";
		}, false);
	</script>
</body>
</html>