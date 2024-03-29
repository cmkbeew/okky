<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계정관리</title>
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
            height: 1100px;
        }
        /* 사이드바 영역 */
        #sidebar {
            border-right: 1px solid rgb(158, 158, 158);
            box-shadow: 5px 0px 5px rgb(162, 162, 162);
            width: 15%;
            height: 100%;
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
        #sidebar a[href *= "account"] > li  {
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
            height: 100%;
            float: left;
        }
        #pwdForm input[type=text], #pwdForm input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            float: left;
            border: 1px solid #8e8e8e;
            border-radius: 4px;
        }
        #emailForm input[type=text], #pwdForm input[type=password] {
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
        /* 비밀번호 변경*/
        #innerContainer1 {
            position: absolute;
            padding: 10px;
            width: 700px;
            height: 400px;
            top : 30px;
            left : 100px;
            border-bottom: 1px solid #8e8e8e;
        }
        
        input[type="text"] {
        	outline: none;
        }
        #changeBtn {
            width: 150px;
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
        #changeBtn:hover {
            border: 2px solid #55a3de;
            background-color: #55a3de;
        }
        #changeBtn:disabled {
            border: 2px solid #b0b0b0;
            background-color: #b0b0b0;
            cursor: default;
        }
        /* 이메일 등록 버튼 */
        #innerContainer2 {
            position: absolute;
            padding: 10px;
            width: 700px;
            top : 450px;
            left : 100px;
            border-bottom: 1px solid #8e8e8e;
        }
        #emailCkBox {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-around;
        }
        #checkBtn {
            width: 100px;
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

        /* 계정 탈퇴 */
        #innerContainer3 {
            position: absolute;
            padding: 10px;
            width: 700px;
            top : 700px;
            left : 100px;
            border-bottom: 1px soild #8e8e8e;
        }
        #delText {
            border: 1px solid #b0b0b0;
            border-radius: 4px;
            margin: 20px 10px;
            padding: 10px;
        }
        #accountDel {
            margin : 0 10px;
            padding : 0 10px;
        }
        #outBtn {
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
        #outBtn:hover {
            border: 2px solid #55a3de;
            background-color: #55a3de;
        }
        #outBtn:disabled {
            border: 2px solid #b0b0b0;
            background-color: #b0b0b0;
            cursor: default;
        }
        
        .saveBtnArea {
            width: 100%;
        }
        .label > label {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .blue {
            color : #49b3ff
        }
        .underline {
            text-decoration: underline;
        }
        .bold {
            font-weight: bold;
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
	                <c:choose>
		            	<c:when test="${type == 1 }" >
	                		<a href="./mypage.jsp"><li class="detail"><img src="../img/user.png" alt="프로필아이콘">프로필</li></a>
	                	</c:when>
	                <c:otherwise>
	                	<a href="./mypage_co.do"><li class="detail"><img src="../img/user.png" alt="프로필아이콘">프로필</li></a>
	            		</c:otherwise>
	                </c:choose>
	                <c:choose>
		            	<c:when test="${type == 1 }" >
	                		<a href="./account.do"><li class="detail"><img src="../img/cogwheel.png" alt="계정관리">계정 관리</li></a>
	                	</c:when>
	                <c:otherwise>
	                	<a href="./account.do"><li class="detail"><img src="../img/cogwheel.png" alt="계정관리">계정 관리</li></a>
	            		</c:otherwise>
	                </c:choose>
	                
	            </ul>
	            <hr>
	            <ul>
	            	<c:choose>
		            	<c:when test="${type == 1 }" >
			                <li><h3>JOBS</h3></li>
	                		<a href="./applyList.do"><li class="detail"><img src="../img/briefcase.png" alt="구직관리아이콘">구직 내역 관리</li></a>
		                </c:when>
		                <c:otherwise>
		                	<li><h3>JOBS</h3></li>
	                		<a href="./applicantList.do"><li class="detail"><img src="../img/briefcase.png" alt="구직관리아이콘">구직 내역 관리</li></a>
		                </c:otherwise>
	                </c:choose>
	                
	            </ul>
	        </div>
	    </aside>
	    <div id="outer">
	        <div id="innerContainer1">
	        <h3>비밀번호 변경</h3>
	            <form name="pwdForm" id="pwdForm" action="changepwd.do" method="post">
	                <div class="label"><label for="pwd" >현재 비밀번호</label></div>
	                <div><input type="password" name="pwd" id="pwd" value="" placeholder="현재 사용중인 비밀번호를 입력해주세요"></div>
                    <p style="display: none" id="ment1"></p>
	                <div class="label"><label for="newPwd">신규 비밀번호</label></div>
	                <div><input type="password" name="newPwd" id="newPwd" value="" placeholder="영문+숫자+특수문자 포함 6~20자 이내로 입력해주세요"></div>
	                <div class="label"><label for="newPwdCk">비밀번호 확인</label></div>
	                <div><input type="password" name="newPwdCk" id="newPwdCk" value="" placeholder="새로운 비밀번호를 다시 한번 입력해주세요"></div>
	                <p style="display: none" id="ment2"></p>
	                <div class="saveBtnArea">
	                    <input type="submit" id="changeBtn" name="changeBtn" value="비밀번호 변경" disabled>
	                </div>
	            </form>
	        </div>
	        <div id="innerContainer2">
	            <form name="emailForm" id="emailForm" action="changeEmail.do" method="post">
	                <div class="label"><label for="email">이메일 정보</label></div>
	                <div id="emailCkBox">
	                <c:if test="${not empty checkEmail}">
	                	<input type="text" name="email" id="email" value="${checkEmail}">
	                </c:if>
	                <c:if test="${empty checkEmail}">
	                	<input type="text" name="email" id="email" value="${sessionScope.email}">
	                </c:if>
	                <input type="button" id="checkBtn" value="중복 확인" disabled></div>
	                <c:if test="${not empty emailErrMsg}">
						<p style="color: red; font-weight: bold;">${emailErrMsg}</p>
					</c:if>
	                <c:if test="${not empty emailOkayMsg}">
						<p style="color: blue; font-weight: bold;">${emailOkayMsg}</p>
					</c:if>
	                
	                
	                <div class="saveBtnArea">
	                    <input type="submit" id="saveBtn" name="saveBtn" value="저장" <c:if test="${empty emailOkayMsg}">disabled</c:if>>
	                </div>
	            </form>
	        </div>
	        <div id="innerContainer3">
	            <form name="deleteForm" id="deleteForm" action="delete.do" method="post">
	                <div class="label"><label for="accountDel">계정 삭제</label></div>
	                <div id="delText">
	                    <p>회원 탈퇴일로부터 계정과 닉네임을 포함한 계정 정보(아이디/이메일/닉네임)는
	                        <a href="javascript:openWindowPop('./outdetail.jsp', 'popup');"><span class="blue underline">개인정보 처리방침</span></a>에 따라 <span class="bold">60일간 보관(잠김)</span>되며, 
	                        60일 경과된 후에는 모든 개인 정보는 완전히 삭제되며 더 이상 복구할 수 없게 됩니다.<br>
	                                               
	                        작성된 게시물은 삭제되지 않으며, 익명처리 후 OKKY 로 소유권이 귀속됩니다.</p>
	                </div>
	                <div><input type="checkbox" id="accountCkbox" name="accountCkbox" value="Y">계정 삭제에 관한 정책을 읽고 이에 동의합니다.</div>
	                <div class="saveBtnArea">
	                    <input type="submit" id="outBtn" name="outBtn" value="탈퇴" disabled >
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
	
        let pwd = document.getElementById("pwd");
        let newPwd = document.getElementById("newPwd");
        let newPwdCk = document.getElementById("newPwdCk");
        let changeBtn = document.getElementById("changeBtn");
        let ment1 = document.getElementById("ment1")
        let ment2 = document.getElementById("ment2")
        let email = document.getElementById("email");
        let emailment = document.getElementById("emailment");
// 칸 입력 시 변경 버튼 활성화
        pwd.addEventListener("change",function(e){
            if (pwd.value.length > 0 && newPwd.value.length > 0 && newPwdCk.value.length >0){
                changeBtn.disabled = false;
            }
            else {
                changeBtn.disabled = true;
            }
        });
        newPwd.addEventListener("change",function(e){
            if (pwd.value.length > 0 && newPwd.value.length > 0 && newPwdCk.value.length >0){
                changeBtn.disabled = false;
            }
            else {
                changeBtn.disabled = true;
            }
        });
        newPwdCk.addEventListener("change",function(e){
            if (pwd.value.length > 0 && newPwd.value.length > 0 && newPwdCk.value.length >0){
                changeBtn.disabled = false;
            }
            else {
                changeBtn.disabled = true;
            }
        });
// 비밀번호 확인
        changeBtn.addEventListener("click",function(e){
            if (pwd.value != '${pwd}' ){
                ment1.style.display = "block";
                ment2.style.display = "none";
                ment1.style.color = "red";
                ment1.innerHTML = `<strong>현재 비밀번호와 일치하지 않습니다.</strong>`;
                e.preventDefault();
                pwd.focus();
                return false;
            }
            if( newPwd.value != newPwdCk.value){
                ment1.style.display = "none";
                ment2.style.display = "block";
                ment2.style.color = "red";
                ment2.innerHTML = `<strong>새로운 비밀번호화 비밀번호 확인이 다릅니다.</strong>`;
                e.preventDefault();
                newPwd.focus();
                return false;
            }
           	if(newPwd.style.border == "1px solid red" && newPwdCk.style.border == "1px solid red"){
           	 ment1.style.display = "none";
             ment2.style.display = "block";
             ment2.style.color = "red";
             ment2.innerHTML = `<strong>기준에 맞는 비밀번호로 변경해주세요.</strong>`;
             e.preventDefault();
             newPwd.focus();
             return false;
           	}
            alert("비밀번호가 변경되었습니다.");
        });
//이메일 중복체크 버튼
         document.getElementById("email").addEventListener("keyup",function(e){
             if(document.getElementById("email").value != '${email}'){
            	
                 document.getElementById("checkBtn").disabled = false;
             }
             else{
                 document.getElementById("checkBtn").disabled = true;
             }
         });
//이메일 변경 버튼
         document.getElementById("checkBtn").addEventListener("click",function(e){
    	    if (email.value.length > 0) {
    	    	if(email.value != '${email}'){
    	    		if(email.style.border != "1px solid red" ){
    	    		location.href="./emailCompare.do?email="+email.value;
    	    		}
    	    		else {
    	                e.preventDefault();
    	                email.focus();
    	                return false;
    	    		}
            	}
	        }
         });
         //탈퇴 버튼
         document.getElementById("accountCkbox").addEventListener("click",function(e){
        	 if(document.getElementById("accountCkbox").value == "Y"){
        			 document.getElementById("outBtn").disabled = false;
        			 document.getElementById("accountCkbox").value ="N";
        	 }
        	 else {
        		 document.getElementById("outBtn").disabled = true;
    			 document.getElementById("accountCkbox").value = "Y";
        	 }
         });
         document.getElementById("outBtn").addEventListener("click", function(e){
        	if(confirm("정말 탈퇴하시겠습니까?")){
        		alert("탈퇴 완료되었습니다. \n감사합니다.")
        	}
        	else {
        		e.preventDefault();
                return false;
        	}
        	
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
         //새 비밀번호 체크
        newPwd.addEventListener("keyup", function(e) {
        	validate_check(newPwd, 6, 20, 1);
        }, false);
         //새 비밀번호 확인 체크
        newPwdCk.addEventListener("keyup", function(e) {
        	validate_check(newPwdCk, 6, 20, 1);
        }, false);
        //이메일 체크
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
	
        function openWindowPop(url, name){
            var options = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
            window.open(url, name, options);
        }
        </script>
    </body>
</html>