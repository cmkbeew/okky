
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #body {
            display: flex;
            flex-wrap: nowrap;
            justify-content: center;
            margin-top: 20px;
        }
        #main {
            display: grid;
            grid-template-columns: repeat(1, minmax(0, 1fr));
            row-gap: 1.75rem;
        }

        #main h3 {
            font-size: xx-large;
            font-weight: 400;
        }
        #main div p {
            color: #6b7280;
            font-size:smaller;
        }
        #category {
            color: #757575;
        }
        .input_area {
            padding-left:12px;
            width: 826px;
            height: 42px;
            border: 1px solid lightgray;
            border-radius: 5px;
            box-sizing: border-box;
            margin-top: 4px;
        }
        .small_blue {
            font-size: small;
            color:#0090f9;
        }
        label {
            color: #374751;
            font-size: 0.89em;
        }
        #contents {
            width: 820px;
            resize: none;
            border: 1px solid lightgray;
            border-radius: 5px;
            margin-top: 4px;
        }
        #frmBtn {
        
            float: right;
            margin-top: 100px;
            list-style-type: none;
        }
        #frmBtn li {
            float:left;
        }
        #frmBtn li:first-child {
            margin-right: 10px;
        }
        .frmBtns {
            border: 1px solid lightgray;
            border-radius: 0.375rem;
            background-color: #fff;
            height: 40px;
            width: 80px;
        }
        #submitBtn {
            background-color: #0090f9;
            color: #fff;
        }
        .contents textarea {
            width: 826px;
            resize: none;
            border: 1px solid lightgray;
            height: 400px;
        }
        #commentArea textarea {
            resize: none;
            width: 826px;
            height: 100px;
        }
        #commentArea #submit {
            float: right;
            border: 1px solid lightgray;
            border-radius: 5px;
            background-color: #0090f9;
            color: #fff;
            height: 30px;
            width: 80px;
            font-size: 14px;
        }
        #commentArea #submit:hover {
            cursor: pointer;
        }
        #tagAndGood {
            display: flex;
            justify-content: space-between;
        }
        #tagAndGood ul {
            list-style: none;
            display: flex;
            padding: 0;
        }
        #tagAndGood ul li {
            margin: 10px;
            text-align: center;

        }
        #tags ul li{
            border: 1px solid lightgray;
            padding: 5px;
            width: max-content;
            border-radius: 10px;
            margin: 5px;
        }
        #goods ul li button {
            border: 0;
            background-color: #fff;
        }
        .writer {
            display: flex;
            height: 30px;
            line-height: 30px;
            font-size: smaller;
        }
        .writer div {
            margin-right: 10px;
            margin-bottom: 10px;
            font-size: smaller;
        }
        .commentList ul {
            list-style: none;
            padding: 0;
        }
        .commentList ul li {
            
        }
        .deleteAndmodify {
        	display:flex;
        	justify-content: flex-end;
        }
        .deleteAndmodify input {
        	margin: 5px;
        	border: 1px solid lightgray;
            border-radius: 5px;
            cursor: pointer;
        }
        #goods button {
        	cursor: pointer;
        }
    </style>
</head>
<body>
<jsp:include page="/common/header.jsp"/>
    <div id="body">
        <div id="container">
            <div class="side">

            </div>
            
            <div id="main">
                <div>
                    <h3>Q&A</h3>
                    <p>
                       작성자 : <strong>${params.nickName }</strong>
                    </p>
                </div>
                <div class="contents">
                    <h3>${params.title }</h3>
                    <div>작성자 ID : ${params.memberId }</div>
                    <br>
                    <div>조회수 : ${params.readCnt }</div>
                    <br>
                    <div>작성일 : ${params.regDate }</div>
                    <br>
                    <div>카테고리 : ${params.category }</div>
                    <div class="deleteAndmodify">
		                <input  type="button" style="background-color: #0090f9; color: white;" name="btn_modify" id="btn_modify" value="수정하기">
						<input type="button" style="background-color: #fff;" name="btn_delete" id="btn_delete" value="삭제하기"><br><br>
					
					</div>
                    <textarea name="" id="" cols="30" rows="10" readonly disabled>${params.content }</textarea>
                </div>
                <div id="tagAndGood">
                    <div id="tags">
                        <ul>
                            <li>#태그1</li>
                            <li>#태그2</li>
                            <li>#태그3</li>
                        </ul>
                    </div>
                    <div id="goods">
                       
                            <ul>
                                <li><button id="up" name="up"><img src="/okky/img/thumb_up.png" alt=""></button>  </li>
                                <li>${params.pageLike }</li>
                                <li><button id="down" name="down"><img src="/okky/img/thumb_down.png" alt=""></button>  </li>
                                <li>${params.pageDislike }</li>
                            </ul>
                        
                    </div>
                </div>
                
                <div id="commentArea">
                    <p>
                        1개의 댓글
                    </p>
                    <form action="" method="post">
                        <textarea name="comment" id="comment" cols="30" rows="10"></textarea><br><br>
                        <input type="submit" id="submit" name="submit" value="댓글작성">
                        <div id="commentCheck" style="color: red; font-size: x-small; display: none;">댓글을 입력해 주세요.</div>
                    </form>
                    <br><br>
                    <div class="commentList">
                        <ul>
                            <li>
                                <hr>
                                <div class="writer">
                                    <div>댓닉네임</div>
                                    <div>·</div>
                                    <div>댓작성일</div>
                                </div>
                                <div class="content_title">
                                    <p>[댓글내용]</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
            <div class="side">

            </div>
        </div>
    </div>
    <script>
        document.querySelector("#submit").addEventListener("click", (e)=> {
            const comment = document.querySelector("#comment");
            const commentCheck = document.querySelector("#commentCheck");

            if (comment.value.length < 1) {
                commentCheck.style.display = "block";
                comment.focus();
                e.preventDefault();
                return false;
            }
        });
        
        document.querySelector("#btn_delete").addEventListener("click", function(e) {
        	
        	
        	
        	
        	let id_ck = "${(sessionScope.memberId != null)? sessionScope.memberId : 0}";
        	
			 if (id_ck == "0") { 
					alert("로그인 후 접근이 가능합니다.");
					window.location.href = "/okky/member/login.do";
			 } else if ("${sessionScope.memberIdx}" != "${params.memberIdx}") { 
					alert("자신의 글만 삭제가 가능합니다.");
					window.location.href = "viewQnA.do?qnaIdx=${params.qnaIdx}";
			}else { 
				let confirm_yn = confirm("현재 글을 삭제하시겠습니까?");
				if (confirm_yn) { 
					window.location.href = "deleteQna.do?qnaIdx=${params.qnaIdx}&memberId=${sessionScope.memberId}";	
			 	}
			} 

        }, false);

      document.querySelector("#btn_modify").addEventListener("click", function(e) {

    	  let id_ck = "${(sessionScope.memberId != null)? sessionScope.memberId : 0}";
      	
			 if (id_ck == "0") { 
					alert("로그인 후 접근이 가능합니다.");
					window.location.href = "/okky/member/login.do";
			 } else if ("${sessionScope.memberIdx}" != "${params.memberIdx}") { 
					alert("자신의 글만 수정이 가능합니다.");
					window.location.href = "viewQnA.do?qnaIdx=${params.qnaIdx}";
			}else { 
				let confirm_yn = confirm("현재 글을 수정 하시겠습니까?");
				if (confirm_yn) { 
        			window.location.href = "modifyQnA.do?qnaIdx=${params.qnaIdx}";
				}
			}
        }, false);
     
        
      document.querySelector("#up").addEventListener("click", function(e) {
          window.location.href = "viewQnA.do?qnaIdx=${params.qnaIdx}";
      }, false);
        
      document.querySelector("#down").addEventListener("click", function(e) {
          window.location.href = "viewQnA.do?qnaIdx=${params.qnaIdx}";
      }, false);
    </script>
</body>
</html>