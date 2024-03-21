<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <title>Header</title>
    <style> 
<<<<<<< HEAD
    * {
        font-family: "Noto Sans KR", sans-serif;
        font-optical-sizing: auto;
        font-style: normal;
        } 
   /*  header * {
=======
    header * {
>>>>>>> 43fa438b9d3e931c160a5b9f33a17cfca90f2be5
        margin :0;
        padding: 0;
        list-style: none;
        text-decoration: none;

    } */
    header {
        width : 1200px;
        height : 80px; 
        display : flex; 
        margin: 0 auto;
        justify-content: center;
    } 
    header #logo {
        width : 180px;
        height : 50px; 
        display : flex;
        background-image: url("https://okky.kr/okky-munchkin-logo.svg");
        background-size: contain;
        background-repeat: no-repeat;
    }
    /* 네비게이션바 */
    header .navi {
        width : 100%; 
        display: flex;
        margin: 0 auto;
        align-items: center;
    }
    header .navi ul {
        display: flex;
        flex-direction: row;
        align-items: center;
    }
    header .navi li {
        list-style : none ;
        width:180px; 
        height:80px; 
        line-height: 80px;
        text-align: center;
        margin: 0 10px;
    }
    header li a {
        /* padding: 150px; */
        width: 150px;
        color: black;
    } 
    header ul a:link, ul a:visited {
        color: black;
    }
    header ul a:hover {
        background-color: #39b6ff;
        color : white;
        opacity : 0.8;
        transition : 0.5s;
    }
    header .button {
        display:flex;
        width:80px;
        height: 50px;
        
    }
    header .buttons button {
        width:100px;
        height: 45px;
        border: none;
        border-radius: 20px;
        cursor: pointer;
    }
<<<<<<< HEAD
    header #registBtn {
=======
    #registBtn {
>>>>>>> 43fa438b9d3e931c160a5b9f33a17cfca90f2be5
        background-color: #39b6ff;
        color : #ffffff;
    }
    .buttons button:hover{
        background-color: #a9a9a9;
    }
    header #registBtn:hover {
        background-color: #1d8bca;
    }
    
    /* 다크모드 스위치 */
    header .switch {
      position: relative;
      display: inline-block;
      width: 55px;
      height: 24px;
      line-height: 25%;
    }
    
    header .switch input { 
      opacity: 0;
      width: 0;
      height: 0;
    }
    
    header .slider {
      position: absolute;
      cursor: pointer;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background-color: #ccc;
      -webkit-transition: .4s;
      transition: .4s;
    }
    
    header .slider:before {
      position: absolute;
      content: "";
      height: 20px;
      width: 20px;
      left: 2px;
      top : 2px;
      /* bottom: 1px; */
      background-color: rgb(255, 255, 255);
      -webkit-transition: .4s;
      transition: .4s;
    }
    
    header input:checked + .slider {
      background-color: #39b6ff;
    }
    
   	header input:focus + .slider {
      box-shadow: 0 0 1px #39b6ff;
    }
    
    header input:checked + .slider:before {
      -webkit-transform: translateX(26px);
      -ms-transform: translateX(26px);
      transform: translateX(26px);
    }
    
    /* Rounded sliders */
    header .slider.round {
      border-radius: 34px;
    }
    
    header .slider.round:before {
      border-radius: 50%;
<<<<<<< HEAD
    }
=======
    }   
>>>>>>> 43fa438b9d3e931c160a5b9f33a17cfca90f2be5
    </style>
</head>
<body>
    <header>
        <nav class="navi"> 
            <a href="/okky/main.jsp"><div id="logo"></div></a>
            <ul>
<<<<<<< HEAD
                <a href="qna.jsp"><li>Q&A</li></a>
                <p> | </p>
                <a href="community.jsp"><li>커뮤니티</li></a>
                <p> | </p>
                <a href=".jsp"><li>구인구직</li></a>
=======
                <a href="/okky/board/qna.jsp"><li>Q&A</li></a>
                <p> | </p>
                <a href="/okky/board/community.jsp"><li>커뮤니티</li></a>
                <p> | </p>
                <a href="/okky/jobs/jobMain.jsp"><li>구인구직</li></a>
>>>>>>> 43fa438b9d3e931c160a5b9f33a17cfca90f2be5
                <p> | </p>
                <li style="display:flex; align-items: center; font-size: 13px;">다크모드&nbsp;<label class="switch"><input type="checkbox"><span class="slider round"></span></label></li>
            </ul>
            <div class="buttons">
                <button id="loginBtn">로그인</button>
                <button id="registBtn">회원가입</button>
            </div>
        </nav>
    </header>
    <hr>
    <script>
        document.querySelector("#loginBtn").addEventListener("click", function(e){
<<<<<<< HEAD
            window.location.href="login.jsp";

        });
        document.querySelector("#registBtn").addEventListener("click", function(e){
            window.location.href="regist.jsp";

=======
            window.location.href = "/okky/member/login.do";
>>>>>>> 43fa438b9d3e931c160a5b9f33a17cfca90f2be5
        });
        
        document.querySelector("#registBtn").addEventListener("click", function(e){
            window.location.href = "/okky/member/regist.do";
        });
        
        const toggleBtn = document.querySelector("input[type='checkbox']");
        toggleBtn.value = "off";
        document.querySelector("input[type='checkbox']").addEventListener("click", function(e){
            
            if(toggleBtn.value != "on") {
                toggleBtn.value = "on";
                document.querySelector("body").setAttribute("style","background-color:rgb(31 41 55); color:white");
                document.querySelector("#logo").style.backgroundImage = "url('https://okky.kr/darkmode/dark-logo.svg')";
                
            }
            else {
                toggleBtn.value = "off";
                document.querySelector("#logo").style.backgroundImage = "url('https://okky.kr/okky-munchkin-logo.svg')";
                document.querySelector("body").setAttribute("style","background-color:white; color:black");
            }
<<<<<<< HEAD
            console.log(toggleBtn.value);
=======
>>>>>>> 43fa438b9d3e931c160a5b9f33a17cfca90f2be5
        });
    </script>
</body>
</html>