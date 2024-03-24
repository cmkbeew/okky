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
        #changeBtn {
            width: 150px;
            height: 40px;
            border-radius: 8px;
            border: 2px solid #71c1ff;
            float: right;
            margin: 20px 15px;
            padding: 10px 15px;
            cursor: pointer;
            background-color: #71c1ff;
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
            border: 2px solid #71c1ff;
            float: left;
            cursor: pointer;
            background-color: #71c1ff;
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
            border: 2px solid #71c1ff;
            float: right;
            margin: 20px 15px;
            padding: 10px 15px;
            cursor: pointer;
            background-color: #71c1ff;
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
            border: 2px solid #71c1ff;
            float: right;
            margin: 20px 15px;
            padding: 10px 15px;
            cursor: pointer;
            background-color: #71c1ff;
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
                <div class="label"><label for="newPwd">신규 비밀번호</label></div>
                <div><input type="password" name="newPwd" id="newPwd" value="" placeholder="영문+숫자+특수문자 포함 6~20자 이내로 입력해주세요"></div>
                <div class="label"><label for="newPwdCk">비밀번호 확인</label></div>
                <div><input type="password" name="newPwdCk" id="newPwdCk" value="" placeholder="새로운 비밀번호를 다시 한번 입력해주세요"></div>
                <div id="errPwd" style="display: none;"></div>
                <div class="saveBtnArea">
                    <input type="submit" id="changeBtn" name="changeBtn" value="비밀번호 변경">
                </div>
            </form>
        </div>
        <div id="innerContainer2">
            <form name="emailForm" id="emailForm" action="changeEmail.do" method="post">
                <div class="label"><label for="emailInfo">이메일 정보</label></div>
                <div id="emailCkBox"><input type="text" name="email" id="email" value="${email}">
                <button id="checkBtn" disabled>중복 확인</button></div>
                <div class="saveBtnArea">
                    <input type="submit" id="saveBtn" name="saveBtn" value="저장" >
                </div>
            </form>
        </div>
        <div id="innerContainer3">
            <form name="deleteForm" id="deleteForm" action="delete.do" method="post">
                <div class="label"><label for="accountDel">계정 삭제</label></div>
                <div id="delText">
                    <p>회원 탈퇴일로부터 계정과 닉네임을 포함한 계정 정보(아이디/이메일/닉네임)는
                        <span class="blue underline">개인정보 처리방침</span>에 따라 <span class="bold">60일간 보관(잠김)</span>되며, 
                        60일 경과된 후에는 모든 개인 정보는 완전히 삭제되며 더 이상 복구할 수 없게 됩니다.<br>
                                               
                        작성된 게시물은 삭제되지 않으며, 익명처리 후 OKKY 로 소유권이 귀속됩니다.</p>
                </div>
                <div><input type="checkbox" id="accountCkbox" name="accountCkbox" value="Y">계정 삭제에 관한 정책을 읽고 이에 동의합니다.</div>
                <div class="saveBtnArea">
                    <input type="submit" id="outBtn" name="outBtn" value="탈퇴" >
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="/common/footer.jsp" />
<script>
let check = document.getElementById("accountCkbox");
check.addEventListener("click", function(e){
    if(check.value == null){
        document.querySelector("#outBtn").disabled = true;
        check.value = "N";
        console.log(check.value);
    }else {
        document.querySelector("#outBtn").disabled = false;
        check.value = "Y";
        console.log(check.value);
    }
});
let pwd1 = document.getElementById("pwd");
let pwd2 = document.getElementById("newPwd");
let pwd2Ck = document.getElementById("newPwdCk");

pwd2Ck.addEventListener("change",function(e){
	if (pwd1.value.length > 0 && pwd2.value.length > 0 && pwd2Ck.value.length >0){
		document.getElementById("changeBtn").disabled = false;
	}
});
document.getElementById("changeBtn").addEventListener("click",function(e){ 
	alert("비밀변호 변경이 완료되었습니다.");
});
	
document.getElementById("email").addEventListener("change",function(e){
	if(document.getElementById("email").value.length > 0){
		document.getElementById("saveBtn").disabled = false;
	}
});
</script>
</body>
</html>