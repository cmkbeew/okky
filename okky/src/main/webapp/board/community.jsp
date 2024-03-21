<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            margin-top: 200px;
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
            <a id="relative">
                <div class="info">
                    <span>Community</span>
                    <span class="small">다양한 사람을 만나고 생각의 폭을 넓혀보세요.</span>
                    
                </div>
                <img src="https://okky.kr/community.svg"/>	
            </a>
            <div class="nav">
                <div>
                    <a href="./write.html">
                        <button style="width: 100px; background-color: #0090f9; border-radius: 5px; color: #fff; height: 36px;">
                            <img src="img/pencil.png" style="height: 20px;"></a>
                            작성하기
                        </button>
                    </a>
                </div>
                
                    <nav>
                        <button>일상</button>
                        <button>공부</button>
                        <button>공지사항</button>
                    </nav>
                <div style="visibility: hidden;"></div>
                

            </div>
            <div style="margin-top: 20px;"><hr></div>
            <form>
            <div class="search">
                <div>
                    <div class="orderBy">
                        <select name="search_category" id="search_category" style="margin-left: 60px; margin-top: 22px; height: 30px; width: 100px;">
                            <option value="" selected>전체</option>
                            <option value="view" >조회순</option>
                            <option value="recent" >최신순</option>
                        </select>
                    </div>
                </div>
                <div style="margin: 20px 0;">
                    <input type="text" name="search_word" id="search_word" value="" maxlength="20"  style="height: 30px; width: 500px;"/>
                    &nbsp; <input type="button" name="btn_search" id="btn_search" value="검색"/>
                </div>
               
                    <div style=" display:inline-block; height: 30px; line-height: 30px; margin-top: 26px;">1/120</div>
                
            </div>
            </form>
            <div><hr></div>
            <div class="list">
                <ul>
                    <li>
                        <button onclick="location.href='#'">
                            <div>
                                답변
                            </div>
                            <div>
                                2
                            </div>
                        </button>    
                        <div class="writer">
                            <div>작성자</div>
                            <div>·</div>
                            <div>작성일</div>
                        </div>
                        <div class="content_title">
                            <a href="#">
                                <strong>요새 자바는 opensdk로 많이 가나요?</strong>
                                <p>
                                    글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용
                                </p>
                            </a>
                        </div>
                        <hr>
                    </li>
                    <li>
                        <button onclick="location.href='#'">
                            <div>
                                답변
                            </div>
                            <div>
                                2
                            </div>
                        </button> 
                        <div class="writer">
                            <div>작성자</div>
                            <div>·</div>
                            <div>작성일</div>
                        </div>
                        <div class="content_title">
                            <a href="#">
                                <strong>요새 자바는 opensdk로 많이 가나요?</strong>
                                <p>
                                    글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용
                                </p>
                            </a>
                        </div>
                        <hr>
                    </li>
                    <li>
                        <button onclick="location.href='#'">
                            <div>
                                답변
                            </div>
                            <div>
                                2
                            </div>
                        </button> 
                        <div class="writer">
                            <div>작성자</div>
                            <div>·</div>
                            <div>작성일</div>
                        </div>
                        <div class="content_title">
                            <a href="#">
                                <strong>요새 자바는 opensdk로 많이 가나요?</strong>
                                <p>
                                    글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용
                                </p>
                            </a>
                        </div>
                        <hr>
                    </li>
                    <li>
                        <button onclick="location.href='#'">
                            <div>
                                답변
                            </div>
                            <div>
                                2
                            </div>
                        </button> 
                        <div class="writer">
                            <div>작성자</div>
                            <div>·</div>
                            <div>작성일</div>
                        </div>
                        <div class="content_title">
                            <a href="#">
                                <strong>요새 자바는 opensdk로 많이 가나요?</strong>
                                <p>
                                    글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용
                                </p>
                            </a>
                        </div>
                        <hr>
                    </li>
                    <li>
                        <button onclick="location.href='#'">
                            <div>
                                답변
                            </div>
                            <div>
                                2
                            </div>
                        </button> 
                        <div class="writer">
                            <div>작성자</div>
                            <div>·</div>
                            <div>작성일</div>
                        </div>
                        <div class="content_title">
                            <a href="#">
                                <strong>요새 자바는 opensdk로 많이 가나요?</strong>
                                <p>
                                    글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용
                                </p>
                            </a>
                        </div>
                        <hr>
                    </li>
                    <li>
                        <button onclick="location.href='#'">
                            <div>
                                답변
                            </div>
                            <div>
                                2
                            </div>
                        </button> 
                        <div class="writer">
                            <div>작성자</div>
                            <div>·</div>
                            <div>작성일</div>
                        </div>
                        <div class="content_title">
                            <a href="#">
                                <strong>요새 자바는 opensdk로 많이 가나요?</strong>
                                <p>
                                    글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용
                                </p>
                            </a>
                        </div>
                        <hr>
                    </li>
                    <li>
                        <button onclick="location.href='#'">
                            <div>
                                답변
                            </div>
                            <div>
                                2
                            </div>
                        </button> 
                        <div class="writer">
                            <div>작성자</div>
                            <div>·</div>
                            <div>작성일</div>
                        </div>
                        <div class="content_title">
                            <a href="#">
                                <strong>요새 자바는 opensdk로 많이 가나요?</strong>
                                <p>
                                    글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용
                                </p>
                            </a>
                        </div>
                        <hr>
                    </li>
                    <li>
                        <button onclick="location.href='#'">
                            <div>
                                답변
                            </div>
                            <div>
                                2
                            </div>
                        </button> 
                        <div class="writer">
                            <div>작성자</div>
                            <div>·</div>
                            <div>작성일</div>
                        </div>
                        <div class="content_title">
                            <a href="#">
                                <strong>요새 자바는 opensdk로 많이 가나요?</strong>
                                <p>
                                    글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용
                                </p>
                            </a>
                        </div>
                        <hr>
                    </li>
                    <li>
                        <button onclick="location.href='#'">
                            <div>
                                답변
                            </div>
                            <div>
                                2
                            </div>
                        </button> 
                        <div class="writer">
                            <div>작성자</div>
                            <div>·</div>
                            <div>작성일</div>
                        </div>
                        <div class="content_title">
                            <a href="#">
                                <strong>요새 자바는 opensdk로 많이 가나요?</strong>
                                <p>
                                    글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용
                                </p>
                            </a>
                        </div>
                        <hr>
                    </li>


                </ul>
                <div style="text-align: center; margin: 50px;">
                    &lt;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;4&nbsp;&nbsp;&nbsp;5&nbsp;&nbsp;&nbsp;...&nbsp;&nbsp;&nbsp;130&nbsp;&nbsp;&gt;
                </div>
            </div>
        </div>
        
        <!-- 오른쪽사이드 -->
        <div class="side" id="Rside">
            <div id="side_menu">
                <div id="menu_bar">
                <ul>
                    <li>
                        <a href="#">
                            <div>
                                Q&A
                            </div>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <div>
                                커뮤니티
                            </div>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <div>
                                구인구직
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div>
                                공지사항
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            </div>
        </div>
       
    </div>
    <div id="up">
        <a href="#"><img src="img/up-arrow.png"></a> 
    </div>
    <script>

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
</head>
<body>

</body>
</html>