<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회사 마이페이지</title>
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
            box-shadow: 5px 0px 5px rgb(162, 162, 162);
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
        #sidebar a[href *= "profile"] > li  {
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
        
        #saveBtnArea {
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
            margin: 10px 0;
        }
        #innerContainer {
            position: absolute;
            padding: 10px;
            width: 600px;
            height: 450px;
            top : 100px;
            left : 60px;
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
                <a href="profile.jsp"><li class="detail"><img src="../img/user.png" alt="프로필아이콘">프로필</li></a>
                <a href="account.jsp"><li class="detail"><img src="../img/cogwheel.png" alt="계정관리">계정 관리</li></a>
            </ul>
            <hr>
            <ul>
                <li><h3>JOBS</h3></li>
                <a href="jobdetail_co.jsp"><li class="detail"><img src="../img/briefcase.png" alt="구직관리아이콘">구직 내역 관리</li></a>
            </ul>

        </div>
    </aside>
    <div id="outer">
        <div id="innerContainer">
            <h3>회원 정보</h3>

            <form action="" name="infoForm" id="infoForm">
                <div class="label"><label for="name">담당자명</label></div>
                <div><input type="text" name="name" id="name" value=""></div>
                <div class="label"><label for="companyName">회사명</label></div>
                <div><input type="text" name="companyName" id="companyName" value="" readonly></div>
                <div class="label"><label for="companyNo">사업자 등록번호</label></div>
                <div><input type="text" name="companyNo" id="companyNo" value="" readonly></div>
                <div class="label"><label for="adminPNum">담당자 연락처</label></div>
                <div><input type="text" name="adminPNum" id="adminPNum" value="" placeholder="-제외 번호만 입력해주세요"></div>
                <div class="saveBtnArea">
                    <input type="submit" id="saveBtn" name="saveBtn" value="저장" disabled>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    let adminPNo = document.getElementById("adminPNum");
    
    adminPNo.addEventListener("change", function(e){
        if(adminPNo.value.length > 11 || (adminPNo.value.length <11 && adminPNo.value.length > 0) ) {
            alert("전화번호 자리 수를 맞춰 입력해주세요.");
        }
        else if(adminPNo.value.length == 11) {
             if (/[0-9]/.test(adminPNo.value)) {
                document.querySelector("#saveBtn").disabled = false;
            }
            else {
                document.querySelector("#saveBtn").disabled = true;
                alert("숫자만 입력해주세요.")
            }
        }
    })

    // adminPNo.addEventListener("change", function(e){
    //     document.querySelector("#saveBtn").disabled = false;
    // });



    



</script>

    
</body>
</html>