<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<style>
       
        #container {
            width:100%;
            margin: 100px auto;
            height: 100%;
            display: flex;
            justify-content: space-between;
        }
        #main {
        }
        .side {
            width: 15%;
        }
        #Lside {
            margin-left: 100px;
            /* float:left; */
            
        }
        #Rside {
            margin-right: 100px;
            /* float: left; */
        }
        
        .article {
            width: fit-content;
            padding: 0;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(2, 400px);
            grid-gap: 60px 60px;
        
        }
        .content {
            width: 100%;
            padding : 0;
            margin: 0 auto;
        }
        ul {
            list-style:none;
            padding: 0;
        }
        li {
            
        }
        .writer {
            display: flex;
            height: 30px;
            line-height: 30px;
            font-size: smaller;
        }
        .top_writer {
            display: flex;
            justify-content: space-between;
            margin: 10px;
        }
        .writer div {
            margin-right: 10px;
            margin-bottom: 10px;
            font-size: smaller;
        }
        
        
        a {
            text-decoration: none;
            color:black
        }
        a:hover {
            color: #0090f9;
        }
        .info {
            height: 64px;
            font-weight: 500;
            font-size: larger;
            line-height: 64px;
            border: 0;
            border-radius: 10px;
            display: flex;
            justify-content: space-between;
            padding-left: 20px;
            padding-right: 20px;
            background-color: rgb(227, 227, 232);
        }

        .info span {
            display: inline-block;
        }
        #top_title {
            height: 30px;
            line-height: 30px;
            margin: 10px;
        }
        .content_title a {
            font-weight: 700;
        }
        #side_menu {
            margin-top: 30px;
            margin-left: 50px;
            visibility: hidden;
            position: fixed;
            
        }
        #menu_bar {
            
        }
        #side_menu li{
            height: 100px;
            width: 100px;
            line-height: 100px;
            text-align: center;
            border: 2px solid;
            border-radius: 50%;
            margin: 6px;
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
    </style>
</head>
<body>
<%@ include file="/common/header.jsp" %>
        <div id="container">
            <div class="side" id="Lside">
                <div id="top_title"><span><h2>Top writers</h2></span></div>
                    
                <div><hr></div>
                <div>
                    <ul>
                        <li>
                            <div class="top_writer">
                                <div>작성자</div>
                                <div>추천수</div>
                            </div>
                        </li>
                        <li> <div class="top_writer">
                            <div>작성자</div>
                            <div>추천수</div>
                        </div></li>
                        <li> <div class="top_writer">
                            <div>작성자</div>
                            <div>추천수</div>
                        </div></li>
                        <li> <div class="top_writer">
                            <div>작성자</div>
                            <div>추천수</div>
                        </div></li>
                        <li> <div class="top_writer">
                            <div>작성자</div>
                            <div>추천수</div>
                        </div></li>
                    </ul>
                </div>
                
            </div>
            <div id="main">
            <div class="article">
                <div class="content">
                    <a href="/okky/board/qna.jsp">
                        <div class="info">
                            <span>Q&A</span>
                            <img src="https://okky.kr/questions.svg"/>			
                        </div>
                    </a>
                    <div>
                        <ul>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                            <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                                <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                                <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                                <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="content">
                    <a href="/okky/board/community.jsp">
                        <div class="info">
                            <span>커뮤니티</span>
                            <img src="https://okky.kr/community.svg">			
                        </div>
                    </a>
                    <div>
                        <ul>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                                <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                                <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                                <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                                <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="content">
                    <div>
                        <div class="info">
                            <span>WEEKLY BEST</span>	
                            <img src="https://okky.kr/weekly-best.svg">		
                        </div>
                    </div>
                    <div>
                        <ul>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                                <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                                <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                                <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                                <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="content">
                    <div>
                        <div class="info">
                            <span>공지사항</span>	
                            <img src="https://okky.kr/notice.svg">		
                        </div>
                    </div>
                    <div>
                        <ul>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                                <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                                <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                                <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                                <li><hr></li>
                            <li>
                                <div class="writer">
                                    <div>작성자</div>
                                    <div>·</div>
                                    <div>작성일</div>
                                </div>
                                <div class="content_title">
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
            <div class="side" id="Rside">
                <div id="side_menu">
                    <div id="menu_bar">
                    <ul>
                    <li>
                        <a href="qna.jsp">
                            <div>
                                Q&A
                            </div>
                        </a>
                    </li>

                    <li>
                        <a href="community.jsp">
                            <div>
                                커뮤니티
                            </div>
                        </a>
                    </li>

                    <li>
                        <a href="/jobs/jobMain.jsp">
                            <div>
                                구인구직
                            </div>
                        </a>
                    </li>
                </ul>
                </div>
                </div>
            </div>
            <div id="up">
                <a href="#"><img src="img/up-arrow.png"></a> 
            </div>
        </div>
        <script>

            // const sideMenu = document.querySelector("#side_menu");
            // window.addEventListener("scroll", (e)=> {
            //     sideMenu.style.visibility = "visible";
            // });
            // window.addEventListener("scrolldown", (e)=> {
            //     sideMenu.style.visibility = "hidden";
            // });

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
    </body>
</html>