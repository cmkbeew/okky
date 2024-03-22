<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판</title>
 <style>
        /* * {
            margin :0;
        padding: 0;
        list-style: none;
        text-decoration: none;
        } */
        ul {
            list-style: none;
            padding: 0;
        }
        a {
            text-decoration: none;
            color:black
        }
        a:hover {
            color: #0090f9;
        }
        .flex {
            display: flex;
            box-sizing: border-box;
            flex-wrap: nowrap;
            flex-direction: row;
            justify-content: space-around;
            margin-top: 80px;
        }
        #top_tag {
            height: 30px;
            line-height: 30px;
            margin: 10px;
        }
        .top_tag {
            display: flex;
            justify-content: space-between;
            margin: 10px;
            font-size: 14px;
        }
        .smallBlue {
            color: #0090f9;
        }
        #contents {
            width: 840px;
        }
        #relative {
            position: relative;
        }
        #relative img {
            position: absolute;
            bottom: 0px;
            right: 10px;
            width: 200px;
        }
        .info {
            height: 80px;
            font-weight: 500;
            font-size: larger;
            border: 0;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            flex-wrap: wrap;
            padding-left: 20px;
            padding-right: 20px;
            background-color: rgb(227, 227, 232);
        }
        .info img {
            width: 80px;
            height: 100px;
        }
        .nav {
            height: 36px;
            display: flex;
            height: 36px;
            line-height: 36px;
            justify-content: space-between;
            margin-top: 20px;
        }
        nav{
            display: flex;
            justify-content: space-between;
            width: 300px;
        }
        .small {
            font-size: 14px;
            color: #111817;
        }
        .side {
            width: 180px;
        }
        #Lside {
            
            
        }
        #Rside {
            
        }
        #side_menu {
            margin-top: 30px;
            position: fixed;
            width: 180px;
        }
        #side_menu li{
            height: 100px;
            width: 100px;
            line-height: 100px;
            text-align: center;
            border: 2px solid;
            border-radius: 50%;
            margin: 6px auto;
            background-color: bisque;
            font-size: larger;
            font-weight: 800;
            opacity: 70%;
        }
        #up {
            position: fixed;
            bottom: 40px;
            right: 40px;
        }
        #up img {
            width: 30px;
        }

        button {
            background-color: #fff;
            border: 0;
        }
        button:hover {
            color: #0090f9;
            cursor: pointer;
        }
        .orderBy {
            display: flex;
            justify-content: space-between;
            width: 150px;
        }
        .orderBy button {
            border: 1px solid;
            border-radius: 5px;
        }
        .search {
            display: flex;
            justify-content: space-between;
            justify-items: center;
            
        }
        .writer {
            display: flex;
            height: 30px;
            line-height: 30px;
            font-size: smaller;
        }
        .writer div {
            margin-right: 10px;
            margin-bottom: 20px;
            font-size: smaller;
        }
        .list ul li {
            position: relative;
        }
        .list ul li button {
            border:1px solid;
            border-radius: 10px;
            height: 100px;
            width: 50px;
            float: left;
            margin-right: 20px;
        }
        #btn_search {
            background-color: #fff;
            border: 1px solid ;
            border-radius: 5px;
            height: 30px;
            width: 60px;
        }
        #btn_search:hover {
            cursor:pointer;
        }
    </style>
</head>
<body>
<jsp:include page="/common/header.jsp"/>
    <main>
   
        <div class="flex">
            <!-- 왼쪽사이드 -->
            <div class="side" id="Lside">
                <div id="top_tag"><span><h3>#인기태그</h3></span></div>
                <div><hr></div>
                <ul>
                    <li>
                        <div class="top_tag">
                            <div>#태그이름</div>
                            <div class="smallBlue">20</div>
                        </div>
                    </li>
                    <li> <div class="top_tag">
                        <div>#태그이름</div>
                        <div class="smallBlue">20</div>
                    </div></li>
                    <li> <div class="top_tag">
                        <div>#태그이름</div>
                        <div class="smallBlue">20</div>
                    </div></li>
                    <li> <div class="top_tag">
                        <div>#태그이름</div>
                        <div class="smallBlue">20</div>
                    </div></li>
                    <li> <div class="top_tag">
                        <div>#태그이름</div>
                        <div class="smallBlue">20</div>
                    </div></li>
                </ul>
            </div>  
        <!-- 몸통 -->
        
        <div id="contents">
            <div id="relative">
                <div class="info">
                    <span>Q&A</span>
                    <span class="small">좋은 질문과 답변으로 동료의 시간을 아껴주세요.</span>
                    
                </div>
                <img src="https://okky.kr/questions.svg"/>	
            </div>
            <div class="nav">
                <div>
                    
                        <button id="btn_regist" name="btn_regist" style="width: 100px; background-color: #0090f9; border-radius: 5px; color: #fff; height: 36px;" >
                            <img src="/okky/img/pencil.png" style="height: 20px;">
                            질문하기
                        </button>
                    
                </div>
                
                    <nav>
                        <button id="category_1" name="category_1" value="기술" >기술</button>
                        <button  id="category_2" name="category_2" value="커리어" >커리어</button>
                        <button id="category_3" name="category_3" value="기타">기타</button>
                    </nav>
                <div style="visibility: hidden;"></div>
                

            </div>
            <div style="margin-top: 20px;"><hr></div>
            <form name="frmSearch" id="frmSearch" method="get"> 
            <div class="search">
                <div>
                    <div class="orderBy">
                        <select name="search_category" id="search_category" style="margin-left: 60px; margin-top: 22px; height: 30px; width: 100px;">
                            <option value="" selected>선택</option>
                            <option value="readCnt" <c:if test="${params.search_category eq 'readCnt'}"> selected </c:if> >조회순</option>
                            <option value="qnaIdx"<c:if test="${params.search_category eq 'qnaIdx'}"> selected </c:if> >최신순</option>
                        </select>
                    </div>
                </div>
                <div style="margin: 20px 0;">
                    <input type="text" name="search_word" id="search_word" value="<c:if test="${not empty params.search_word}"> ${params.search_word } </c:if>" maxlength="20"  style="height: 30px; width: 500px;"/>
                    &nbsp; <input type="button" name="btn_search" id="btn_search" value="검색"/>
                </div>
               </form>
                    <div style=" display:inline-block; height: 30px; line-height: 30px; margin-top: 26px;">${params.page_no }/${params.page_block_end }</div>
                
            </div>
            
            <div><hr></div>
            <div class="list">
                <ul>
                    
                       <c:choose>
                        	<c:when test="${not empty qnaList}">
                        		<c:forEach var="list" items="${qnaList}" varStatus="loop">
                        			<li>
				                        <button onclick="location.href='viewQnA.do?qnaIdx=${list.qnaIdx}'">
				                            <div>
				                                답변
				                            </div>
				                            <div>
				                                ${list. answerIdx}
				                            </div>
				                        </button> 
				                        <div class="writer">
				                            <div>${list.memberId}</div>
				                            <div>·</div>
				                            <div>${list.regDate}</div>
				                            <div>·</div>
				                            <div>${list.readCnt} read</div>
				                        </div>
				                        <div class="content_title">
				                            <a href="viewQnA.do?qnaIdx=${list.qnaIdx}">
				                                <strong>${list.title}</strong>
				                                <p>
				                                    ${list.content}
				                                </p>
				                                ${list.tags }
				                            </a>
				                        </div><br>
				                        <hr>
				                        <br>
				                    </li>
                        		</c:forEach>
                        	</c:when>
                        	<c:otherwise>
                        	<li>
				                        <button onclick="location.href='#'">
				                            <div>
				                                답변
				                            </div>
				                            <div>
				                                ${list. answerIdx}
				                            </div>
				                        </button> 
				                        <div class="writer">
				                            <div>${list.memberId}</div>
				                            <div>·</div>
				                            <div>${list.regDate}</div>
				                        </div>
				                        <div class="content_title">
				                            <a href="#">
				                                <strong>${list.title}</strong>
				                                <p>
				                                   등록된 게시물이 없습니다.
				                                </p>
				                            </a>
				                        </div>
				                        <hr>
				                    </li>
                        	</c:otherwise>
                        </c:choose>
                       
                </ul>
                <div style="text-align: center; margin: 50px;">
                    <div id="paging">${params.paging }</div>
                </div>
            </div>
        </div>
        
        <!-- 오른쪽사이드 -->
        <div class="side" id="Rside">
            <div id="side_menu">
                <div id="menu_bar">
                <ul>
                    <li>
                        <a href="/okky/board/qna/qna.do">
                            <div>
                                Q&A
                            </div>
                        </a>
                    </li>

                    <li>
                        <a href="/okky/board/community/community.do">
                            <div>
                                커뮤니티
                            </div>
                        </a>
                    </li>

                    <li>
                        <a href="/okky//jobs/jobMain.jsp">
                            <div>
                                구인구직
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            </div>
        </div>
       
    </div>
    <div id="up">
        <a href="#"><img src="/okky/img/up-arrow.png"></a> 
    </div>
    <script>
    
    document.querySelector("#btn_regist").addEventListener("click", function(e) {
    	let id_ck = "${(sessionScope.memberId != null)? sessionScope.memberId : 0}";
    	
		 if (id_ck == "0") { 
				alert("로그인 후 접근이 가능합니다.");
				window.location.href = "/okky/member/login.do";
		 } else {
			 window.location.href = "writeQna.do";
		 }
				
    }, false);
    
    document.querySelector("#btn_search").addEventListener("click", function(e) {

    	e.preventDefault();
    	e.stopPropagation();
    	
    	const search_category = document.querySelector("#search_category");
    	if (search_category.value.length < 1 || search_category.value == "" || search_category.value == null) {
    		alert("검색 구분을 선택하세요");
    		search_category.focus();
    		return false;
    	}
    	
    	const search_word = document.querySelector("#search_word");
    	if (search_word.value.length < 1 || search_word.value == "" || search_word.value == null) {
    		alert("검색어 입력하세요");
    		search_word.focus();
    		return false;
    	}
    	
    	const frm = document.querySelector("#frmSearch");
    	frm.submit();
    	
    	return;

    }, false);
    
    
    document.querySelector("#category_1").addEventListener("click", function(e) {
    	window.location.href = "qna.do?category_1=category_1";
				
    }, false);
    
    document.querySelector("#category_2").addEventListener("click", function(e) {
    	window.location.href = "qna.do?category_2=category_2";
				
    }, false);
    
    document.querySelector("#category_3").addEventListener("click", function(e) {
    	window.location.href = "qna.do?category_3=category_3";
				
    }, false);
    
    

        const sideMenu = document.querySelector("#side_menu");
        let scrollPosition = document.documentElement.scrollTop || 0;
        document.addEventListener('scroll', function(){
            let scrollTop = document.documentElement.scrollTop;
            if(scrollTop > scrollPosition) {
                // down 일 때 처리
                sideMenu.style.visibility = "visible"; 
            } else {
                //up 일 때 처리
                sideMenu.style.visibility = "hidden";
            }
            scrollPosition = scrollTop;
            });
    </script>


    </main>
</body>
</html>