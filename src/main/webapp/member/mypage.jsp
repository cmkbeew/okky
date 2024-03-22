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
        
        #checkBtn {
            width: 90px;
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
            height: 400px;
            top : 100px;
            left : 100px;
            border-bottom: 1px solid #8e8e8e;
        }

    </style>
    
</head>
<body>
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

            <form action="mypage.do" name="infoForm" id="infoForm" method="post">
                <div class="label"><label for="name">이름</label></div>
                <div><input type="text" name="name" id="name" value="${name} " readonly></div>
                <div class="notice"><p></p></div>
                <div class="label"><label for="nickname">닉네임</label></div>
                <div id="nickNameBox">
                    <input type="text" name="nickname" id="nickname" value="${nickname }"> 
                    <button id="checkBtn" disabled>중복 확인</button>
                </div>
                <div class="label"><label for="skill">스킬 태그를 1개 이상 선택해주세요</label></div>
                <div id="selectCon">
                    <div>
                        <select name="skill1" id="skill_1st">
                            <option value="">선택 1</option>
            				<option value="프론트엔드">프론트엔드</option>
                            <option value="백엔드">백엔드</option>
                            <option value="DB">DB</option>
                            <option value="스프링">스프링</option>
                            <option value="자바">자바</option>
                            <option value="파이썬">파이썬</option>
                            <option value="자바스크립트">자바스크립트</option>
                            <option value="C">C</option>
                            <option value="C#">C#</option>
                            <option value="C++">C++</option>
                            <option value="HTML">HTML</option>
                            <option value="SQL">SQL</option>
                        </select>
                    </div>
                    <div>
                        <select name="skill2" id="skill_2nd">
                            <option value="">선택 2</option>
            				<option value="프론트엔드">프론트엔드</option>
                            <option value="백엔드">백엔드</option>
                            <option value="DB">DB</option>
                            <option value="스프링">스프링</option>
                            <option value="자바">자바</option>
                            <option value="파이썬">파이썬</option>
                            <option value="자바스크립트">자바스크립트</option>
                            <option value="C">C</option>
                            <option value="C#">C#</option>
                            <option value="C++">C++</option>
                            <option value="HTML">HTML</option>
                            <option value="SQL">SQL</option>
                        </select>
                    </div>
                    <div>
                        <select name="skill3" id="skill_3rd">
                            <option value="">선택 3</option>
            				<option value="프론트엔드">프론트엔드</option>
                            <option value="백엔드">백엔드</option>
                            <option value="DB">DB</option>
                            <option value="스프링">스프링</option>
                            <option value="자바">자바</option>
                            <option value="파이썬">파이썬</option>
                            <option value="자바스크립트">자바스크립트</option>
                            <option value="C">C</option>
                            <option value="C#">C#</option>
                            <option value="C++">C++</option>
                            <option value="HTML">HTML</option>
                            <option value="SQL">SQL</option>
                        </select>
                    </div>
                </div>
                <div class="saveBtnArea">
                    <input type="submit" id="saveBtn" name="saveBtn" value="저장" disabled>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    
    let nickname = document.getElementById("nickname");
    let savebtn = document.getElementById("saveBtn");
    let compareBtn = document.getElementById("checkBtn");
    let skill1 = document.getElementById("skill_1st"); 
    let skill2 = document.getElementById("skill_2nd"); 
    let skill3 = document.getElementById("skill_3rd"); 
    let skills = [];

    nickname.addEventListener("change", function(e){
        if (nickname.value.length > 0 ) {
            document.querySelector("#checkBtn").disabled = false;
        }
    });
    compareBtn.addEventListener("click", function(e){
        if (nickname.value.length <= 20) {
            //닉네임 비교 후 
            alert("사용가능 한 닉네임 입니다.")
            document.querySelector("#checkBtn").disabled = true;
            skill1.addEventListener("change", function(e){
                if(skill1.value != "" || skill2.value!= "" || skill3.value !=""){
                	savebtn.disabled = false;
                }
                else {
                    savebtn.disabled = false;
                }
            });
            skill2.addEventListener("change", function(e){
                if(skill1.value != "" || skill2.value!= "" || skill3.value !=""){
            	savebtn.disabled = false;
                }
                else {
                    savebtn.disabled = false;
                }
            });
            skill3.addEventListener("change", function(e){
                if(skill1.value != "" || skill2.value!= "" || skill3.value !=""){
            	savebtn.disabled = false;
                }
                else {
                    savebtn.disabled = false;
                }
            
            });
        }
        else {
            alert("현재 사용 중인 닉네임입니다.\n 다른 닉네임을 입력해주세요")
            e.preventDefault();
            return false;
        }
    });
    savebtn.addEventListener("click", function(e){
        skill1.value != ""?skills.push(skill1.value) : "";
        skill2.value != ""?skills.push(skill2.value) : "";
        skill3.value != ""?skills.push(skill3.value) : "";
    });
</script>

    
</body>
</html>