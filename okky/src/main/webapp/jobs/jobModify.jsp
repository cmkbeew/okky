<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고 등록 페이지</title>
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
        #recruitContent {
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
        #selectSal {
            display: grid;
            width: 100%;
            grid-template-columns: repeat(3, 1fr);
            grid-template-areas: 
                "select" "select" "select";
        }
        #selectCon{
            display: grid;
            width: 100%;
            grid-template-columns: repeat(4, 1fr);
            grid-template-areas: 
                "select" "select" "select" "select";
        }
        #selectCon select {
            width: 90%;
            padding: 16px 20px;
            border: 1px solid lightgray;
            border-radius: 4px;
            font-size:15px ;
        }
        #frmBtn input {
        	cursor: pointer;
        }
        input[readonly] {
        	background-color: #c6c6c6;
        }
    </style>
</head>
<body>
<jsp:include page="/common/header.jsp"/>
    <div id="body">
        <div id="container">
            <div class="side">

            </div>
            <form id="frm" method="post" action="./jobModify.do">
            	<input type="hidden" id="recruitIdx" name="recruitIdx" value="${jobView.recruitIdx}" />
                <div id="main">
                    <div>
                        <h3>회사 공고 수정</h3>
	                        <p>
	                            <c:if test="${ not empty jobView.recruitTitle}">
	                            	<strong>${jobView.recruitTitle}</strong>
	                            </c:if>
	                             의 제목을 가진 공고를 수정하세요.
	                        </p>
                        	
                       		<c:if test="${not empty recruitErrMsg}">
                       			<p style="color: red; font-size: 18px; display: none;">
                       				${recruitErrMsg}
                       			</p>
                       		</c:if>
                        	
                    </div>
                    <div>
                        <label for="recruitTitleLabel">공고 제목</label><br>
                        <input type="text" id="recruitTitle" name="recruitTitle" placeholder="공고 제목을 입력해주세요." value="${jobView.recruitTitle}" class="input_area"  />
                        <div id="recruitTitleCheck" style="color: red; font-size: x-small; display: none;">공고 제목을 입력해주세요.</div>
                    </div>
                    <div>
                        <label for="companyName">회사명</label><br>
                        <input type="text" id="companyName" name="companyName" value="${jobView.companyName}" class="input_area" readonly />
                        <div id="companyNameCheck" style="color: red; font-size: x-small; display: none;">회사명을 입력해주세요.</div>
                    </div>
                    <div>
                        <label for="managerName">담당자 이름</label><br>
                        <input type="text" id="managerName" name="managerName" value="${jobView.managerName}" class="input_area" readonly />
                        <div id="managerNameCheck" style="color: red; font-size: x-small; display: none;">담당자 이름을 입력해주세요.</div>
                    </div>
                    <div>
                        <label for="managerPhone">담당자 연락처</label><br>
                        <input type="text" id="managerPhone" name="managerPhone" value="${jobView.managerPhone}" class="input_area" readonly />
                        <div id="managerPhoneCheck" style="color: red; font-size: x-small; display: none;">담당자 연락처를 입력해주세요.</div>
                    </div>
                    <div>
                        <label for="companyAddr">회사 주소</label><br>
                        <input type="text" id="companyAddr" name="companyAddr" value="${jobView.companyAddr}" class="input_area" readonly />
                        <div id="companyAddrCheck" style="color: red; font-size: x-small; display: none;">회사 주소를 입력해주세요.</div>
                    </div>
                    <div>
                        <label for="dueDateLabel">마감 기한</label><br>
                        <input type="date" id="dueDate" name="dueDate" class="input_area" value="${jobView.dueDate}"/>
                        <div id="dueDateCheck" style="color: red; font-size: x-small; display: none;">마감 기한을 입력해주세요.</div>
                    </div>
                    <div id="selectCon">
                    	<div>
                            <select name="salary" id="salary">
                                <option value="">연봉</option>
                                <option value="2000만원 미만" <c:if test="${jobView.salary eq '2000만원 미만'}">selected</c:if>>2000만원 미만</option>
                                <option value="2000~2999만원" <c:if test="${jobView.salary eq '2000~2999만원'}">selected</c:if>>2000~2999만원</option>
                                <option value="3000~3999만원" <c:if test="${jobView.salary eq '3000~3999만원'}">selected</c:if>>3000~3999만원</option>
                                <option value="4000~4999만원" <c:if test="${jobView.salary eq '4000~4999만원'}">selected</c:if>>4000~4999만원</option>
                                <option value="5000만원 이상" <c:if test="${jobView.salary eq '5000만원 이상'}">selected</c:if>>5000만원 이상</option>
                                <option value="면접 시 협의" <c:if test="${jobView.salary eq '면접 시 협의'}">selected</c:if>>면접 시 협의</option>
                            </select>
                            <div id="salaryCheck" style="color: red; font-size: x-small; display: none;">연봉을 선택해주세요.</div>
                        </div>
                    	<div>
                            <select name="position" id="position">
                                <option value="">포지션</option>
                                <option value="백엔드" <c:if test="${jobView.position eq '백엔드'}">selected</c:if>>백엔드</option>
                                <option value="프론트" <c:if test="${jobView.position eq '프론트'}">selected</c:if>>프론트</option>
                                <option value="DBA" <c:if test="${jobView.position eq 'DBA'}">selected</c:if>>DBA</option>
                                <option value="풀스택" <c:if test="${jobView.position eq '풀스택'}">selected</c:if>>풀스택</option>
                                <option value="PM" <c:if test="${jobView.position eq 'PM'}">selected</c:if>>PM</option>
                                <option value="기타" <c:if test="${jobView.position eq '기타'}">selected</c:if>>기타</option>
                            </select>
                            <div id="positionCheck" style="color: red; font-size: x-small; display: none;">포지션을 선택해주세요.</div>
                        </div>
                        <div>
                            <select name="contractType" id="contractType">
                                <option value="">계약 형태</option>
                                <option value="정규직" <c:if test="${jobView.contractType eq '정규직'}">selected</c:if>>정규직</option>
                                <option value="계약직" <c:if test="${jobView.contractType eq '계약직'}">selected</c:if>>계약직</option>
                            </select>
                            <div id="contractTypeCheck" style="color: red; font-size: x-small; display: none;">계약 형태를 선택해주세요.</div>
                        </div>
                        <div>
                            <select name="career" id="career">
                                <option value="">경력</option>
                                <option value="무관" <c:if test="${jobView.career eq '무관'}">selected</c:if>>무관</option>
                                <option value="신입" <c:if test="${jobView.career eq '신입'}">selected</c:if>>신입</option>
                                <option value="1~2년" <c:if test="${jobView.career eq '1~2년'}">selected</c:if>>1~2년</option>
                                <option value="3~4년" <c:if test="${jobView.career eq '3~4년'}">selected</c:if>>3~4년</option>
                                <option value="5~6년" <c:if test="${jobView.career eq '5~6년'}">selected</c:if>>5~6년</option>
                                <option value="7년 이상" <c:if test="${jobView.career eq '7년 이상'}">selected</c:if>>7년 이상</option>
                            </select>
                            <div id="careerCheck" style="color: red; font-size: x-small; display: none;">경력을 선택해주세요.</div>
                        </div>
                    </div>
                    <div>
                        <label for="recruitContent">공고 본문</label><br>
                        <textarea id="recruitContent" name="recruitContent" cols="100" rows="20" placeholder="공고 글을 10자 이상 입력해 주세요.">${jobView.recruitContent}</textarea>
                        <div id="recruitContentCheck" style="color: red; font-size: x-small; display: none;">공고 글을 10자 이상 입력하세요.</div>
                    </div>
                    <div>
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
        let submit = document.querySelector("#submitBtn");
       
        submit.addEventListener("click", (e) => {
          
            const recruitTitle = document.querySelector("#recruitTitle");
            const companyName = document.querySelector("#companyName");
            const managerName = document.querySelector("#managerName");
            const managerPhone = document.querySelector("#managerPhone");
            const companyAddr = document.querySelector("#companyAddr");
            const dueDate = document.querySelector("#dueDate");
            const salary = document.querySelector("#salary");
            const position = document.querySelector("#position");
            const contractType = document.querySelector("#contractType");
            const career = document.querySelector("#career");
            const recruitContent = document.querySelector("#recruitContent");
            
            if (recruitTitle.value == "") {
                document.querySelector("#recruitTitleCheck").style.display = "block";
                recruitTitle.focus();
                e.preventDefault();
                return false;
            }
            if (companyName.value == "") {
                document.querySelector("#companyNameCheck").style.display = "block";
                companyName.focus();
                e.preventDefault();
                return false;
            }
            if (managerName.value == "") {
                document.querySelector("#managerNameCheck").style.display = "block";
                managerName.focus();
                e.preventDefault();
                return false;
            }
            if (managerPhone.value == "") {
                document.querySelector("#managerPhoneCheck").style.display = "block";
                managerPhone.focus();
                e.preventDefault();
                return false;
            }
            if (companyAddr.value == "") {
                document.querySelector("#companyAddrCheck").style.display = "block";
                companyAddr.focus();
                e.preventDefault();
                return false;
            }
            if (dueDate.value == "") {
                document.querySelector("#dueDateCheck").style.display = "block";
                dueDate.focus();
                e.preventDefault();
                return false;
            }
            if (salary.value == "") {
                document.querySelector("#salaryCheck").style.display = "block";
                salary.focus();
                e.preventDefault();
                return false;
            }
            if (position.value == "") {
            	document.querySelector("#positionCheck").style.display = "block";
            	position.focus();
                e.preventDefault();
                return false;
            }
            if (contractType.value == "") {
            	document.querySelector("#contractTypeCheck").style.display = "block";
            	contractType.focus();
                e.preventDefault();
                return false;
            }
            if (career.value == "") {
            	document.querySelector("#careerCheck").style.display = "block";
            	career.focus();
                e.preventDefault();
                return false;
            }
            
            if (recruitContent.value.length < 10) { 
            	document.querySelector("#recruitContentCheck").style.display = "block";
            	recruitContent.focus();
                e.preventDefault();
                return false;
            } 
            
            return true;
        });
    </script>
</body>
</html>