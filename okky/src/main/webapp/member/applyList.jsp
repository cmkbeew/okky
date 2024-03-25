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
            margin: 0;
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

        #sidebar a {
            color: black;
        }

        #sidebar li {
            font-size: 16px;
            display: block;
            height: 60px;
            line-height: 60px;
            padding: 5px 10px;
        }

        #sidebar a[href *="apply"]>li {
            background-color: #d2d2d2;
            transition: 0.3s;
            opacity: 0.8;
            border-radius: 20px;
        }

        #sidebar li img {
            transform: translateY(8px);
            margin: 0 3px;
        }

        .detail:hover {
            background-color: #d2d2d2;
            transition: 0.3s;
            opacity: 0.8;
            border-radius: 20px;
        }

        /* 본문 영역 */
        #outer {
            width: 85%;
            height: 100%;
            float: left;
            display: grid;
            /*  place-items : center; */
            grid-template-rows: 400px 1px 700px;
        }

        .label {
            margin-top: 10px;
            clear: both;
            width: 100%;
        }

        /* 찐 본문 내용 */
        #container1 {
            grid-row: 1 /2;
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

        #innnerContainer {
            display: flex;
            align-items: center;
        }
		#resumeRegiFrm{
			width : 800px;
            display: flex;
		}
        #resumeBox {
            display: flex;
            border: 1px solid rgb(184, 184, 184);
            width: 500px;
            height: 300px;
            border-radius: 20px;
            background-color: #f1f1f1;
            flex-direction: column;
            justify-content: center;
            align-items: center;

            margin: 60px;
        }
        #resumBoxBG {
            background-color: white;
            width: 300px;
            height: 200px;
            border-radius: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;

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
            border: 2px solid #0090ff;
            color : white;
            margin: 20px 15px;
            padding: 10px 15px;
            cursor: pointer;
            background-color: #0090ff;
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
            align-items: flex-end;
            width : 180px;
        }

        /* 지원영역 */
        #container2 {
            grid-row: 3/4;
            display: flex;
        }

        #jobList {
            margin: 30px 0;
            width: 100%;
            display: flex;
            justify-content: center;
        }
		#listTbl {
            width: 850px;
            border:1px solid grey;
            border-collapse: collapse;
            box-shadow : 0 0 0 1px #666;
            padding :10px;
            font-size: 18px;
        }
        th, tr {
            padding :10px;
            font-size: 18px;
        }
        td {
         	border-bottom : 1px solid grey;
         	padding :10px;
            font-size: 18px;
         }
        #listTbl th {
            background-color: #0090ff;
            border: none;
            color: white;
        }

        .linkBtn {
            width: 80px;
            height: 35px;
            background-color: #0090ff;
            border: none;
            box-shadow: 2px 2px 5px grey;
            cursor: pointer;
            border-radius: 3px;
            color:white;
        }

        .linkBtn:hover {
            background-color: #0061ac;
        }

        .lastCol {
            text-align: center;
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
                    <li>
                        <h3>내 계정</h3>
                    </li>
                    <a href="./mypage.do">
                        <li class="detail"><img src="../img/user.png" alt="프로필아이콘">프로필</li>
                    </a>
                    <a href="./account.do">
                        <li class="detail"><img src="../img/cogwheel.png" alt="계정관리">계정 관리</li>
                    </a>
                </ul>
                <hr>
                <ul>
                    <li>
                        <h3>JOBS</h3>
                    </li>
                    <a href="./applyList.do">
                        <li class="detail"><img src="../img/briefcase.png" alt="구직관리아이콘">구직 내역 관리</li>
                    </a>
                </ul>
            </div>
        </aside>
        <div id="outer">
            <div id="container1">
                <form id="resumeRegiFrm" name="resumeRegiFrm" action="regiResume.do" method="post"  enctype="multipart/form-data">
                    <div id="innnerContainer">
                        <div id="resumeBox">
                            <div id="resumBoxBG">
                            <c:if test="${sessionScope.orgCompanyFile eq null}">
                            	<p id="fileMent" style="color: red; font-weight:bold;">이력서 파일을 업로드해주세요.</p>
                            </c:if>
                            <c:if test="${not empty sessionScope.orgCompanyFile}">
                            	<p id="fileMent" style="color: blue; font-weight:bold;">${sessionScope.orgCompanyFile}</p>
                            </c:if>
                            <label for="fileUpload">
                                <div id="filebox">이력서 파일 업로드</div>
                            </label>
                            <input type="file" id="fileUpload" name="file" accept=".pdf">
                            </div>
                            
                        </div>
                    </div>
                    <div class="saveBtnArea">
                        <input type="submit" id="saveBtn" name="saveBtn" value="저장" disabled>
                    </div>
                </form>
            </div>
            <div class="divLine"></div>
            <div id="container2">
                <div id="jobList">
                    <table id="listTbl">
                        <thead>
                            <tr>
                                <th>공고번호</th>
                                <th>지원 공고 제목</th>
                                <th>마감일</th>
                                <th>공고조회</th>
                            </tr>
                        </thead>
                        <tbody>

                            <c:choose>
                                <c:when test="${not empty applyList }">
                                   <%--  <c:set var="row_num" value=""/> --%>
                                    <c:forEach var="list" items="${applyList }" varStatus="loop">
                                        <tr>
                                            <td>${list.recruitIdx }</td>
                                            <td>${list.recruitTitle}</td>
                                            <td>${list.dueDate}</td>
                                            <td class="lastCol"><button class="linkBtn" name="linkBtn" onclick="location.href ='/okky/jobs/jobDetail.do?recruitIdx=${list.recruitIdx}'">조회</button></td>
                                        </tr>
                                        <!-- <%-- <c:set var="row_num" value="${row_num = row_num -1 }" /> --%> -->
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="4" style="text-align: center;">지원한 공고 목록이 없습니다.</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/common/footer.jsp" />
    <script>
        let fileUpload = document.getElementById("fileUpload");
        let ment = document.getElementById("fileMent");
        let saveBtn = document.getElementById("saveBtn");
        fileUpload.addEventListener("change", ()=>{
            if(fileUpload.value.length) {
                ment.style.display = "block";
                ment.style.color = "blue";
                ment.innerHTML = `<strong>`+fileUpload.files[0].name+`</strong>`;
	        	saveBtn.disabled = false;
            }
            else {
                ment.style.display = "display";
            }
        }); 

        saveBtn.addEventListener("click", function(e){
        	alert("이력서 파일이 업로드 되었습니다.");
        });
    </script>

</body>

</html>