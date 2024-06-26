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
        margin: 0 auto;
        text-align: center;
    }
    .top-ment {
    	display: flex;
    	flex-direction: column;
    	justify-content: center;
    	height: 150px;
    }
    h3 {
        color: rgba(0, 0, 0, 0.6);
    }
    /* 검색바 */
    .search-bar {
        width: 500px;
        display: flex;
        justify-content: center;
        align-items: center;
        border: 1px solid rgba(30, 30, 30, 0.5);
        border-radius: 20px;
        margin: 0 auto;
    }
    .reset-btn {
        margin: 0 10px;
    }
    .search-icon {
        margin: 0 20px;
    }
    .search-word {
        width: 200px;
        height: 30px;
        border: none;
        outline: none;
        font-size: 16px;
    }
    .btn_search {
        width: 70px;
        height: 30px;
    }
    /* 가운데 버튼 정렬 */
    .mid-group {
    	display: flex;
    	align-items: center;
    }
    .btn-regist {
    	width: 100px;
    	padding: 5px 0px;
        background-color: #d8d8d8;
        border-radius: 10px;
        border: none;
        font-size: 16px;
    }
 	.btn-regist:hover {
    	background-color: lightblue;
    }
    
    /* 필터링 */
    .filter-group {
        display: flex;
        justify-content: start;
        align-items: start;
        margin: 20px auto;
    }
    .filter {
        position: relative;  
        margin-right: 20px;
    }
    .filter-toggle {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100px;
        padding: 5px 0px;
        background-color: #d8d8d8;
        border-radius: 10px;
        border: none;
        font-size: 16px;
    }
    .filter-toggle:hover {
        background-color: lightblue;
    }
    .filter-menu {
        visibility: hidden;
        position: absolute;
        padding: 0;
        left: 0;
        width: 100px;
        max-height: 210px;
        border-radius: 8px;
        background-color: white;
        opacity: 0;  
        overflow-y: auto;
        transform: translate3d(0, -20px, 0);  
        transition: all 200ms ease-in-out;  
        list-style-type: none;
    }
    .filter.is-open .filter-menu {
        visibility: visible;  
        transform: translate3d(0, 0, 0); 
        opacity: 1;
        text-align: left;
    }
    .filter-option {
        padding: 16px 24px;
        margin: 0px 10px;
    }
    .filter-btn {
        width: 100%;
        height: 35px;
        border: none;
        font-size: 16px;
        line-height: 35px;
    }

    /* 카운트 + 정렬버튼 */
    .count {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .filter-sort {
        width: 100px;
        height: 35px;
        border: none;
        font-size: 16px;
        background-color: white;
    }
    .filter-sort:hover {
        background-color: black;
        color: white;
    }
    /* 회사 리스트 */
    .company-group {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-gap: 40px 40px;
        margin: 30px 0px;
    }
    .company {
        box-shadow: 3px 5px 5px gray;
        border-radius: 10px;
        text-decoration: none;
        color: black;
    }
    .company img {
        border-top-left-radius : 10px;
        border-top-right-radius : 10px;
        border-bottom: 1px solid black;
    }
    .company-info span {
        display: block;
        text-align: left;
        padding: 0px 10px;
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
    <div class="container">
    	<div class="top-ment">
	        <h2 class="title">OKKY Jobs는 국내 최대·최고의 개발자 전문 Job Platform입니다</h2>
	        <h3 class="title">Yes! 클린일자리 체크리스트, 스마트필터, 바로지원</h3>
	        <h3 class="title">No! 허위 구인게시물</h3>
        </div>
        <hr>

        <div>
            <form id="frmSearch" class="frmSearch" action="./jobList.do" method="get">
            	<input type="hidden" name="contractType" id="contractType" value="${maps.contractType}">
            	<input type="hidden" name="sort" id="sort" value="${sort}">
                <div class="search-bar">
                    <div class="search-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-search-heart" viewBox="0 0 16 16">
                            <path d="M6.5 4.482c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.69 0-5.018"/>
                            <path d="M13 6.5a6.47 6.47 0 0 1-1.258 3.844q.06.044.115.098l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1-.1-.115h.002A6.5 6.5 0 1 1 13 6.5M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11"/>
                          </svg>
                    </div>
                    <div class="bar">
                        <input class="search-word" type="text" name="search_word" id="search_word" placeholder="Search Keywords" />
                    </div>
                    <div class="reset-btn">
                        <button type="reset">X</button>
                    </div>
                    <div class="search-icon">
                        <button class="btn_search" type="submit">Search</button>
                    </div>
                </div>
        </div>
		<div class="mid-group">
	        <div class="filter-group">
	            <div class="filter">
	                <button type="button" class="filter-toggle">포지션</button>
	                <ul class="filter-menu">
	                	<li class="filter-btn"><input type="checkbox" class="filter-option" name="position_category" value="프론트">프론트</li>
	                	<li class="filter-btn"><input type="checkbox" class="filter-option" name="position_category" value="백엔드">백엔드</li>
	                	<li class="filter-btn"><input type="checkbox" class="filter-option" name="position_category" value="DBA">DBA</li>
	                	<li class="filter-btn"><input type="checkbox" class="filter-option" name="position_category" value="풀스택">풀스택</li>
	                	<li class="filter-btn"><input type="checkbox" class="filter-option" name="position_category" value="PM">PM</li>
	                	<li class="filter-btn"><input type="checkbox" class="filter-option" name="position_category" value="기타">기타</li>
	                </ul>
	            </div>
	            
	            <div class="filter">
	                <button type="button" class="filter-toggle">지역</button>
	                <ul class="filter-menu">
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="서울">서울</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="경기">경기</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="인천">인천</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="대구">대구</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="부산">부산</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="광주">광주</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="대전">대전</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="울산">울산</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="세종">세종</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="강원">강원</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="충남">충남</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="충북">충북</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="경남">경남</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="경북">경북</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="전남">전남</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="전북">전북</li>
	                	<li class="filter-btn"><input type="radio" class="filter-option" name="addr_category" value="제주">제주</li>
	                </ul>
	            </div>
	            
	            <div class="filter">
	                <button type="button" class="filter-toggle">경력</button>
	                <ul class="filter-menu">
	                	<li class="filter-btn"><input type="checkbox" class="filter-option" name="career_category" value="무관">무관</li>
	                	<li class="filter-btn"><input type="checkbox" class="filter-option" name="career_category" value="신입">신입</li>
	                	<li class="filter-btn"><input type="checkbox" class="filter-option" name="career_category" value="1~2년">1~2년</li>
	                	<li class="filter-btn"><input type="checkbox" class="filter-option" name="career_category" value="3~4년">3~4년</li>
	                	<li class="filter-btn"><input type="checkbox" class="filter-option" name="career_category" value="5~6년">5~6년</li>
	                	<li class="filter-btn"><input type="checkbox" class="filter-option" name="career_category" value="7년 이상">7년 이상</li>
	                </ul>
	            </div>
	        </form>
	        </div>
			<c:if test='${sessionScope.type eq "2"}'>
		        <div class="regist">
		        	<button class="btn-regist" id="btn_regist">공고등록</button>
		        </div>
	        </c:if>
        </div>
        
        <div class="count">
            <div style="font-size: 16px;"><span style="font-size:20px; font-weight:bold">
            	<c:if test="${maps.contractType eq 'fulltime'}">정규직</c:if>
            	<c:if test="${maps.contractType eq 'contract'}">계약직</c:if>
            	</span> 총 ${maps.total_count}개의 포지션
            </div>

            <div class="filter"  style="margin: 0px;">
                <button class="filter-toggle">정렬</button>
                <ul class="filter-menu" style="margin: 0; width: 100px;">
                    <button id="recent" class="filter-sort" onclick="jobOrder(this)"><li class="filter-by">최신순</li></button>
                    <button id="old" class="filter-sort" onclick="jobOrder(this)"><li class="filter-by">오래된순</li></button>
                </ul>
            </div>
        </div>
        
        <div class="company-group">
        	<c:forEach var="list" items="${list}">
        		<a href="/okky/jobs/jobDetail.do?recruitIdx=${list.recruitIdx}" class="company">
	                <img src="https://jobs.okky.kr/okky-logo-jobs.svg" alt="회사이미지" width="270" height="150">
	                <div class="company-info">
	                    <span class="company-name"><strong>${list.companyName}</strong></span>
	                    <span class="position-name"><strong>${list.position}</strong></span>
	                    <span class="career">${list.career}</span>
	                    <span class="addr">${list.companyAddr}</span>
	                </div>
	            </a>
        	</c:forEach>
        </div>
        
        <hr>
	    <div style="font-size:20px; text-align:center; margin-bottom: 50px;">
                <div id="paging">${maps.paging}</div>
	    </div>
    </div>
    
    <jsp:include page="../common/footer.jsp" />
    <script>
        // 1번째
		const filterButtonList = document.querySelectorAll(".filter-toggle");
		
		// 3번째
		function toggleFilterMenu() {
		  const filter = this.parentNode;
		  const filterOpened = document.querySelector(".filter.is-open");
		  
		  // 3-1
		  if (filterOpened) {
		    console.log(1);  // 1번 동작 확인
		    filterOpened.classList.remove("is-open");
		  }
		  
		  // 3-2
		  if (filter != filterOpened) {
		    console.log(2);  // 2번 동작 확인
		    filter.classList.add("is-open");
		  }
		}
		
		// 2번째
		filterButtonList.forEach(function (button) {
		  button.addEventListener("click", toggleFilterMenu);
		});
		
		// 공고 등록
		document.querySelector("#btn_regist").addEventListener("click", function(e){
            location.href = "/okky/jobs/jobRecruit.do";
        });
		
		// 공고 정렬
		function jobOrder(btn) {
			let contractType = "${contractType eq '정규직'}" ? "fulltime" : "contract";
			window.location.href = "/okky/jobs/jobList.do?contractType=${maps.contractType}&sort=" + btn.id;
		}
    </script>
</body>
</html>