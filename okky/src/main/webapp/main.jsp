<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
       
        #container {
            width:100%;
            margin: 100px auto;
            height: 100%;
            display: flex;
            justify-content: space-between;
        }
        #main {
            /* width: 60%;
            float:left; */
        }
        .side {
            width: 20%
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
            grid-template-columns: repeat(2, 300px);
            grid-gap: 60px 150px;
        
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
        }
        .top_writer {
            display: flex;
            justify-content: space-between;
            margin: 10px;
        }
        .writer div {
            margin-right: 10px;
            margin-bottom: 10px;
        }
        
        
        a {
            text-decoration: none;
            color:black
        }
        a:hover {
            color: #0090f9;
        }
        .info {
            height: 50px;
            line-height: 50px;
            border: 1px solid black;
            border-radius: 20px;
            display: flex;
            justify-content: space-between;
            padding-left: 20px;
            padding-right: 20px;

        }
        .info span {
            display: inline-block;
        }
        #top_title {
            height: 30px;
            line-height: 30px;
            margin: 10px;
        }
    </style>
</head>
<body>
        <div id="container">
            <div class="side" id="Lside">
                <div id="top_title"><span>Top writers</span></div>
                    
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
                    <a href="#">
                        <div class="info">
                            <span>Q&A</span>
                            <img src="img/question.png"/>			
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
                                <div>
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
                                <div>
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
                                <div>
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
                                <div>
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
                                <div>
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="content">
                    <a href="#">
                        <div class="info">
                            <span>커뮤니티</span>
                            <img src="img/community.png">			
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
                                <div>
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
                                <div>
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
                                <div>
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
                                <div>
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
                                <div>
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="content">
                    <a href="#">
                        <div class="info">
                            <span>WEEKLY BEST</span>	
                            <img src="img/best.png">		
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
                                <div>
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
                                <div>
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
                                <div>
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
                                <div>
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
                                <div>
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="content">
                    <a href="#">
                        <div class="info">
                            <span>공지사항</span>	
                            <img src="img/notice.png">		
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
                                <div>
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
                                <div>
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
                                <div>
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
                                <div>
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
                                <div>
                                    <a href="#">요새 자바는 opensdk로 많이 가나요?</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
            <div class="side" id="Rside">
                    사이드바영역<br>사이드바영역<br>사이드바영역<br>
            </div>
        </div>
    </body>
</html>