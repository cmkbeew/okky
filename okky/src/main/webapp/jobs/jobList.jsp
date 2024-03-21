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
        padding: 5px 30px;
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
        width: 240px;
        max-height: 400px;
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
    }
    .filter-option {
        padding: 16px 24px;
    }
    .filter-btn {
        width: 100%;
        border: none;
        font-size: 18px;
    }
    .filter-btn:hover {
        background-color: #d8d8d8;
    }

    /* 카운트 + 정렬버튼 */
    .count {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
    }
    /* 회사 리스트 */
    .company-group {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-gap: 40px 40px;
        margin-bottom: 30px;
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
	        <h3 class="title">Yes! 클린일자리 체크리스트, 스마트필터, 바로지원, 무료 법률상담 서비스</h3>
	        <h3 class="title">No! 허위 구인게시물</h3>
        </div>
        <hr>

        <div>
            <form class="frmSearch">
                <div class="search-bar">
                    <div class="search-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-search-heart" viewBox="0 0 16 16">
                            <path d="M6.5 4.482c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.69 0-5.018"/>
                            <path d="M13 6.5a6.47 6.47 0 0 1-1.258 3.844q.06.044.115.098l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1-.1-.115h.002A6.5 6.5 0 1 1 13 6.5M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11"/>
                          </svg>
                    </div>
                    <div class="bar">
                        <input class="search-word" type="text" name="search-word" id="search-word" placeholder="Search Keywords" />
                    </div>
                    <div class="search-icon">
                        <button class="btn_search" type="submit">Search</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="filter-group">
            <div class="filter">
                <button class="filter-toggle">포지션</button>
                <ul class="filter-menu">
                    <button class="filter-btn"><li class="filter-option">프론트</li></button>
                    <button class="filter-btn"><li class="filter-option">백엔드</li></button>
                    <button class="filter-btn"><li class="filter-option">DBA</li></button>
                    <button class="filter-btn"><li class="filter-option">풀스택</li></button>
                    <button class="filter-btn"><li class="filter-option">PM</li></button>
                    <button class="filter-btn"><li class="filter-option">기타</li></button>
                </ul>
            </div>
            
            <div class="filter">
                <button class="filter-toggle">지역</button>
                <ul class="filter-menu">
                    <button class="filter-btn"><li class="filter-option">서울</li></button>
                    <button class="filter-btn"><li class="filter-option">경기</li></button>
                    <button class="filter-btn"><li class="filter-option">인천</li></button>
                    <button class="filter-btn"><li class="filter-option">강원</li></button>
                    <button class="filter-btn"><li class="filter-option">충북</li></button>
                    <button class="filter-btn"><li class="filter-option">충남</li></button>
                    <button class="filter-btn"><li class="filter-option">전북</li></button>
                    <button class="filter-btn"><li class="filter-option">전남</li></button>
                    <button class="filter-btn"><li class="filter-option">경북</li></button>
                    <button class="filter-btn"><li class="filter-option">경남</li></button>
                    <button class="filter-btn"><li class="filter-option">제주</li></button>
                </ul>
            </div>
            
            <div class="filter">
                <button class="filter-toggle">경력</button>
                <ul class="filter-menu">
                    <button class="filter-btn"><li class="filter-option">무관</li></button>
                    <button class="filter-btn"><li class="filter-option">신입</li></button>
                    <button class="filter-btn"><li class="filter-option">1~2년</li></button>
                    <button class="filter-btn"><li class="filter-option">3~4년</li></button>
                    <button class="filter-btn"><li class="filter-option">5~6년</li></button>
                    <button class="filter-btn"><li class="filter-option">7년 이상</li></button>
                </ul>
            </div>
        </div>
        
        <div class="count">
            <div style="font-size: 16px;">total_count의 포지션</div>

            <div class="filter"  style="margin: 0px;">
                <button class="filter-toggle">정렬</button>
                <ul class="filter-menu">
                    <button class="filter-btn"><li class="filter-option">최신순</li></button>
                    <button class="filter-btn"><li class="filter-option">오래된순</li></button>
                </ul>
            </div>
        </div>
        
        <div class="company-group">
            <a href="/jobs/jobDetail.jsp" class="company">
                <img src="https://jobs.okky.kr/jobs/cover/images/corp-052.png" alt="회사이미지" width="270" height="150">
                <div class="company-info">
                    <span class="company-name"><strong>천재교육</strong></span>
                    <span class="position-name"><strong>백엔드</strong></span>
                    <span class="career">1~2년 이상</span>
                    <span class="addr">서울 금천구 가산동</span>
                </div>
            </a>
            <a href="/jobs/jobDetail.jsp" class="company">
                <img src="https://jobs.okky.kr/jobs/cover/images/corp-052.png" alt="회사이미지" width="270" height="150">
                <div class="company-info">
                    <span class="company-name"><strong>천재교육</strong></span>
                    <span class="position-name"><strong>백엔드</strong></span>
                    <span class="career">1~2년 이상</span>
                    <span class="addr">서울 금천구 가산동</span>
                </div>
            </a>
            <a href="/jobs/jobDetail.jsp" class="company">
                <img src="https://jobs.okky.kr/jobs/cover/images/corp-052.png" alt="회사이미지" width="270" height="150">
                <div class="company-info">
                    <span class="company-name"><strong>천재교육</strong></span>
                    <span class="position-name"><strong>백엔드</strong></span>
                    <span class="career">1~2년 이상</span>
                    <span class="addr">서울 금천구 가산동</span>
                </div>
            </a>
            <a href="/jobs/jobDetail.jsp" class="company">
                <img src="https://jobs.okky.kr/jobs/cover/images/corp-052.png" alt="회사이미지" width="270" height="150">
                <div class="company-info">
                    <span class="company-name"><strong>천재교육</strong></span>
                    <span class="position-name"><strong>백엔드</strong></span>
                    <span class="career">1~2년 이상</span>
                    <span class="addr">서울 금천구 가산동</span>
                </div>
            </a>
            <a href="/jobs/jobDetail.jsp" class="company">
                <img src="https://jobs.okky.kr/jobs/cover/images/corp-052.png" alt="회사이미지" width="270" height="150">
                <div class="company-info">
                    <span class="company-name"><strong>천재교육</strong></span>
                    <span class="position-name"><strong>백엔드</strong></span>
                    <span class="career">1~2년 이상</span>
                    <span class="addr">서울 금천구 가산동</span>
                </div>
            </a>
            <a href="/jobs/jobDetail.jsp" class="company">
                <img src="https://jobs.okky.kr/jobs/cover/images/corp-052.png" alt="회사이미지" width="270" height="150">
                <div class="company-info">
                    <span class="company-name"><strong>천재교육</strong></span>
                    <span class="position-name"><strong>백엔드</strong></span>
                    <span class="career">1~2년 이상</span>
                    <span class="addr">서울 금천구 가산동</span>
                </div>
            </a>
        </div>
        
        <hr>
	    <div style="font-size:40px; text-align:center; margin-bottom: 50px;">
	    	페이징처리
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
    </script>
</body>
</html>