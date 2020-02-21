<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		
		#box2{
			margin-top : 2%;
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
		
		.left{
			font-size : 17px;
			width : 150px;
			display : inline-table;
			margin-left : 7%;
			font-weight : bold;
		}
		
		.right{
			border-radius : 5px;
			width : 200px;
			height: 30px;
			margin-left : 5%;
			margin-top : 3%;
		}
		
		#input{
			text-align : left;
			margin-left : 25%;
		}
		
		#code{	
			margin-left : 155px;
			margin-bottom : 3px;
		}
		
		#code_get{
			border-radius : 5px;
			background : lightgray;
			height : 25px;
			font-weight: bold;
			
		}
		
		#help{
			margin-left : 155px;
			font-size : 13px;
			
		}
		
		#hover_bt{
			border : 1px solid black;
			position : relative;
			background : gray;
			width : 20px;
			height: 20px;
			display : inline-block;
			font-weight : bold;
			margin-left : 5px;
			display : block;
			
		}
		
		#hover_content{
			width : 300px;
			height : 30px;
		}
		
		#next_bt{
			width : 100px;
			height : 40px;
			background-color : rgb(241, 131, 50);
			color : white;
			border-radius: 5px;
			margin-left : 25%;
			margin-top : 30px;
			margin-bottom : 10px;
			line-height: 40px;
			font-weight: bold;
			text-align: center;
		}
		
		
		.comment{
			margin-left : 20px;
		}
		
		#comment1{
			font-weight : bold;
			margin-bottom : 20px;
		}
		
		@media only screen and (max-width: 1200px) {
			.sidebar {
				display:none;
			}
		}
		
	</style>

<!-- 비밀번호가 같은지 다른지 확인하는 유효성검사도 넣기 -->
<title>Insert title here</title>
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
				
					<div id = "confirm_comment1"> 비밀번호 변경</div>
				
					
				
					<div id =  "input" >
						<div class = "left">새비밀번호</div> 
						
						<input type = "password" class = "right" name="userPwd" >
						 
						<div class = "input">
							<div class = "left">새비밀번호 확인</div>
							 
							<input type = "password" class = "right" name="userPwd2">
								
							<div>
							<input type="submit" id="next_bt" value="확인"
								onclick="pwdupdate()">
							
							</div>
							
						
						</div>
				
					</div>
				
				</div>
								
				<div id = "box2">
					<div class = "comment" id = "comment1">※ 사용 불가한 비밀번호</div>

					<div class = "comment" id = "comment2">
					1. 빈칸 / 공백<br>
					2. 숫자만으로 이루어진 경우<br>
					3. 동일한 문자를 많이 포함한 경우
					</div>
					
				</div>
				
			</div>	
			
		</div>
	
	</section>
	</body>
	<footer>
	
	</footer>

</body>
</html>