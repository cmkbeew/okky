<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸터</title>
<style>
    footer {
        width: 1200px;
        margin: 20px auto 0px;
        display: flex;
        justify-content: space-between;
    }
    footer p {
        width: 300px;
    }
    footer ul {
        width: 300px;
        display: flex;
        justify-content: space-around;
        list-style: none;
        padding: 0;
    }
    .nav-item a { 
      	text-decoration: none; 
        color: black; 
     } 
    .nav-item a:hover {
        color: #0090f9;
    }
</style>
</head>
<body>
    <hr>
    <div class="container">
        <footer>
            <p>&copy; 2024 Chunjae 2조</p>

            <a href="/okky/main.jsp">
                <img src="https://okky.kr/okky-munchkin-logo.svg" width="100%" height="100%"></img>
            </a>

            <ul>
                <li class="nav-item"><a href="/okky/board/qna.jsp" style="text-decoration: none; color: black;">Q&A</a></li>
                <li class="nav-item"><a href="/okky/board/community.jsp">커뮤니티</a></li>
                <li class="nav-item"><a href="/okky/jobs/jobMain.jsp">구인구직</a></li>
            </ul>
        </footer>
    </div>
</body>
</html>
