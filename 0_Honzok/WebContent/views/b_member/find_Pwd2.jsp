<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="b_member.model.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<style>
		#main{width : 100%; text-align: center; height : 1170px;}
		#realMain {display: inline-table; width: 1170px; display: inline-table; height: 1100px; margin-left: 40px;}
		
		#box{margin-top: 2%; border: solid 2px gray; width: 1170px; 
			padding: 20px 0px 20px 0px; background: rgb(242, 242, 242);}
		#text{text-align:left;}
		#confirm_comment1{padding-left: 30px; font-weight: bold; font-size: 20px; margin-bottom: 5px;}
		#confirm_comment2{font-size : 15px;color : gray;padding-left : 30px;margin-bottom : 20px;}
		
		.left{font-size: 20px; font-bold:600; width : 150px; display: inline-table;}
		.right{text-align: left; border-radius: 5px; width: 300px; height: 30px; margin-bottom: 20px;
				heigth:10px; border:1px solid gray;}
		input{padding:5px;}
		#input{text-align: left; margin-left: 25%; border:0px; padding-left:10px;}
		#center{text-align:center;}
		#getNumBtn{height:40px; background-color:#f18332; color:white; margin-left: 25%;
				border-radius:5px; font-weight:bold; font-size:15px; border:0px; margin-top:5px;}
		
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
				<div id="text">
					<div id="confirm_comment1">본인확인 이메일로 인증</div>
					<div id="confirm_comment2">본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</div>
					<br>
				</div>
					
				<form id="findPwdForm" method="post">
					<div id="input">
						<div class="left">이름</div>
						<input type="text" class="right" name="name" id="name" placeholder="이름을 입력해주세요." required autofocus><br>
						<div class="left">이메일 주소</div>
	
						<input type="email" class="right" id="email" placeholder="이메일을 입력해주세요." 
								name="email" required><br>
						<div class="center">
							<button type="submit" name="getNumBtn" id="getNumBtn" onclick="getNum();">인증번호 받기</button><br>
						</div>
					</div>
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

		$('#getNumBtn').click(function(){
			$('#findPwdForm').attr('action','<%=request.getContextPath() %>/issue.pwdkc');
	        $('#findPwdForm').submit();
		});
		
	</script>
			            
</body>
</html>
