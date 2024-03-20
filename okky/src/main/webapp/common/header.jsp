<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<body>
<style> 
header * {
    margin :0;
    padding: 0;
    list-style: none;
    text-decoration: none;
}
header {
    width : 100%;
    height : 50px; 
    display : flex; 
    margin: 0 auto 15px;
    justify-content: center;
    border-bottom: 1px solid #505050;
} 
header #logo {
    width : 180px;
    height : 50px; 
    display : flex;
    background-image: url(https://okky.kr/okky-munchkin-logo.svg);
    background-size: contain;
    background-repeat: no-repeat;
    margin: 0 10px;
}
/* 네비게이션바 */
.navi {
    width : 1100px; 
    display: flex;
    margin: 15px auto;
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
    height:50px; 
    line-height: 50px;
    text-align: center;
    margin: 0 10px;
}
header li a {
    /* padding: 150px; */
    width: 150px;
    color: black;
} 
header ul a:link, header ul a:visited {
    color: black;
}
header ul a:hover {
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
.buttons button:active, #joinBtn:active  {
    background-color: rgb(82, 82, 82);
}
#joinBtn {
    background-color: #39b6ff;
    color : #ffffff;
}
</style>
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
                <li>다크모드</li>
            </ul>
            <div class="buttons">
                <button id="loginBtn">로그인</button>
                <button id="joinBtn">회원가입</button>
            </div>
        </nav>
    </header>

    <script>
        document.querySelector("#loginBtn").addEventListener("click", function(e){
        	window.location.href="header.jsp";

        });
    </script>

</body>
</html>