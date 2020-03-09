<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="b_member.model.vo.*"%>
<%
	Member member = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<style>

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
			width : 1170px;
			text-align : left;
			padding : 20px 0px 20px 0px; 
			background : rgb(242, 242, 242);
		}
		
		#confirm_id{
			font-weight : bold;
			font-size : 20px;
			margin-left : 40%;
			margin-top: 5%;
		}
		
		#confirm_bt{
			width : 100px;
			height : 40px;
			background-color : rgb(241, 131, 50); 
			color : white;
			border-radius: 5px;
			margin-left : 45%;
			margin-top : 30px;
			margin-bottom : 10px;
			line-height: 40px;
			text-align: center;
			border:0px;
			font-weight: bold;
		}
		
		#userId{font-weight: bold; color:#748049; font-size:25px;}
		
		
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
			$('#boardName').text('아이디 찾기');
			$('#quicklink').css('display','none');
		</script>
	</header>
	
	<section>
		
		<div id = "main">
			<div id="realMain">
				
				<div id = "box"> 
					<div id = "confirm_id">
						아이디는 <span id="userId"><%= member.getUserId() %></span> 입니다.
					</div>
					<input type = "button" id = "confirm_bt" value = "확인" onclick="location.href='views/b_member/login.jsp'">
				</div>
								
			</div>
		</div>
	
	</section>
	
	<script>
		var msg = "<%= msg %>";
		
		$(function(){
			if(msg != "null") 
				alert(msg);
		});
	</script>

</body>
</html>