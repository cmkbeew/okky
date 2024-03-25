<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <style>
        * {
            margin :0;
            padding: 0;
            list-style: none;
            text-decoration: none;
            box-sizing: border-box;
        }
        #container {
            margin: 0 auto;
            width: 1200px;
            height: 800px;
        }
        /* 사이드바 영역 */
        #sidebar {
            border-right: 1px solid rgb(158, 158, 158);
            box-shadow: 3px 0px 3px rgb(162, 162, 162);
            width: 15%;
            height: 800px;
            display: block;
            float: left;
        }
        h3 {
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        #sidebar a{
            color: black;
        }
        #sidebar li {
            font-size: 16px;
            display: block;
            height: 60px;
            line-height: 60px;
            padding: 5px 10px;
        }
        #sidebar a[href *= "my"] > li  {
            background-color: #d2d2d2;
            transition: 0.3s;
            opacity: 0.8;
            border-radius : 20px;
        }
        #sidebar li img {
            transform: translateY(8px);
            margin: 0 3px;
        }
        .detail:hover {
            background-color: #d2d2d2;
            transition: 0.3s;
            opacity: 0.8;
           	border-radius : 20px;
        }

        /* 본문 영역 */
        #outer {
            position: relative;
            width: 85%;
            height: 800px;
            float: left;
        }
        #infoForm input[type=text] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            float: left;
            border: 1px solid #8e8e8e;
            border-radius: 4px;
        }
        .label {
            margin-top: 10px;
            clear: both;
            width: 100%;
        }
        #nickNameBox {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-around;
        }
        input[type="text"] {
        	outline: none;
        }
        
        #checkBtn {
            width: 90px;
            height: 40px;
            border-radius: 8px;
            margin-left: 8px;
            border: 2px solid #0090ff;
            float: left;
            cursor: pointer;
            background-color: #0090ff;
            color:white;
        }
        #checkBtn:hover {
            border: 2px solid #55a3de;
            background-color: #55a3de;
        }
        #checkBtn:disabled {
            border: 2px solid #b0b0b0;
            background-color: #b0b0b0;
            cursor: default;
        }       
        #saveBtn {
            width: 70px;
            height: 40px;
            border-radius: 8px;
            border: 2px solid #0090ff;
            float: right;
            margin: 20px 15px;
            padding: 10px 15px;
            cursor: pointer;
            background-color: #0090ff;
            color:white;
        }
        #saveBtn:hover {
            border: 2px solid #55a3de;
            background-color: #55a3de;
        }
        #saveBtn:disabled {
            border: 2px solid #b0b0b0;
            background-color: #b0b0b0;
            cursor: default;
        }
        .saveBtnArea {
            width: 100%;
        }
        #selectCon{
            display: grid;
            width: 100%;
            grid-template-columns: repeat(3, 1fr);
            grid-template-areas: 
                "select" "select" "select";
        }
        #infoForm select {
            width: 90%;
            padding: 16px 20px;
            border: 1px solid black;
            border-radius: 4px;
            font-size:15px ;
            margin: 10px;
        }
        #innerContainer {
            position: absolute;
            padding: 10px;
            width: 700px;
            height: 430px;
            top : 100px;
            left : 100px;
            border-bottom: 1px solid #8e8e8e;
        }
		input:read-only {
        	background-color:#e6e6e6;
        }
    </style>
    
</head>
<body>
	<%
	int type = session.getAttribute("type") == null ? 0 : Integer.parseInt(session.getAttribute("type").toString());
	if (session.getAttribute("memberId") == null) {
		out.println("<script>");
		out.println("alert('로그인 후 접근이 가능합니다.')");
		out.println("window.location.replace('/okky/member/login.do')");
		out.println("</script>");
	}
	%>
	<jsp:include page="/common/header.jsp" />
    <div id="container">
    <aside id="sidebar">
        <div>
            <ul>
                <li><h3>내 계정</h3></li>
                <a href="./mypage.do"><li class="detail"><img src="../img/user.png" alt="프로필아이콘">프로필</li></a>
                <a href="./account.do"><li class="detail"><img src="../img/cogwheel.png" alt="계정관리">계정 관리</li></a>
            </ul>
            <hr>
            <ul>
                <li><h3>JOBS</h3></li>
                <a href="./applyList.do"><li class="detail"><img src="../img/briefcase.png" alt="구직관리아이콘">구직 내역 관리</li></a>
            </ul>

        </div>
    </aside>
    <div id="outer">
        <div id="innerContainer">
            <h3>회원 정보</h3>
            <form action="./mypage.do" name="infoForm" id="infoForm" method="post">
                <div class="label"><label for="name">이름</label></div>
                <div><input type="text" name="name" id="name" value="${name} " readonly></div>
                <div class="notice"><p></p></div>
                <div class="label"><label for="nickname">닉네임</label></div>
                <div id="nickNameBox">
                	<c:if test="${not empty checkNickname}">
                		<input type="text" name="nickname" id="nickname" value="${checkNickname }">
                	</c:if>
                	<c:if test="${empty checkNickname}">
                		<input type="text" name="nickname" id="nickname" value="${nickname }">
                	</c:if> 
                    <input type="button" id="checkBtn"  value="중복 확인" disabled>
                </div>
                <c:if test="${not empty nNameErrMsg}">
					<p style="color: red; font-weight: bold;">${nNameErrMsg}</p>
				</c:if>
                <c:if test="${not empty nNameOkayMsg}">
					<p style="color: blue; font-weight: bold;">${nNameOkayMsg}</p>
				</c:if>
                <div class="label"><label for="skill"><span style="color : skyblue;">*선택사항*</span> 스킬 태그를 3개 모두 선택해주세요</label></div>
                <div id="selectCon">
                    <div>
                        <select name="skill1" id="skill_1st">
                            <option value="" <c:if test="${skill1 eq ''}">selected</c:if>>선택 1</option>
            				<option value="프론트엔드" <c:if test="${skill1 eq '프론트엔드'}">selected</c:if>>프론트엔드</option>
                            <option value="백엔드" <c:if test="${skill1 eq '백엔드'}">selected</c:if>>백엔드</option>
                            <option value="풀스택" <c:if test="${skill1 eq '풀스택'}">selected</c:if>>풀스택</option>
                        </select>
                    </div>
                    <div>
                        <select name="skill2" id="skill_2nd">
                            <option value="" <c:if test="${skill2 eq ''}">selected</c:if>>선택 2</option>
                            <option value="DB" <c:if test="${skill2 eq 'DB'}">selected</c:if>>DB</option>
                            <option value="SQL" <c:if test="${skill2 eq 'SQL'}">selected</c:if>>SQL</option>
                            <option value="스프링" <c:if test="${skill2 eq '스프링'}">selected</c:if>>스프링</option>
                            <option value="자바" <c:if test="${skill2 eq '자바'}">selected</c:if>>자바</option>
                            <option value="자바스크립트" <c:if test="${skill2 eq '자바스크립트'}">selected</c:if>>자바스크립트</option>
                            <option value="HTML" <c:if test="${skill2 eq 'HTML'}">selected</c:if>>HTML</option>
                        </select>
                    </div>
                    <div>
                        <select name="skill3" id="skill_3rd">
                            <option value="" <c:if test="${skill3 eq ''}">selected</c:if>>선택 3</option>
            				<option value="파이썬" <c:if test="${skill3 eq '파이썬'}">selected</c:if>>파이썬</option>
                            <option value="C" <c:if test="${skill3 eq 'C'}">selected</c:if>>C</option>
                            <option value="C#" <c:if test="${skill3 eq 'C#'}">selected</c:if>>C#</option>
                            <option value="C++" <c:if test="${skill3 eq 'C++'}">selected</c:if>>C++</option>
                        </select>
                    </div>
                </div>
                <div class="saveBtnArea">
                    <input type="submit" id="saveBtn" name="saveBtn" value="저장">
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="/common/footer.jsp" />
<script>
	const engChars = "abcdefghijklmnopqrstuvwxyz";
	const EngChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	const numChars = "0123456789";
	const specialChars = "`~!@#$%^&*()-=_+,<.>/?;':\"\"'{}[]";
	const emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
	const korCheck = /[^-0-9]/g;

    let nickname = document.getElementById("nickname");
    let savebtn = document.getElementById("saveBtn");
    let compareBtn = document.getElementById("checkBtn");
    let skill1 = document.getElementById("skill_1st"); 
    let skill2 = document.getElementById("skill_2nd"); 
    let skill3 = document.getElementById("skill_3rd"); 

    nickname.addEventListener("keyup", function(e){
        if (nickname.value.length > 0 &&  nickname.value != '${nickname}') {
            compareBtn.disabled = false;
        }
        else {
        	compareBtn.disabled = true;
        }
    });
    compareBtn.addEventListener("click", function(e){
        if (nickname.value.length <= 20 && '${empty nNameErrMsg}') {
        	if(nickname.value != '${nickname}'){
        		location.href="./nicknameCompare.do?nickname="+nickname.value;
        	}
        }
    });

    savebtn.addEventListener("click", function(e){
    	if(compareBtn.disabled != true){
    		alert("중복확인을 해주세요")
    		e.preventDefault();
           	return false;
    	}
 
    	if (skill1.value =="" && skill2.value=="" && skill3.value=="") {
    		alert("저장되었습니다.");
    		return false;
    	}
    	if(skill1.value == ""){
    		skill1.style.border="1px solid red";
    		e.preventDefault();
    	} else {
    		skill1.style.border="";
    	}
    	if(skill2.value == "" ){
    		skill2.style.border="1px solid red";
    		e.preventDefault();
    	} else {
    		skill2.style.border="";
    	}
    	if(skill3.value == "" ){
    		skill3.style.border="1px solid red";
    		e.preventDefault();
    	} else {
    		skill3.style.border="";
    	}
    	if(skill1.value != "" && skill2.value != "" && skill3.value != "")
    	alert("저장되었습니다.");

    });
    
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
    
     //닉네임 체크
    nickname.addEventListener("keyup", function(e) {
    	validate_check(nickname, 2, 20, 3);
    }, false);
</script>

    
</body>
</html>