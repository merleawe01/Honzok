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
		
		#information{
			text-align:left;
			font-size : 22pt;
			border-bottom: 2pt solid lightgray; 
			padding-bottom : 4px; 
		}
		
		.input{
			width : 100%;
			height: 30px;
			text-align : left;
			
			
			border-bottom: 1px solid lightgray;
			display : inline-table;
			
		}
		
		.left{
			width : 20%;
			font-size : 17px;
			padding-bottom: 15px;
			padding-top: 15px; 
			padding-left: 10px; 
			display : table-cell;
			
			
		}
		
		.must{
			font-size : 13px;
			color : gray;
			display : inline-block;
		}
		
		.right{
			font-size : 13px;
			text-align : left;
			border-radius : 5px;
			height : 22px;
			margin-bottom : 10px;
		}
		
		.address1{
			margin-bottom : 5px;
		}
		
		.email{
			margin-bottom : 0px;
		}
		
		.mini_bt{
			background-color : lightgray;
			height : 25px;
			width : 60px;
			font-size : 10px;
			border-radius : 5px;
			margin-left : 10px;
		}
		
		.address2{
			font-size: 9pt;
			color : gray; 
			margin-left : 8px;
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
		
		#access_terms1{
			text-align:left;
			font-size : 22pt;
			margin-top: 5%; 
			padding-bottom : 4px; 
		}
		
		#access_terms2{
			margin-top : 2%;
			border : solid 2px gray;
			width : 100%;
			text-align : left;
			padding : 20px 0px 20px 0px; 
			background : rgb(242, 242, 242);
		}
		
		#access_all{
			padding-left :30px; 
			font-weight : bold;
			font-size : 15px; 
			margin-bottom : 2%;
		}
		
		.access_terms3{
			padding-left :30px;
			
		}
		
		#check_content{
			font-weight : bold;
		}
		
		#terms_content{
			width: 100%; 
			height : 100px; 
			resize : none; 
			border-radius : 5px;
		}
		
		#finish_bt{
			width : 100px;
			height : 40px;
			background-color : rgb(241, 131, 50); 
			color : white;
			border-radius: 5px;
			margin: 20px;
			line-height: 40px;
			font-weight: bold;
			text-align: center;
		}
		
		#end_line{
			border-bottom : solid 2px lightgray;
		}
		
		@media only screen and (max-width: 1200px) {
			.sidebar {
				display:none;
			}
		}
		
	</style>
</head>
<body>
<body><%@ include file="../a_common/Main.jsp" %>
	
	<header>
	
		<div id="mainHeader">
			<img alt="로고" src="../image/Logo.png" id="logo">
			<img alt="메뉴" src="../image/list.png" id="list">
			
			<!-- 추후에 로그인 이전과 이후로 구분할 예정 -->
			<div id="nickname">
				<a href>로그인</a> 
			</div>
			
			
		</div>
		
		<div id="subHeader">
			<div id="boardName">
				회원가입
			</div>
		</div>
	
	</header>
	
	<section>
		
		<div id = "main">
			
			
			<div id="realMain">
				<div id = "information"><b>기본 정보</b></div>
				<div class =  "input" >
					<div class = "left">이름<span class = "must">(필수)</span></div> 
					
				<input type = "text" class = "right">
					 
				</div>
				
				<div class = "input">
					<div class = "left">아이디<span class = "must">(필수)</span></div>
					<input type = "text" class = "right"> <input type = "button" class = "mini_bt" value = "중복확인">
				</div>
				
				<div class = "input">
					<div class = "left">비밀번호<span class = "must">(필수)</span></div>
					 <input type = "password" class = "right">
				</div>
				
				<div class = "input">
					<div class = "left">비밀번호 확인<span class = "must">(필수)</span></div>
					<input type = "password" class = "right">
				</div>
				
				<div class = "input">
					<div class = "left">닉네임<span class = "must">(필수)</span></div>
					 <input type = "text" class = "right">
				</div>
				
				<div class ="input">
					<div class = "left">주소</div>
						
						<input type = "text" class = "right address1" style = "width : 120px;"><input type = "button" class = "mini_bt" value = "우편번호"><br>
						<input type = "text" class = "right address1" style = "width : 400px;"><label class = address2>기본 주소</label> <br>
						<input type = "text" class = "right" style = "width : 400px;" placeholder = "상세 주소를 입력해주세요."><label class = address2>나머지 주소</label>
						
					
				</div>
				
				<div class = "input">
					<div class = "left">핸드폰 번호 </div>
								<select class = "right" style = "height : 30px; width : 100px;">
									<option>010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
								</select>
						 - <input type = "text" class = "right" style = "width : 100px;"> - <input type = "text" class = "right" style = "width : 100px;">
						
					
				</div>
				
				<div class = "input"  id = "end_line">
					<div class = "left">이메일<span class = "must">(필수)</span></div>
					<div> 
					<input type = "text" class = "right email" maxlength="16" placeholder="이메일을 입력해주세요."> @ <input type = "text" class = "right email"> 
					<select>
						<option>직접입력</option>
						<option>daum.net</option>
						<option>empal.com</option>
						<option>gmail.com</option>
						<option>hanmail.net</option>
						<option>msn.com</option>
						<option>naver.com</option>
						<option>nate.com</option>
					</select> <br>
					</div>
					<label class = "must" style = "margin-bottom : 10px;">메일주소는 메일인증 후 비밀번호 변경이나 찾기 등에 사용됩니다.</label>
					
				</div>
				
				
				<div id = "access_terms1" ><b>약관 동의</b></div>
				
				<div id = "access_terms2">
					<div id = "access_all">
						<input type = "checkbox" >이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다. 
					</div>
					
					<span class = "access_terms3" id = "check_content">[필수] 이용약관 동의</span>
					
					<div class = "access_terms3" style = "margin : 10px 30px 10px 0px;">
						<textarea  id = "terms_content" >이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므
						로 그들은 길지 아니한 목숨을 사는가 싶이 살았으 그들의 그림자는 천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고
						 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으  그들의 그림자는 천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길이상 곧 만천하의
						 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으  그들의 그림자는
						  천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므
						로 그들은 길지 아니한 목숨을 사는가 싶이 살았으 그들의 그림자는 천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고
						 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으  그들의 그림자는 천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길이상 곧 만천하의
						 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으  그들의 그림자는
						  천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길</textarea>
					</div>
					<div class = "access_terms3" id = "check_content" style = "font-size : 15px;">
					이용약관에 동의하시겠습니까? <input type="checkbox">동의함
					</div>
					
				</div>
								
				<input type = "button" id = "finish_bt" value = "회원가입">
				
			</div>
			
			
		</div>
	
	</section>
	<script>
		function checkId(){
			window.open("idCheckForm.jsp", "checkForm", "width=500, height=300");
			//				팝업 주소 				팝업창 name		  설정
			
		}
	
	</script>
	<footer>
	
	</footer>
</body>
</html>