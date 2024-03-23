<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구인구직 상세 페이지</title>
<style>
    .container {
        width: 1200px;
        margin: 40px auto;
        display: flex;
        justify-content: space-between;
    }
    .btns {
    	display: flex;
		justify-content: flex-end;
		height: 30px;
    }
    .btn-update {
    	background-color: rgba(57, 182, 255, 0.5);
        color: black;
        border-radius: 20px;
        margin-right: 10px;
    }
    .btn-delete {
    	background-color: rgba(57, 182, 255, 0.5);
        color: black;
        border-radius: 20px;
    }
    #title {
    	font-size: 30px;
    	font-weight: 900;
    }
    #companyName {
    	font-size: 26px;
    	font-weight: 600;
    }
    /* 좌측 */
    .company-info {
        width: 800px;
    }
    .info {
        margin-bottom: 30px;
        font-size: 14px;
    }
    .info-content {
        margin-bottom: 50px;
    }
    .position-name {
        font-size: 30px;
        font-weight: bold;
    }
    ul {
        padding: 0px;
        list-style: none;
        display: flex;
        justify-content: space-between;
    }
    ul div {
        width: 250px;
        padding: 0px 10px;
    }
    ul div li {
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 15px;
        background-color: rgba(57, 182, 255, 0.7);
    }
    /* 우측 */
    .right {
        width: 300px;
    }
    .right-border {
        width: 250px;
        border: 1px solid black;
        box-sizing: border-box;
        margin: 30px auto;
        display: flex;
        flex-direction: column;
        align-items: center;
        border-radius: 20px;
    }
    .right-content {
        text-align: center;
        padding: 50px 20px;
        font-weight: bold;
        color: rgba(0, 0, 0, 0.6);
    }
    .btn-right {
        width: 200px;
        height: 50px;
        font-size: 18px;
        margin-bottom: 30px;
        background-color: rgba(57, 182, 255, 0.7);
        color: black;
        border-radius: 20px;
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
    <div class="container">
        <div class="company-info">
        	<c:if test="${sessionScope.memberIdx eq jobView.memberIdx}">
	        	<div class="btns">
			        <button class="btn-update" id="btn_update">수정하기</button>
			    	<button class="btn-delete" id="btn_delete">삭제하기</button>
		    	</div>
		    </c:if>
        	<div class="info-top">
	            <div id="title" class="info">${jobView.recruitTitle}</div>
	            <div id="companyName" class="info">${jobView.companyName}</div>
	            <div class="info" style="float: left; margin-right: 50px;">마감일: ${jobView.dueDate}</div>
	            <div class="info">조회수: ${jobView.readCnt}</div>
            </div>
			
            <div class="info-content">
                <ul>
                    <div>
                        <li>포지션</li>
                        <span>${jobView.position}</span>
                    </div>
                    <div>
                        <li>필요경력</li>
                        <span>${jobView.career}</span>
                    </div>
                    <div>
                        <li>근무지역</li>
                        <span>${jobView.companyAddr}</span>
                    </div>
                    <div>
                        <li>연봉</li>
                        <span>${jobView.salary}</span>
                    </div>
                </ul>
            </div>
            
            <hr style="border: 5px solid gray">

            <div class="company-intro">
                <div class="intro-content">
                    <p>
                        ${jobView.recruitContent}
                    </p>
                </div>
            </div>
        </div>

        <div class="right">
            <div class="right-border">
                <div class="right-content">
                    회사에 지원하고싶다면?
                </div>
                <button class="btn-right" id="btn_apply">지원하기</button>
            </div>

            <div class="right-border">
                <div class="right-content">
                    이력서가 등록하고싶다면?
                </div>
                <button class="btn-right" id="btn_resume">이력서 등록하기</button>
            </div>
        </div>
    </div>
    
	<jsp:include page="../common/footer.jsp" />
    <script>
        document.querySelector("#btn_apply").addEventListener("click", function(e){
            location.href = "/apply.do";
        });

        document.querySelector("#btn_resume").addEventListener("click", function(e){
            location.href = "/okky/member/mypage.do";
        });
        
        document.querySelector("#btn_update").addEventListener("click", function(e){
            location.href = "/okky/jobs/jobModify.do?recruitIdx=${jobView.recruitIdx}";
        });
        
        document.querySelector("#btn_delete").addEventListener("click", function(e){
            location.href = "/okky/jobs/jobDelete.do?recruitIdx=${jobView.recruitIdx}";
        });
    </script>
</body>
</html>