<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
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
		
		.left{
			font-size : 20px;
			width : 150px;
			display : inline-table;
		}
		
		.right{
			text-align : left;
			border-radius : 5px;
			width : 150px;
			height: 20px;
			margin-bottom : 20px;
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
			display : inline-bolck;
		}

		#hover_bt{
			border : 1px solid black;
			background : gray;
			width : 20px;
			height: 20px;
			font-weight : bold;
			margin-left : 5px;
			z-index : 1;
			
		}
		
		#hover_content{
			border : 1px solid black;
			width : 250px;
			height : 50px;
			background-color : white;
			font-size : 10px;
			margin-left : 10%;
			z-index : 2;
		}
		
		#next_bt{
			width : 100px;
			height : 40px;
			background-color : RGB(84, 84, 84); 
			color : white;
			border-radius: 5px;
			margin-left : 25%;
			margin-top : 30px;
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
				아이디 찾기
			</div>
		</div>
	
	</header>
	
	<section>
		
		<div id = "main">
			
			
			<div id="realMain">
				
				<div id = "box"> 
					<div id = "confirm_comment1">본인확인 이메일로 인증 </div>
					
					<div id = "confirm_comment2">본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</div>
					
					<div id =  "input" >
					<div class = "left">이름</div> 
					
					<input type = "text" class = "right" name="name" id="name" required autofocus>
					 
					 <div class = "input">
					<div class = "left">이메일 주소</div>
					 
					<input type = "text" class = "right email" id="email" maxlength="16" placeholder="이메일을 입력해주세요." name="email" required>
					 @ <input type = "text" id="email02" class = "right email"> 
					<select name="selectEmail" id="selectEmail">
					   	  <option value="1">직접입력</option>
		                  <option value="daum.net">daum.net</option>
		                  <option value="empal.com" >empal.com</option>
		                  <option  value="gmail.com" >gmail.com</option>
		                  <option  value="hanmail.com">hanmail.net</option>
		                  <option  value="msn.com">msn.com</option>
		                  <option  value="naver.com">naver.com</option>
		                  <option  value="nate.com">nate.com</option>
					</select>
					
					<script>
			           $('#selectEmail').change(function(){
			        	   $("#selectEmail option:selected").each(function () {
			        		   if($(this).val()== '1'){ //직접입력일 경우
			        			   $("#email02").val(''); //값 초기화 
			        			   $("#email02").attr("disabled",false); //활성화
			        			   }else{ //직접입력이 아닐경우 
			        				   $("#email02").val($(this).text()); //선택값 입력
			        				   $("#email02").attr("disabled",true); //비활성화 
			        				   } 
			        		   }); 
			        	   });
			
			           </script>
			            
						
						
						<a href="find_Id2.jsp"><input type = "button" id = "next_bt" value = "다음"></a>
						
					
				</div>
				</div>
				
				</div>
								
				
				
			</div>
			
			
		</div>
	
	</section>
	
	<footer>
	
	</footer>
</body>
</html>