<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String msg = (String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<style>

		#main{
			width : 100%;
			text-align: center;
			height : 500px;
			
		}
		
		#realMain {
			display : inline-table;
			width : 1170px;
			display : inline-table;
			height : 500px;
			/* 현재 임시값 입력해놓음 */
			margin-left : 40px; 
		}
		
		#box{
			margin-top : 3%;
			border : solid 2px gray;
			width : 1170px;
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
			width : 300px;
			height: 35px;
			text-align:left;
			margin-bottom : 20px;
			margin-left : 15%;
			border:1px solid gray;
			padding:5px;
		}
		
		#input{
			text-align : left;
			margin-left : 25%;
		}
		
		#nextBtn{
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
			border:0px;
		}
		
		#next_bt:hover{cursor:pointer; background-color:#f18332;}
		
		@media only screen and (max-width: 1200px) {
			.sidebar {
				display:none;
			}
		}
		
	</style>

</head>
<body>
<header>
	
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('비밀번호 찾기');
		$('#quicklink').css('display','none');
	</script>
	
	</header>
	
	<section>
		
		<div id = "main">
			
			
			<div id="realMain">
				
				<div id = "box"> 
					<div id = "confirm_comment1">아이디 확인 </div>
					<div id = "confirm_comment2">비밀번호를 찾고자 하는 아이디를 입력해 주세요.</div>
				<form method="post" id="inputIdForm">
					<div id =  "input" >
						<input type="text" name="id" id="input_id" placeholder="아이디를 입력해주세요." required>
						<div><button type="button" id="nextBtn">다음</button></div>
					</div>
				</form>	
				</div>
								
				
			</div>
			
			
		</div>
	
	</section>
	
	<footer>
	</footer>
	
	<script>
		var msg = "<%= msg %>";
		
		$(function(){
			if(msg != "null") 
				alert(msg);
		});
	
		function goLogin(){
			location.href="views/b_member/login.jsp"
		}
		
		$('#nextBtn').click(function(){
			console.log($('#input_id').val());
			$('#inputIdForm').attr('action','<%= request.getContextPath() %>/input.id');
	        $('#inputIdForm').submit();
		});
	</script>
</body>
</html>