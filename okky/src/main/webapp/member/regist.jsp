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
	input {
		outline: none;
	}
	input[type="text"], input[type="password"], input[type="file"] {
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
	<jsp:include page="/common/header.jsp" />
	<div id="registHeader" class="regist">
		<div>
			<div>
				<a href="./login.jsp"><img alt="로고" src="https://okky.kr/okky-munchkin-logo.svg" width="300"></a>
			</div>
			<div><h2>OKKY에 오신 것을 환영합니다.</h2></div>
		</div>
		<hr>
	</div>
	
	<div id="registMain" class="regist">
		<h2>회원가입</h2>
		<form name="frmRegist" id="frmRegist" action="" enctype="multipart/form-data">
			<div id="memberIdLabel" class="label">아이디</div>
			<div class="inputRegist">
				<input type="text" name="memberId" id="memberId" value="" placeholder="아이디 4~15자 이내" />
			</div>
			<div id="pwdLabel" class="label">비밀번호</div>
			<div class="inputRegist">
				<input type="password" name="pwd" id="pwd" value="" placeholder="영문+숫자+특수문자 포함 6~20자 이내" />
			</div>
			<div id="emailLabel" class="label">이메일</div>
			<div class="inputRegist">
				<input type="text" name="email" id="email" value="" placeholder="이메일" />
			</div>
			<div id="nameLabel" class="label">이름</div>
			<div class="inputRegist">
				<input type="text" name="name" id="name" value="" placeholder="이름"/>
			</div>
			<div id="nicknameLabel" class="label">닉네임</div>
			<div class="inputRegist">
				<input type="text" name="nickname" id="nickname" value="" placeholder="닉네임"/>
			</div>
			<div>
				<input type="radio" name="type" id="type_1" /> 일반 회원
				<input type="radio" name="type" id="type_2" /> 기업 회원
			</div>
			
			<div id="companyInput" style="display: none">
				<div id="companyNameLabel" class="label">회사명</div>
				<div class="inputRegist">
					<input type="text" name="companyName" id="companyName" value="" />
				</div>
				<div id="compayNumberLabel" class="label">사업자등록번호</div>
				<div class="inputRegist">
					<input type="text" name="compayNumber" id="compayNumber" value="" />
				</div>
				<div id="companyFileLabel" class="label">사업자 등록증 파일</div>
				<div class="inputRegist">
					<input type="file" name="companyFile" id="companyFile" value="" />
				</div>
				<div id="managerNameLabel" class="label">담당자 이름</div>
				<div class="inputRegist">
					<input type="text" name="managerName" id="managerName" value="" />
				</div>
				<div id="managerPhoneLabel" class="label">담당자 연락처</div>
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
		const memberId = document.querySelector("#memberId");
		const pwd = document.querySelector("#pwd");
		const email = document.querySelector("#email");
		const name = document.querySelector("#name");
		const nickname = document.querySelector("#nickname");
		const companyName = document.querySelector("#companyName");
		const compayNumber = document.querySelector("#compayNumber");
		const companyFile = document.querySelector("#companyFile");
		const managerName = document.querySelector("#managerName");
		const managerPhone = document.querySelector("#managerPhone");
		
		const engChars = "abcdefghijklmnopqrstuvwxyz";
		const EngChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		const numChars = "0123456789";
		const specialChars = "`~!@#$%^&*()-=_+,<.>/?;':\"\"'{}[]";
		const emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
		
		function combi_check(inputValue, chars) {
			let cnt = 0;
			for(let i=0; i<inputValue.length; i++) {
				if(chars.indexOf(inputValue.charAt(i)) != -1) {
					cnt += 1;
				}
			}
			
			return cnt;
		}
		
		// 아이디 체크 이벤트
		memberId.addEventListener("keyup", function(e) {
			// 특수문자 입력 시 지워짐
			if(combi_check(memberId.value, specialChars) > 0) {
				memberId.value = memberId.value.substring(0, memberId.value.length - 1);
			}else {
				// 4~15자 이내 => input 배경색 변경
				if(memberId.value.length >= 4 && memberId.value.length <= 15) {
					// 영문 + 숫자
					if((combi_check(memberId.value, engChars) > 0 || combi_check(memberId.value, EngChars) > 0) 
							&& combi_check(memberId.value, numChars) > 0) {
						memberId.style.border = "3px solid lightgreen";
					} else {
						memberId.style.border = "1px solid red";
					}
				} else if(memberId.value.length == 0) {
					memberId.style.border = "";
				} else {
					memberId.style.border = "1px solid red";
				}
			}
		}, false);
		
		// 비밀번호 체크 이벤트
		pwd.addEventListener("keyup", function(e) {
			// 6~20자 이내 => input 배경색 변경
			if(pwd.value.length >= 6 && pwd.value.length <= 20) {
				// 영문 + 숫자 + 특수문자
				if((combi_check(pwd.value, engChars) > 0 || combi_check(pwd.value, EngChars) > 0) 
						&& combi_check(pwd.value, numChars) > 0 
						&& combi_check(pwd.value, specialChars) > 0) {
					pwd.style.border = "3px solid lightgreen";
				} else {
					pwd.style.border = "1px solid red";
				}
			} else if(pwd.value.length == 0) {
				pwd.style.border = "";
			} else {
				pwd.style.border = "1px solid red";
			}
		}, false);
		
		// 이메일 체크 이벤트
		email.addEventListener("keyup", function(e) {
			// 이메일 형식(@, .) 확인
		    if(emailCheck.test(email.value) === true) {
		    	email.style.border = "3px solid lightgreen";
		    } else {
		    	if(email.value.length == 0) {
					email.style.border = "";
				} else {
					email.style.border = "1px solid red";					
				}
		    }
		}, false);
		
		// 이름 체크 이벤트
		name.addEventListener("keyup", function(e) {
			// 30자 이내
			if(name.value.length >= 2 && name.value.length <= 30) {
				name.style.border = "3px solid lightgreen";
			} else if(name.value.length == 0) {
				name.style.border = "";
			} else {
				name.style.border = "1px solid red";
			}
		}, false);
		
		// 닉네임 체크 이벤트
		nickname.addEventListener("keyup", function(e) {
			// 특수문자 입력 시 지워짐
			if(combi_check(nickname.value, specialChars) > 0) {
				nickname.value = nickname.value.substring(0, nickname.value.length - 1);
			}else {
				// 2~20자 이내 => input 배경색 변경
				if(nickname.value.length >= 2 && nickname.value.length <= 20) {
					// 영문 + 숫자
					if((combi_check(nickname.value, engChars) > 0 || combi_check(nickname.value, EngChars) > 0) 
							&& combi_check(nickname.value, numChars) > 0) {
						nickname.style.border = "3px solid lightgreen";
					} else {
						nickname.style.border = "1px solid red";
					}
				} else if(nickname.value.length == 0) {
					nickname.style.border = "";
				} else {
					nickname.style.border = "1px solid red";
				}
			}
		}, false);
		
		
		document.querySelector("#type_1").addEventListener("click", function(e) {
			document.querySelector("#companyInput").style.display = "none";
		}, false);
		
		document.querySelector("#type_2").addEventListener("click", function(e) {
			document.querySelector("#companyInput").style.display = "";
		}, false);
	</script>
</body>
</html>