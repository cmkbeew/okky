<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
            box-shadow: 3px 0px 3px rgb(162, 162, 162);
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
        #sidebar a[href *= "job"] > li  {
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
            width: 85%;
            height: 100%;
            float: left;
            display: grid;
            grid-template-rows: 400px 1px 700px;
        }
        .label {
            margin-top: 10px;
            clear: both;
            width: 100%;
        }
        /* 찐 본문 내용 */
        #container1{
            grid-row: 1 /2;
            display: flex;
        }
        #innnerContainer {
            display: flex;
            align-items: center;
        }
        #resumeBox{
            display: flex;
            border: 1px solid rgb(184, 184, 184);
            width: 500px;
            height: 300px;
            border-radius: 20px;
            background-color: #f1f1f1;
            justify-content: space-around;
            align-items: center;
            margin: 60px;
        }
        .divLine {
            border: 1px solid lightgray;
            grid-row: 2 /3;
        }

        /* 파일 */
        #filebox {
        width: 200px;
        height: 40px;
        background: #fff;
        border: 1px solid rgb(43, 43, 43);
        color: rgb(43, 43, 43);
        border-radius: 10px;
        font-weight: 500;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        &:hover {
            background-color: rgb(43, 43, 43);
            color: #fff;
        }
        }   
        #fileUpload {
        display: none;
        }
        #saveBtn {
            font-size: 15px;
            width: 100px;
            height: 50px;
            border-radius: 8px;
            border: 2px solid #71c1ff;
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
            display: flex;
            align-items: flex-end
        }
        /* 지원영역 */
        #container2{
            display: flex;
        }
        #jobList {
            grid-row: 3 /4;
            margin: 30px 0;
            width: 800px;
            display: flex;
            justify-content: center;
        }
        #listTbl {
            width: 700px;
        }
        #listTbl, th, td, tr {
            border:1px solid grey;
            border-collapse: collapse;
            padding :10px;
            font-size: 18px;
        }
        #listTbl th {
            background-color: #0090ff;
            border: none;
            color:white ;
        }
        .linkBtn {
            width: 80px;
            height: 35px;
            background-color:#0090ff ;
            border: none;
            box-shadow: 2px 2px 5px grey;
            cursor: pointer;
            border-radius: 3px;
        }
        .linkBtn:hover {
            background-color:#0061ac ;
        }
        .lastCol {
            text-align: center;
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
	                <a href="./applicant.do"><li class="detail"><img src="../img/briefcase.png" alt="구직관리아이콘">구직 내역 관리</li></a>
	            </ul>
	        </div>
	    </aside>
	    <div id="outer">
	        <div id="container1">
	            <div id="jobList">
	                <table id="listTbl">
	                    <thead>
	                        <tr>
	                            <th>지원자</th>
	                            <th>지원 공고 제목</th>
	                            <th>아이디</th>
	                            <th>마감일</th>
	                            <th>이력서 조회</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td colspan="5" style="text-align: center;">지원한 사람 목록이 없습니다</td>
	                        </tr>
	                        <tr>
	                            <td>이름</td>
	                            <td>지원 공고 제목</td>
	                            <td>id</td>
	                            <td>마감일</td>
	                            <td class="lastCol"><button class="linkBtn" name="linkBtn">조회</button></td>
	                        </tr>
	                    </tbody>
	                </table>
	
	            </div>
	        </div>
	    </div>
	</div>
	<jsp:include page="/common/footer.jsp" />
	<script>
	</script>
</body>
</html>