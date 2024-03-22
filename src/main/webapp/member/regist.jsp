<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
	input:not([type="radio"]) {
		outline: none;
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
				<a href="./login.do"><img alt="로고" src="https://okky.kr/okky-munchkin-logo.svg" width="300"></a>
			</div>
			<div><h2>OKKY에 오신 것을 환영합니다.</h2></div>
		</div>
		<hr>
	</div>
	
	<div id="registMain" class="regist">
		<h2>회원가입</h2>
		<c:if test="${not empty registErrMsg}">
			<span style="color: red; font-size: 20px; font-weight: bold;">${registErrMsg}</span>
		</c:if>
		<c:if test="${not empty uploadFileError}">
			<span style="color: red; font-size: 20px; font-weight: bold;">${uploadFileError}</span>
		</c:if>
		
		<form name="frmRegist" id="frmRegist" action="./regist.do" method="post">
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
				<input type="text" name="name" id="name" value="" placeholder="이름 2~30자 이내"/>
			</div>
			<div id="nicknameLabel" class="label">닉네임</div>
			<div class="inputRegist">
				<input type="text" name="nickname" id="nickname" value="" placeholder="닉네임 2~20자 이내"/>
			</div>
			<div>
				<input type="radio" name="type" id="type_1" value="1" checked /> 일반 회원
				<input type="radio" name="type" id="type_2" value="2"/> 기업 회원
			</div>
			
			<div id="companyInput" style="display: none">
				<div id="companyNameLabel" class="label">회사명</div>
				<div class="inputRegist">
					<input type="text" name="companyName" id="companyName" value="" placeholder="회사명 2~30자 이내"/>
				</div>
				<div id="compayNumberLabel" class="label">사업자등록번호</div>
				<div class="inputRegist">
					<input type="text" name="companyNumber" id="companyNumber" value="" maxlength="10" placeholder="사업자등록번호('-' 제외 10자리)" />
				</div>
				<div id="companyFileLabel" class="label">사업자 등록증 파일</div>
				<div class="inputRegist">
					<input type="file" name="file" id="companyFile" value="" />
				</div>
				<div id="managerNameLabel" class="label">담당자 이름</div>
				<div class="inputRegist">
					<input type="text" name="managerName" id="managerName" value="" placeholder="담당자 이름 2~30자 이내" />
				</div>
				<div id="managerPhoneLabel" class="label">담당자 연락처</div>
				<div class="inputRegist">
					<input type="text" name="managerPhone" id="managerPhone" value="" maxlength="11" placeholder="담당자 연락처('-'제외 11자리)" />
				</div>
			</div>
			
			<div>
				<input type="submit" name="btn_regist" id="btn_regist" value="회원가입" disabled/>
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
		const companyNumber = document.querySelector("#companyNumber");
		const companyFile = document.querySelector("#companyFile");
		const managerName = document.querySelector("#managerName");
		const managerPhone = document.querySelector("#managerPhone");
		
		const engChars = "abcdefghijklmnopqrstuvwxyz";
		const EngChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		const numChars = "0123456789";
		const specialChars = "`~!@#$%^&*()-=_+,<.>/?;':\"\"'{}[]";
		const emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
		const korCheck = /[^-0-9]/g;
		
		function combi_check(inputValue, chars) {
			let cnt = 0;
			for(let i=0; i<inputValue.length; i++) {
				if(chars.indexOf(inputValue.charAt(i)) != -1) {
					cnt += 1;
				}
			}
			
			return cnt;
		}
		
		function validate_check(inputValue, min, max, type) {
			if(type == 1) { // 영문 + 숫자 + 특수문자 
				if(inputValue.value.length >= min && inputValue.value.length <= max) {
					// 영문 + 숫자 + 특수문자
					if((combi_check(inputValue.value, engChars) > 0 || combi_check(inputValue.value, EngChars) > 0) 
							&& combi_check(inputValue.value, numChars) > 0 
							&& combi_check(inputValue.value, specialChars) > 0) {
						inputValue.style.border = "3px solid lightgreen";
					} else {
						inputValue.style.border = "1px solid red";
					}
				} else if(inputValue.value.length == 0) {
					inputValue.style.border = "";
				} else {
					inputValue.style.border = "1px solid red";
				}
			} else if(type == 2) { // 특수문자 x, 영문 + 숫자
				if(combi_check(inputValue.value, specialChars) > 0) {
					inputValue.value = inputValue.value.substring(0, inputValue.value.length - 1);
				}else {
					// 4~15자 이내 => input 배경색 변경
					if(inputValue.value.length >= min && inputValue.value.length <= max) {
						// 영문 + 숫자
						if((combi_check(inputValue.value, engChars) > 0 || combi_check(inputValue.value, EngChars) > 0) 
								&& combi_check(inputValue.value, numChars) > 0) {
							inputValue.style.border = "3px solid lightgreen";
						} else {
							inputValue.style.border = "1px solid red";
						}
					} else if(inputValue.value.length == 0) {
						inputValue.style.border = "";
					} else {
						inputValue.style.border = "1px solid red";
					}
				}
			} else if(type == 3) { // 특수문자 x, 글자 수 제한
				// 특수문자 입력 시 지워짐
				if(combi_check(inputValue.value, specialChars) > 0) {
					inputValue.value = inputValue.value.substring(0, inputValue.value.length - 1);
				}else {
					// 2~20자 이내 => input 배경색 변경
					if(inputValue.value.length >= min && inputValue.value.length <= max) {
						inputValue.style.border = "3px solid lightgreen";
					} else if(inputValue.value.length == 0) {
						inputValue.style.border = "";
					} else {
						inputValue.style.border = "1px solid red";
					}
				}
			} else if(type == 4) { // 숫자만
				if(combi_check(inputValue.value, specialChars) > 0 
						|| combi_check(inputValue.value, engChars) > 0 
						|| combi_check(inputValue.value, EngChars) > 0
						|| korCheck.test(inputValue.value)
						) {
					inputValue.value = inputValue.value.replace(korCheck, "");
					for(let i=0; i<inputValue.value.length; i++) {
						inputValue.value = inputValue.value.charAt(i).replace(korCheck, "");
					}
					
				}else {
					if(inputValue.value.length >= min && inputValue.value.length <= max) {
						inputValue.style.border = "3px solid lightgreen";
					} else if(inputValue.value.length == 0) {
						inputValue.style.border = "";
					} else {
						inputValue.style.border = "1px solid red";
					}
				}
			}
		}
		
		// 아이디 체크 이벤트
		memberId.addEventListener("keyup", function(e) {
				validate_check(memberId, 4, 15, 2);
				activeBtn();
		}, false);
		
		// 비밀번호 체크 이벤트
		pwd.addEventListener("keyup", function(e) {
			validate_check(pwd, 6, 20, 1);
			activeBtn();
		}, false);
		
		// 이메일 체크 이벤트
		email.addEventListener("keyup", function(e) {
			// 이메일 형식(@, .) 확인
		    if(emailCheck.test(email.value) === true) {
		    	email.style.border = "3px solid lightgreen";
		    	activeBtn();
		    } else {
		    	if(email.value.length == 0) {
					email.style.border = "";
					activeBtn();
				} else {
					email.style.border = "1px solid red";
					activeBtn();
				}
		    }
		}, false);
		
		// 이름 체크 이벤트
		name.addEventListener("keyup", function(e) {
			validate_check(name, 2, 30, 3);
			activeBtn();
		}, false);
		
		// 닉네임 체크 이벤트
		nickname.addEventListener("keyup", function(e) {
			validate_check(nickname, 2, 20, 3);
			activeBtn();
		}, false);
		
		// 회사명 체크 이벤트
		companyName.addEventListener("keyup", function(e) {
			validate_check(companyName, 2, 30, 3);
			activeBtn();
		}, false);
		
		// 사업자등록번호 체크 이벤트
		companyNumber.addEventListener("keyup", function(e) {
			validate_check(companyNumber, 1, 10, 4);
			activeBtn();
		}, false);
		
		// 담당자이름 체크 이벤트
		managerName.addEventListener("keyup", function(e) {
			validate_check(managerName, 2, 30, 3);
			activeBtn();
		}, false);
		
		// 담당자 연락처 체크 이벤트
		managerPhone.addEventListener("keyup", function(e) {
			validate_check(managerPhone, 1, 11, 4);
			activeBtn();
		}, false);
		
		document.querySelector("#type_1").addEventListener("click", function(e) {
			document.querySelector("#frmRegist").setAttribute("enctype", "");
			document.querySelector("#companyInput").style.display = "none";
			document.querySelector("#btn_regist").disabled = false;
		}, false);
		
		document.querySelector("#type_2").addEventListener("click", function(e) {
			document.querySelector("#frmRegist").setAttribute("enctype", "multipart/form-data");
			document.querySelector("#companyInput").style.display = "";
			document.querySelector("#btn_regist").disabled = true;
		}, false);
		
		// 폼 전송
		function activeBtn() {
			let type = document.querySelector('input[name = "type"]:checked');
			
			let color = [memberId.style.borderColor, pwd.style.borderColor, email.style.borderColor, name.style.borderColor, nickname.style.borderColor];
			
			let result = 0;
			
			if(type.value == 1) {
				for(let i=0; i<color.length; i++) {
					if(color[i] == "lightgreen") {
						result += 1;
					}
				}
				if(color.length == result) {
					document.querySelector("#btn_regist").disabled = false;
				} else {
					document.querySelector("#btn_regist").disabled = true;
				}
			} else {
				color.push(companyName.style.borderColor);
				color.push(companyNumber.style.borderColor);
				color.push(managerName.style.borderColor);
				color.push(managerPhone.style.borderColor);
				
				for(let i=0; i<color.length; i++) {
					if(color[i] == "lightgreen") {
						result += 1;
					}
				}
				if(color.length == result) {
					document.querySelector("#btn_regist").disabled = false;
				} else {
					document.querySelector("#btn_regist").disabled = true;
				}
			}
		}
	</script>
</body>
</html>