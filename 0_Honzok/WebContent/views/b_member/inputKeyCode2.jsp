<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="b_member.model.vo.*"%>
<%
	String msg = (String)request.getAttribute("msg");
	Member member = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<style>
		header {width: 100%; height: 170px; text-align: center;}
		#mainHeader {width: 1170px; height: 50px; display: inline-block;}
		#subHeader {width: 1170px; height: 100px; display: inline-block;}
		#logo {height: 100%; width: auto; float:left;}
		#list {height: 100%; width: auto; float: right;}
		#icon {height: 45px; width: 45px; float: right; vertical-align:center;}
		#nickname {float: right; padding: 10px; color: rgb(241,131,50);
					font-family: 'Nanum Gothic', sans-serif; font-size: 12pt;}
		#nickname::after {color : black;}
		#boardName{margin : 20px;width : 100%; height : 70px; display : inline-table; border-bottom: 2pt solid gray;
					font-family: 'Nanum Gothic', sans-serif;font-size: 30pt;font-weight: bold;} 
		
		#main{width : 100%; text-align: center; height : 1170px;}
		#realMain {display: inline-table; width: 1170px; display: inline-table; height: 1100px; margin-left: 40px;}
		
		#box{margin-top: 2%; border: solid 2px gray; width: 1170px; text-align: left;
			padding: 20px 0px 20px 0px; background: rgb(242, 242, 242);}
		#confirm_comment1{padding-left: 30px; font-weight: bold; font-size: 20px; margin-bottom: 5px;}
		#confirm_comment2{font-size : 15px;color : gray;padding-left : 30px;margin-bottom : 20px;}
		
		.left{font-size : 20px; font-bold:600; width : 150px; display : inline-table;}
		.right{text-align: left; border-radius: 5px; width: 300px; height: 35px; margin-bottom: 20px;
				border:1px solid gray; padding:5px; margin-left:50px;}
		.center{text-align:center; margin:auto;}
		tr {width:350px;}
		#td1 {width:300px;}
		#td2 {width:50px;}
		#keyCode{margin-bottom:3%; display:inline-block;}
		#countDown{margin-left:5px; display:inline-block;}
		#nextBtn{width:100px; height:40px; background-color:RGB(84,84,84); color:white;
				border-radius:5px; font-weight:bold; font-size:15px; border:0px; margin-top:5px;}
		#next_bt{width : 100px; height : 40px; background-color : RGB(84, 84, 84); 
			color : white;
			border-radius: 5px;
			margin-left : 25%;
			margin-top : 15px;
			margin-bottom : 10px;
			line-height: 40px;
			font-weight: bold;
			font-size:15px;
			border:0px;
		}
		
		@media only screen and (max-width: 1200px) {
			.sidebar {display:none;}
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
		<div id="main">
			<div id="realMain">

			<div id="box">
				<div id="confirm_comment1">인증번호 입력</div>
				<div id="confirm_comment2">이메일로 발송된 인증코드를 입력해주세요.</div>
				<br>
					
				<form id="inputKeyCodeForm" method="post">
				
					<table class="center">
						<tr>
							<td id="td1"><input type="text" class="right" name="keyCode" id="keyCode" placeholder="인증번호 8자리 문자 입력"></td>
							<td id="td2"><div id="countDown" style="display:inline-block"></div></td>
						</tr>
					</table>
					<button type="submit" class="center" style="display:block" id="nextBtn">확인</button>
						
					<input type="hidden" name="name" id="name" value="<%= member.getUserName() %>">
					<input type="hidden" name="email" id="email" value="<%= member.getEmail() %>">
					<input type="hidden" name="id" id="id" value="<%= member.getUserId() %>">
				</form>
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
		
		$('#nextBtn').click(function(){
			console.log($('#email').val());
			console.log($('#name').val());
			$('#inputKeyCodeForm').attr('action','<%=request.getContextPath() %>/input.kc2');
	        $('#inputKeyCodeForm').submit();
		});

	</script>
			            
</body>
</html>