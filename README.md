# okky 클론 사이트 프로젝트 🖥
<hr/>

## 프로젝트 개요
### 1. 프로젝트 주제 및 선정 배경, 기획 의도
- 개발자들간 의사소통이 용이한 사이트 구현
- 개발자들의 정보 공유가 활발한 사이트 구현
- 개발자들의 구인구직이 용이한 사이트 구현
  <br> ➡ OKKY사이트 벤치 마킹

### 2. 프로젝트 내용
- 게시판 구조의 MVC모델을 활용한 커뮤니티 사이트 구현
- CRUD 구현

### 3. 개발 환경
|||
|:---:|---|
| **Frontend** |<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white"> |
| **Backend** | <img src="https://img.shields.io/badge/Java-3BABFF?style=for-the-badge&logo=java&logoColor=red"> |
| **Database** | <img src="https://img.shields.io/badge/Maria DB 10.11-003545?style=for-the-badge&logo=mariadb&logoColor=white"> |
| **WAS** | <img src="https://img.shields.io/badge/Apache Tomcat 10.1-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black"> |
| **Library** | <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/Jakarta EE-DEEB52?style=for-the-badge&logo=jakarta&logoColor=white"> |
| **IDE / Tool** |  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/Eclipse IDE 2023.12-2C2255?style=for-the-badge&logo=eclipseide&logoColor=white"> <img src="https://img.shields.io/badge/Sequel Pro 1.1.2-FF9E0F?style=for-the-badge&logo=Sequelpro&logoColor=white"> <img src="https://img.shields.io/badge/HeidiSQL 12.6-83B81A?style=for-the-badge&logo=Heidi&logoColor=white"> <img src="https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white">|
<br/>

### 4. 프로젝트 개발 기간


**2024/03/19 ~ 2024/03/25 (총 7일)**

2024/03/19 - **사전 작업** / DB 테이블 설계 및 GitHub 연동 , 기획서 분석 및 팀원 역할 분담

2024/03/20 - **디자인 구축** / 담당 페이지 디자인 구축

2024/03/21 ~ 03/23 - **기능 구현** / 각 담당 페이지 기능 구현 및 팀원 별 중간 점검

2024/03/24 - **기능 테스트** / 기능 테스트 후 수정 사항 반영

2024/03/25 - **배포 작업** / 최종 작업물 배포 작업

<br/>
<hr/>

## 프로젝트 팀 구성 및 역할
|이름|역할|담당업무|
|:--------:|:--------:|:---|
| **조현기** | **팀장** | <img src="https://img.shields.io/badge/DB설계-207BEA?style=for-the-badge"> <img src="https://img.shields.io/badge/회원가입 , 로그인페이지 UI 디자인 및 기능 구현-00A5FD?style=for-the-badge"> <img src="https://img.shields.io/badge/구인구직 페이지 UI 디자인 및 기능 구현-00C5E7?style=for-the-badge"> <img src="https://img.shields.io/badge/게시판 댓글 기능 구현-00DEB7?style=for-the-badge"> |
| **류림** | 팀원 | <img src="https://img.shields.io/badge/DB설계-207BEA?style=for-the-badge">  <img src="https://img.shields.io/badge/QnA 게시판, 커뮤니티 게시판 UI 디자인 및 기능 구현-6770DB?style=for-the-badge"> <img src="https://img.shields.io/badge/메인페이지 UI 디자인 및 기능 구현-8965C9?style=for-the-badge"> |
| **전주연** | 팀원 | <img src="https://img.shields.io/badge/DB설계-207BEA?style=for-the-badge"> <img src="https://img.shields.io/badge/마이페이지 관련 디자인 및 기능 구현-A0B0E6?style=for-the-badge"> <img src="https://img.shields.io/badge/헤더 디자인 및 기능 구현-E6EFFF?style=for-the-badge"> |

  <hr/>

  ## 데이터베이스 테이블 관계도
![database](https://github.com/cmkbeew/okky/assets/82045649/dc1ede1d-e32a-405b-991e-0d2473ce2f21)

<hr/>


(구현 UI 및 기능 설명)

![캡처_2024_05_09_01_06_53_377](https://github.com/cmkbeew/bookstore/assets/82045649/0d3e2c48-ea28-4a1a-b25c-dbe796accc2b)
**메인 화면** - 사이트의 인기 게시글 확인 가능, 헤더를 통해 로그인 가능

![캡처_2024_05_09_01_07_10_190](https://github.com/cmkbeew/bookstore/assets/82045649/7d3f6335-4873-408a-89d3-615921143fdc)
**회원가입 페이지** <br>
개인 회원 가입 시 UI
<br>
![기업회원가입](https://github.com/cmkbeew/bookstore/assets/82045649/40bf2478-2a55-45bc-afb8-9c4133464cea)
기업 회원 가입 시 UI
<br>개인 회원 입력 정보 + 기업 관련 추가 정보 입력
![캡처_2024_05_09_01_07_56_571](https://github.com/cmkbeew/bookstore/assets/82045649/866a0a4b-bfa0-4527-a51d-a80e444fe68d)
**개인 회원 마이페이지 UI** <br>
![캡처_2024_05_09_01_34_40_579](https://github.com/cmkbeew/bookstore/assets/82045649/4586e31a-2278-4b8f-a99e-eb950cda9f75)
마이페이지 공통
![캡처_2024_05_09_01_35_03_640](https://github.com/cmkbeew/bookstore/assets/82045649/a13c4d3d-80d8-4513-a7b2-441ae4ca6b48)
구인구직 페이지
