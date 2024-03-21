<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
    /* 좌측 */
    .company-info {
        width: 800px;
    }
    .info {
        margin-bottom: 30px;
        font-size: 20px;
    }
    .info-title {
        width: 800px;
        margin-bottom: 75px;
    }
    .position-name {
        font-size: 40px;
        font-weight: bold;
    }
    ul {
        padding: 0px;
        list-style: none;
        display: flex;
        justify-content: space-between;
    }
    ul div {
        border: 1px solid black;
        width: 250px;
        padding: 0px 10px;
    }
    ul div li {
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 15px;
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
        background-color: rgb(57, 182, 255, 0.7);
        color: black;
        border-radius: 20px;
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
    <div class="container">
        <div class="company-info">
            <div class="info">회사명asdasdsadasdasdasdasds</div>
            <div class="info" style="float: left; margin-right: 50px;">2024-11-11</div>
            <div class="info">조회수: 102</div>
            <div class="info-title">
                <div class="position-name">포지션명</div>
            </div>

            <div class="info-content">
                <ul>
                    <div>
                        <li>포지션</li>
                        <span>풀스택개발</span>
                    </div>
                    <div>
                        <li>필요경력</li>
                        <span>3~4년 이상</span>
                    </div>
                    <div>
                        <li>근무지역</li>
                        <span>서울 금천구 가산동</span>
                    </div>
                </ul>
            </div>

            <div class="company-intro">
                <div class="intro-content">
                    <p>
                        프로젝트 소개
모집분야 : 백엔드 개발자 (경력 6년 이상)

위 치 : 구로구



[주요 비즈니스]

● 빅데이터 플랫폼 + IoT 플랫폼

국내외 빅데이터 및 IoT 데이터 수집, 분석, 처리, 시각화 기술 기반의 실시간 모니터링 및 의사결정 시스템 개발

● 인공지능 분석 플랫폼

인공지능 및 고급분석모델 기반 시뮬레이션 플랫폼 개발

● 온라인 협업 시스템

모바일, 웹 기반의 실시간 정보 공유 및 비즈니스 서비스 개발





[주요 업무]

빅데이터 처리 및 분석을 위한 효율적인 데이터 파이프라인 설계 및 구축

Apache NiFi를 활용한 데이터 흐름 관리 및 자동화

시스템 성능 최적화 및 안정성 강화

데이터 품질 관리 및 모니터링 시스템 개발

신기술 탐색 및 적용을 통한 지속적인 시스템 개선





[자격 요건]

DATA FLOW, AIR FLOW

컴퓨터 과학, 정보기술, 또는 관련 분야에서 학사 학위 이상 소지자

빅데이터 플랫폼 및 백엔드 시스템 개발 분야에서 6년 이상의 경력

Apache NiFi를 포함한 빅데이터 처리 도구에 대한 실무 경험

Java, Python 등 프로그래밍 언어에 능숙

데이터베이스 및 분산 시스템에 대한 깊은 이해

RESTful API 설계 및 구현 경험





[우대 사항]

석사 학위 이상 소지자 우대

컨테이너화 도구(Kubernetes, Docker 등) 사용 경험

클라우드 서비스(AWS, Azure, GCP 등) 활용 경험

빅데이터 분석 도구(Hadoop, Spark 등) 사용 경험

팀 리더십 및 프로젝트 관리 경험





[근무 복지]

● 자기계발 지원

· 기술서적 구입비 지원, 업무관련 교육비 지원

● 건강관리 지원

· 건강검진 추가 검사비 지원

· 체력단련비 지원

● 포상 제도

· 우수사원, 장기근속자, 인센티브, 해외여행

● 생활 지원

· 경조사비, 명절선물, 각종 이벤트

● 분위기

- 회사 휴게실에 늘 음료와 간식이 편의점 만큼 있어요.

- 연차는 당연히 언제나 자유롭게 쓸 수 있어요.

- 20~30대 젊은 개발자가 대부분이에요.

● 연봉

5500만 ~ 협의
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
            location.href = "/mypage.do";
        });
    </script>
</body>
</html>