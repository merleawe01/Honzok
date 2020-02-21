<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<style>
		header {
			width : 100%;
			height : 170px;
			text-align: center;
		}
		#mainHeader{
			width : 1170px;
			height : 50px;
			display : inline-block;
		}
		#subHeader{
			width : 1170px;
			height : 100px;
			display : inline-block;
		}
		#logo {
			height : 100%;
			width : auto;
			float : left;
		}
		#list {
			height : 100%;
			width : auto;
			float : right;
		}
		#icon {
			height : 100%;
			width : auto;
			float : right;
		}
		#nickname {
			float : right;
			padding : 10px;
			color: rgb(241,131,50);
			font-family: 'Nanum Gothic', sans-serif;
			font-size: 12pt;
		}
		#nickname::after{
			
			color : black;
		}
		#boardName{
			margin : 20px;
			width : 100%;
			height : 70px;
			font-family: 'Nanum Gothic', sans-serif;
			font-size: 30pt;
			font-weight: bold;
			display : inline-table;
			border-bottom: 2pt solid gray;
		} 

		#main{
			width : 100%;
			text-align: center;
			height : 1170px;
			
		}
		
		#realMain {
			display : inline-table;
			
			width : 1170px;
			display : inline-table;
			height : 1100px;
			/* 현재 임시값 입력해놓음 */
			margin-left : 40px; 
		}
		

		#box{
			margin-top : 2%;
			border : solid 2px gray;
			width : 100%;
			text-align : left;
			padding : 20px 0px 20px 0px; 
			background : rgb(242, 242, 242);
		}
		
		#confirm_comment1{
			padding-left :30px; 
			font-weight : bold;
			font-size : 20px; 
			margin-bottom : 5px;
		}
		
		#confirm_comment2{
			font-size : 15px;
			color : gray;
			padding-left : 30px;
			margin-bottom : 20px;
		}
		
		#input_id{
			border-radius : 5px;
			width : 200px;
			height: 30px;
			margin-left : 20%;
			margin-bottom : 20px;
			margin-top : 3%;
		}
		
		#input{
			text-align : left;
			margin-left : 25%;
		}
		
		#next_bt{
			width : 100px;
			height : 40px;
			background-color : RGB(84, 84, 84); 
			color : white;
			border-radius: 5px;
			margin-left : 26%; 
			margin-bottom : 10px;
			line-height: 40px;
			font-weight: bold;
			text-align: center;
		}
		
		
		@media only screen and (max-width: 1200px) {
			.sidebar {
				display:none;
			}
		}
		
	</style>

</head>
<body>
<header>
	
		<div id="mainHeader"><a href="../../index.jsp">	
			<img alt="로고" src="../../images/Logo.png" id="logo"></a>
			<img alt="메뉴" src="../../images/list.png" id="list">
			
			<!-- 추후에 로그인 이전과 이후로 구분할 예정 -->
			<div id="nickname">
				<a href="login.jsp">로그인</a> 
			</div>
			
			
		</div>
		
		<div id="subHeader">
			<div id="boardName">
				비밀번호 찾기
			</div>
		</div>
	
	</header>
	
	<section>
		
		<div id = "main">
			
			
			<div id="realMain">
				
				<div id = "box"> 
					<div id = "confirm_comment1">아이디 확인 </div>
					
					<div id = "confirm_comment2">비밀번호를 찾고자 하는 아이디를 입력해 주세요.</div>
					
					<div id =  "input" >
					
						<input type = "text" id = "input_id" placeholder = "아이디를 입력해주세요.">
					 		
						<div><a href="find_Pwd2.jsp"><input type = "button" id = "next_bt" value = "다음"></a></div>
				
					</div>
				
				</div>
								
				
				
			</div>
			
			
		</div>
	
	</section>
	
	<footer>
	
	</footer>
</body>
</html>