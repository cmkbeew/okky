<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회사 페이지</title>
    <style>
        * {
            margin :0;
            padding: 0;
            list-style: none;
            text-decoration: none;
            box-sizing: border-box;
        }
        
        #container {
            margin: 0 auto;
            width: 1200px;
            height: 800px;
        }
        /* 사이드바 영역 */
        #sidebar {
            border-right: 1px solid rgb(158, 158, 158);
            box-shadow: 3px 0px 3px rgb(162, 162, 162);
            width: 15%;
            height: 800px;
            display: block;
            float: left;
        }
        h3 {
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        #sidebar a{
            color: black;
        }
        #sidebar li {
            font-size: 16px;
            display: block;
            height: 60px;
            line-height: 60px;
            padding: 5px 10px;
        }
        #sidebar a[href *= "mypage"] > li  {
            background-color: #d2d2d2;
            transition: 0.3s;
            opacity: 0.8;
            border-radius : 20px;
        }
        #sidebar li img {
            transform: translateY(8px);
            margin: 0 3px;
        }
        .detail:hover {
            background-color: #d2d2d2;
            transition: 0.3s;
            opacity: 0.8;
           	border-radius : 20px;
        }

        /* 본문 영역 */
        #outer {
            position: relative;
            width: 85%;
            height: 800px;
            float: left;
        }
        #infoForm input[type=text] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            float: left;
            border: 1px solid #8e8e8e;
            border-radius: 4px;
        }
        .label {
            margin-top: 10px;
            clear: both;
            width: 100%;
        }
        #nickNameBox {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-around;
        }
        
        #checkBtn {
            width: 90px;
            height: 40px;
            border-radius: 8px;
            margin-left: 8px;
            border: 2px solid #71c1ff;
            float: left;
            cursor: pointer;
            background-color: #71c1ff;
        }
        #checkBtn:hover {
            border: 2px solid #55a3de;
            background-color: #55a3de;
        }
        #checkBtn:disabled {
            border: 2px solid #b0b0b0;
            background-color: #b0b0b0;
            cursor: default;
        }
        
        #saveBtn {
        	font-size: 18px;
            width: 100px;
            height: 50px;
            border-radius: 8px;
            border: 2px solid #71c1ff;
            float: right;
            margin: 20px 15px;
            padding: 10px 15px;
            cursor: pointer;
            background-color: #71c1ff;
        }
        #saveBtn:hover {
            border: 2px solid #55a3de;
            background-color: #55a3de;
        }
        #saveBtn:disabled {
            border: 2px solid #b0b0b0;
            background-color: #b0b0b0;
            cursor: default;
        }
        
        #saveBtnArea {
            width: 100%;
        }

        #selectCon{
            display: grid;
            width: 100%;
            grid-template-columns: repeat(3, 1fr);
            grid-template-areas: 
                "select" "select" "select";
        }
        #infoForm select {
            width: 90%;
            padding: 16px 20px;
            border: 1px solid black;
            border-radius: 4px;
            font-size:15px ;
            margin: 10px 0;
        }
        #innerContainer {
            position: absolute;
            padding: 10px;
            width: 600px;
            height: 450px;
            top : 100px;
            left : 60px;
        }


    </style>
    
</head>
<body>
<%
String name = request.getAttribute("managerName") == null ? "": request.getAttribute("managerName").toString();
int type = session.getAttribute("type") == null ? 0 : Integer.parseInt(session.getAttribute("type").toString());
%>
    <jsp:include page="/common/header.jsp" />
    <div id="container">
    <aside id="sidebar">
        <div>
            <ul>
                <li><h3>내 계정</h3></li>
                <a href="./mypage_co.do"><li class="detail"><img src="../img/user.png" alt="프로필아이콘">프로필</li></a>
                <a href="./account.do"><li class="detail"><img src="../img/cogwheel.png" alt="계정관리">계정 관리</li></a>
            </ul>
            <hr>
            <ul>
                <li><h3>JOBS</h3></li>
                <a href="./applicantList.do"><li class="detail"><img src="../img/briefcase.png" alt="구직관리아이콘">구직 내역 관리</li></a>
            </ul>
        </div>
    </aside>
    <div id="outer">
        <div id="innerContainer">
            <h3>회원 정보</h3>
            <form action="mypage_co.do" name="infoForm" id="infoForm" method="post">
                <div class="label"><label for="managerName">담당자명</label></div>
                <div><input type="text" name="managerName" id="managerName" value="${managerName }"></div>
                <div class="label"><label for="companyName">회사명</label></div>
                <div><input type="text" name="companyName" id="companyName" value="${companyName }" readonly></div>
                <div class="label"><label for="companyNo">사업자 등록번호</label></div>
                <div><input type="text" name="companyNo" id="companyNo" value="${companyNo}" readonly></div>
                <div class="label"><label for="managerPhone">담당자 연락처</label></div>
                <div><input type="text" name="managerPhone" id="managerPhone" value="${managerPhone }" placeholder="-제외 번호만 입력해주세요"></div>
                <div id="errPno" style="display: none;"></div>
                <div class="saveBtnArea">
                    <input type="submit" id="saveBtn" name="saveBtn" value="저장" disabled>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="/common/footer.jsp" />
<script>
    let managerPhone = document.getElementById("managerPhone");
    let managerName = document.getElementById("managerName");
    const engChars = "abcdefghijklmnopqrstuvwxyz";
	const EngChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	const numChars = "0123456789";
	const specialChars = "`~!@#$%^&*()-=_+,<.>/?;':\"\"'{}[]";
	const emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
	const korCheck = /[^-0-9]/g;
    
	managerPhone.addEventListener("change", function(e){
        if(managerPhone.value.length > 11 || (managerPhone.value.length <11 && managerPhone.value.length > 0) ) {
        	document.getElementById("errPno").style.display = "block";
        	document.getElementById("errPno").style.color = "red";
        	document.getElementById("managerPhone").style.border="1px solid red"
        	document.getElementById("errPno").innerHTML = `<strong> 전화번호 자리 수(11)를 맞춰주세요 </strong>`;
        }
        else if(managerPhone.value.length == 11) {
             if (/[0-9]/.test(managerPhone.value)) {
            	 document.getElementById("errPno").style.display = "none";
            	 document.getElementById("managerPhone").style.border=""
                document.querySelector("#saveBtn").disabled = false;
            }
            else {
            	document.querySelector("#saveBtn").disabled = true;
            }
        }
    })
    
    
    function combi_check(inputValue, chars) {
		let cnt = 0;
		for(let i=0; i<inputValue.length; i++) {
			if(chars.indexOf(inputValue.charAt(i)) != -1) {
				cnt += 1;
			}
		}
		return cnt;
	}

    function validate_check(inputValue, min, max, type) {
		if(type == 1) { // 영문 + 숫자 + 특수문자 
			if(inputValue.value.length >= min && inputValue.value.length <= max) {
				// 영문 + 숫자 + 특수문자
				if((combi_check(inputValue.value, engChars) > 0 || combi_check(inputValue.value, EngChars) > 0) 
						&& combi_check(inputValue.value, numChars) > 0 
						&& combi_check(inputValue.value, specialChars) > 0) {
					inputValue.style.border = "3px solid lightgreen";
				} else {
					inputValue.style.border = "1px solid red";
				}
			} else if(inputValue.value.length == 0) {
				inputValue.style.border = "";
			} else {
				inputValue.style.border = "1px solid red";
			}
		} else if(type == 2) { // 특수문자 x, 영문 + 숫자
			if(combi_check(inputValue.value, specialChars) > 0) {
				inputValue.value = inputValue.value.substring(0, inputValue.value.length - 1);
			}else {
				// 4~15자 이내 => input 배경색 변경
				if(inputValue.value.length >= min && inputValue.value.length <= max) {
					// 영문 + 숫자
					if((combi_check(inputValue.value, engChars) > 0 || combi_check(inputValue.value, EngChars) > 0) 
							&& combi_check(inputValue.value, numChars) > 0) {
						inputValue.style.border = "3px solid lightgreen";
					} else {
						inputValue.style.border = "1px solid red";
					}
				} else if(inputValue.value.length == 0) {
					inputValue.style.border = "";
				} else {
					inputValue.style.border = "1px solid red";
				}
			}
		} else if(type == 3) { // 특수문자 x, 글자 수 제한
			// 특수문자 입력 시 지워짐
			if(combi_check(inputValue.value, specialChars) > 0) {
				inputValue.value = inputValue.value.substring(0, inputValue.value.length - 1);
			}else {
				// 2~20자 이내 => input 배경색 변경
				if(inputValue.value.length >= min && inputValue.value.length <= max) {
					inputValue.style.border = "3px solid lightgreen";
				} else if(inputValue.value.length == 0) {
					inputValue.style.border = "";
				} else {
					inputValue.style.border = "1px solid red";
				}
			}
		} else if(type == 4) { // 숫자만
			if(combi_check(inputValue.value, specialChars) > 0 
					|| combi_check(inputValue.value, engChars) > 0 
					|| combi_check(inputValue.value, EngChars) > 0
					|| korCheck.test(inputValue.value)
					) {
				inputValue.value = inputValue.value.replace(korCheck, "");
				for(let i=0; i<inputValue.value.length; i++) {
					inputValue.value = inputValue.value.charAt(i).replace(korCheck, "");
				}
				
			}else {
				if(inputValue.value.length >= min && inputValue.value.length <= max) {
					inputValue.style.border = "3px solid lightgreen";
				} else if(inputValue.value.length == 0) {
					inputValue.style.border = "";
				} else {
					inputValue.style.border = "1px solid red";
				}
			}
		}
	}

    managerName.addEventListener("keyup", function(e) {
		validate_check(managerName, 2, 30, 3);
	}, false);
    

    // adminPNo.addEventListener("change", function(e){
    //     document.querySelector("#saveBtn").disabled = false;
    // });


</script>

    
</body>
</html>