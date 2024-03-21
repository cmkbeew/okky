<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구인구직 페이지</title>
<style>
    #container {
        width: 1200px;
        margin: 0 auto;
        text-align: center;
    }
    #top {
        display: flex;
        justify-content: space-around;
        margin-top: 30px;
        text-align: left;
    }
    #top-ment {
        margin-top: 40px;
    }
    #top1 {
        font-size: 36px;
        font-weight: bold;
        margin-top: 10px;
    }
    #top1 span {
        color: purple;
    }
    #top2 {
        font-size: 22px;
        font-weight: 700;
        margin-top: 20px;
    }
    #top3 {
        font-size: 20px;
        margin-top: 10px;
    }
    #count {
        height: 86px;
        background-color: lightgray;
    }
    #count-ment {
        width: 25%;
        line-height: 25px;
        margin-top: 20px;
        margin-left: 10px;
    }
    .content-count {
        width: 25%;
        margin-top: 20px;
    }
    ul {
        list-style: none;
        display: flex;
        justify-content: space-around
    }
    li h4 {
        font-size: 14px;
    }
    li div {
        font-weight: bold;
        font-size: 22px;
    }
    li span {
        font-size: 14px;
    }
    #mid {
        width: 100%;
        margin: 50px 0;
        display: flex;
        justify-content: space-around;
        border: 3px solid purple;
        border-radius: 1%;
    }
    #mid-box {
        margin-left: 200px;
        line-height: 50px;
    }
    #box1 {
        font-size: 20px;
        font-weight: 500;
        color: purple;
    }
    #box2 {
        font-size: 26px;
        font-weight: bold;
    }
    #box3 {
        font-size: 18px;
        color: rgba(0, 0, 0, 0.7);
        font-weight: 600;
    }
    #bot {
        display: flex;
        justify-content: space-between;
        margin-bottom: 50px;
    }
    #position {
        width: 600px;
        background: url(https://jobs.okky.kr/jobs/position-cover.png);
    }
    #position-content {
        background-color: rgba(0, 56, 146, 0.7);
        height: 100%;
        color: aliceblue;
    }
    #talent {
        width: 600px;
        background: url(https://jobs.okky.kr/jobs/talent-cover.png);
    }
    #talent-content {
        background-color: rgba(0, 101, 152, 0.7);
        color: aliceblue;
    }
    .bot-ment {
        margin-bottom: 20px;
    }
    .bot-ment div {
        font-size: 46px;
        font-weight: bold;
        margin-bottom: 10px;
    }
    .bot-ment span {
        font-size: 18px;
        font-weight: lighter;
    }
    .bot-menu {
        display: flex;
        justify-content: space-evenly;
    }
    .bot-menu a {
        text-decoration: none;
    }
    .bot-menu .bot-content {
        width: 230px;
        background-color: rgba(200, 200, 200, 0.9);
        color: black;
        margin: 10px 0;
        border-radius: 20%;
        font-weight: bold;
        height: 200px;
    }
    .bot-menu .bot-content:hover, #talent-menu:hover {
        background-color: rgb(200, 200, 200);
    }
    .b-content div:first-child, .t-content div:first-child {
        font-size: 18px;
        line-height: 110px;
    }
    .b-content div:last-child, .t-content div:last-child {
        font-size: 26px;
    }
    .bot-menu .bot-right {
        width: 250px;
        background-color: black;
        margin: 10px 20px;
        border-radius: 20%;
        font-weight: bold;
    }
    #talent-menu {
        width: 300px;
        height: 200px;
        background-color: rgba(200, 200, 200, 0.9);
        color: black;
        margin: 10px 20px;
        border-radius: 10%;
        font-weight: bold;
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
    <div id="container">
        <div id="top">
            <div id="top-ment">
                <div id="top1">좋은 개발자와 좋은 일터가만나는 곳, <span>OKKY Jobs</span></div>
                <div id="top2">OKKY는 개발자를 위해 존재하는 국내 최대•최고의 개발자 채용 플랫폼입니다.</div>
                <div id="top3">#OKKY_Talent_정식오픈! #OKKY_Talent_정식오픈_이벤트_확인하기!</div>
            </div>
            <div id="top-image">
                <img src="https://jobs.okky.kr/jobs/hero.svg" alt="구인구직 top 이미지">
            </div>
        </div>
        <div id="count">
            <ul>
                <li id="count-ment">
                    <h4>지금 이 순간에도 수많은 개발자와 일자리가 OKKY Jobs를 통해 활발히 만나고 있습니다.</h4>
                </li>
                <li class="content-count">
                    <div>161,922명</div>
                    <span>가입 개인회원 수</span>
                </li>
                <li class="content-count">
                    <div>3,274사</div>
                    <span>가입 기업회원 수</span>
                </li>
                <li class="content-count">
                    <div>14,033사</div>
                    <span>최근 1년간 누적 포지션 수</span>
                </li>
            </ul>
        </div>
        
        <div id="mid">
            <div id="mid-box">
                <div><span id="box1">OKKY Talent</span></div>
                <div><span id="box2">지금 여기에서 멋진 만남이 시작됩니다.</span></div>
                <div><span id="box3">"OKKY Talent를 통해 새로운 기회를 만들어보세요!"</span></div>
            </div>
            <div id="mid-image"><img src="https://jobs.okky.kr/jobs/talent-hero.svg" alt="구인구직 중간 이미지"></div>
        </div>

        <div id="bot">
            <div id="position">
                <div id="position-content">
                    <div class="bot-ment">
                        <div>Position</div>
                        <span>괜찮은 직장이 모여있는 곳</span>
                    </div>
                    <div class="bot-menu">
                        <a href="/okky/jobs/jobList.jsp">
                            <div class="bot-content">
                                <div class="b-content">
                                    <div>Contract</div>
                                    <div>계약직</div>
                                </div>
                            </div>
                        </a>
                        <a href="/fulltime.do">
                            <div class="bot-content">
                                <div class="b-content">
                                    <div>Fulltime</div>
                                    <div>정규직</div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div id="talent">
                <div id="talent-content">
                    <div class="bot-ment">
                        <div>Talent</div>
                        <span>멋진 인재가 모여있는 곳</span>
                    </div>
                    <div class="bot-menu">
                        <a href="/resume.do">
                            <div id="talent-menu">
                                <div class="t-content">
                                    <div>Resume</div>
                                    <div>이력서 등록</div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>