<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <title>Header</title>
    <style> 
    * {
        margin :0;
        padding: 0;
        list-style: none;
        text-decoration: none;

    }
    header {
        width : 1100px;
        height : 80px; 
        display : flex; 
        margin: 0 auto;
        justify-content: center;
    } 
    #logo {
        width : 180px;
        height : 50px; 
        display : flex;
        background-image: url("./okky-munchkin-logo.svg");
        background-size: contain;
        background-repeat: no-repeat;
    }
    /* 네비게이션바 */
    .navi {
        width : 100%; 
        display: flex;
        margin: 0 auto;
        align-items: center;
    }
    .navi ul {
        display: flex;
        flex-direction: row;
        align-items: center;
    }
    .navi li {
        list-style : none ;
        width:150px; 
        height:80px; 
        line-height: 80px;
        text-align: center;
        margin: 0 10px;
    }
    li a {
        /* padding: 150px; */
        width: 150px;
        color: black;
    } 
    ul a:link, ul a:visited {
        color: black;
    }
    ul a:hover {
        background-color: #39b6ff;
    }
    .button {
        display:flex;
        width:80px;
        height: 50px;
        
    }
    .buttons button {
        width:100px;
        height: 45px;
        border: none;
        border-radius: 20px;
        cursor: pointer;
    }
    #joinBtn {
        background-color: #39b6ff;
        color : #ffffff;
    }
    .buttons button:active {
        background-color: rgb(82, 82, 82);
    }
    
    /* 다크모드 스위치 */
    
    .switch {
      position: relative;
      display: inline-block;
      width: 55px;
      height: 24px;
      line-height: 25%;
    }
    
    .switch input { 
      opacity: 0;
      width: 0;
      height: 0;
    }
    
    .slider {
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
    
    .slider:before {
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
    
    input:checked + .slider {
      background-color: #39b6ff;
    }
    
    input:focus + .slider {
      box-shadow: 0 0 1px #39b6ff;
    }
    
    input:checked + .slider:before {
      -webkit-transform: translateX(26px);
      -ms-transform: translateX(26px);
      transform: translateX(26px);
    }
    
    /* Rounded sliders */
    .slider.round {
      border-radius: 34px;
    }
    
    .slider.round:before {
      border-radius: 50%;
    }

    
    
    </style>
</head>
<body>
    <header>
        <nav class="navi"> 
            <a href=""><div id="logo"></div></a>
            <ul>
                <a href=""><li>Q&A</li></a>
                <p> | </p>
                <a href=""><li>커뮤니티</li></a>
                <p> | </p>
                <a href=""><li>구인구직</li></a>
                <p> | </p>
                <li style="display:flex; align-items: center; font-size: 13px;">다크모드&nbsp;<label class="switch"><input type="checkbox"><span class="slider round"></span></label></li>
               
            </ul>
            <div class="buttons">
                <button id="loginBtn">로그인</button>
                <button id="joinBtn">회원가입</button>
            </div>
        </nav>
    </header>
    <hr>

    <script>
      


        document.querySelector("#loginBtn").addEventListener("click", function(e){
            window.location.href("header.html");

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
                document.querySelector("#logo").style.backgroundImage = "url('./okky-munchkin-logo.svg')";
                document.querySelector("body").setAttribute("style","background-color:white; color:black");
            }
            
            console.log(toggleBtn.value);


            
        });
    </script>
</body>
</html>