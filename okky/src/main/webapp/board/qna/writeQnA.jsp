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
            justify-content: space-evenly;
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
        #content {
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
         #selectCon{
            display: grid;
            width: 100%;
            grid-template-columns: repeat(3, 1fr);
            grid-template-areas: 
                "select" "select" "select";
        }
        #selectCon select {
            width: 90%;
            padding: 16px 20px;
            border: 1px solid lightgray;
            border-radius: 4px;
            font-size:15px ;
            margin: 10px;
        }
       #frmBtn input {
        	cursor: pointer;
        }
    </style>
</head>
<body>
<%
if (session.getAttribute("memberId") == null) {
	out.println("<script>");
	out.println("alert('로그인 후 접근이 가능합니다.')");
	out.println("window.location.replace('/okky/member/login.do')");
	out.println("</script>");
}
%>
<jsp:include page="/common/header.jsp"/>
    <div id="body">
        <div id="container">
            <div class="side">

            </div>
            <form id="frm" method="post" action="writeQna.do">
            <div id="main">
                <div>
                    <h3>기술 궁금증 해결하기</h3>
                    <p>
                        <strong>${sessionScope.memberId }</strong>님 지식공유 플랫폼 OKKY에서 최고의 개발자들과 함께 궁금증을 해결하세요.
                    </p>
                </div>
               
                    
                        <div>
                        <input type="hidden" id="memberIdx" name="memberIdx" value="<%= session.getAttribute("memberIdx")%>">
                            <label for="category" class="" >토픽</label><br>
                            <select id="category" name="category" class="input_area">
                                <option value="">토픽을 선택해주세요.</option>
                                <option value="기술">기술</option>
                                <option value="커리어">커리어</option>
                                <option value="기타">기타</option>
                            </select>
                            <div id="optionCheck" style="color: red; font-size: x-small; display: none;">토픽을 하나 이상 선택해 주세요.</div>
                        </div>
                        <div>
                            <label for="title">제목</label><br>
                            <input type="text" id="title" name="title" placeholder="제목을 입력해주세요." class="input_area">
                            <div id="titleCheck" style="color: red; font-size: x-small; display: none;">제목은 50자 이하로 입력해 주세요.</div>
                        </div>
                        <!-- <div>
                            <label for="tags">태그 - <span class="small_blue">내용을 대표하는 태그를 입력해주세요. 태그는 공백 하나로 구분됩니다.</span></label><br>
                            <input type="text" id="tags" name="tags" placeholder="태그를 입력해주세요." class="input_area">
                            <div id="tagCheck" style="color: red; font-size: x-small; display: none;">태그는 3개 이상 입력할 수 없습니다.</div>
                        </div> -->
                        <br>
                        <label>태그 - <span class="small_blue">내용을 대표하는 태그를 입력해주세요. 태그는 공백 하나로 구분됩니다.</span></label>
                        <div id="selectCon">
                    <div>
                        <select name="skill" id="skill_1st">
                            <option value="">선택 1</option>
                            <option value="skill1">스킬1</option>
                            <option value="skill2">스킬2</option>
                            <option value="skill3">스킬3</option>
                        </select>
                    </div>
                    <div>
                        <select name="skill" id="skill_2nd">
                            <option value="">선택 2</option>
                            <option value="skill1">스킬1</option>
                            <option value="skill2">스킬2</option>
                            <option value="skill3">스킬3</option>
                        </select>
                    </div>
                    <div>
                        <select name="skill" id="skill_3rd">
                            <option value="">선택 3</option>
                            <option value="skill1">스킬1</option>
                            <option value="skill2">스킬2</option>
                            <option value="skill3">스킬3</option>
                        </select>
                    </div>
                </div>
                        <div>
                            <label for="content">본문</label><br>
                            <textarea id="content" name="content" cols="100" rows="20"placeholder="본문을 10자 이상 입력해 주세요."></textarea>
                            <div id="contentsCheck" style="color: red; font-size: x-small; display: none;">본문을 10자 이상 입력하세요.</div>
                        </div>
                        <div >
                            <ul id="frmBtn">
                                <li>
                                    <input type="reset" id="resetBtn" class="frmBtns" value="취소">
                                </li>
                                <li>
                                    <input type="submit" id="submitBtn" class="frmBtns" value="등록">
                                </li>
                            </ul>
                        </div>
                    
                </div>
            </form>
            </div>
        </div>
            <div class="side">

            </div>
        </div>
    </div>
    <script>
        // let select = document.querySelectorAll("#category");

        let submit = document.querySelector("#submitBtn");
       

            
        submit.addEventListener("click", (e) => {
        	

          
            let select = document.querySelector("#category");
            const title = document.querySelector("#title");
            const content = document.querySelector("#contents");
            /* let tags = document.querySelector("#tags").value; */
            const titleCheck = document.querySelector("#titleCheck");
       /*      const tagCheck = document.querySelector("#tagCheck"); */
            const optionCheck = document.querySelector("#optionCheck");
            const contents = document.querySelector("#content");
            const contentsCheck = document.querySelector("#contentsCheck");
           /*  let tagArr = tags.trim().split(" ");
            console.log(tagArr);

            for (let i=0; i<tagArr.length; i++) {
                if (tagArr[i] == "") {
                    tagArr.splice(i);
                }
            }

            console.log(tagArr); */

            if (select.value == "") {
                optionCheck.style.display = "block";
                select.focus();
                e.preventDefault();
                return false;
            }
            if (title.value.length < 1) {
                titleCheck.style.display = "block";
                title.focus();
                titleCheck.textContent = "제목은 필수 입력 사항입니다.";
                e.preventDefault();
                return false;
            }
            if (title.value.length > 50) { 
                titleCheck.style.display = "block";
                title.focus();
                e.preventDefault();
                return false;
            } 

           
           /*  if (tagArr.length > 3) {
                tagCheck.style.display = "block";
                tags.focus();
                e.preventDefault();
                return false;
            }  */
			if (contents.value.length < 10) {
				contentsCheck.style.display = "block";
				contents.focus();
                e.preventDefault();
                return false;
			}
        
          
            
            return true;
        });

        


    </script>
</body>
</html>