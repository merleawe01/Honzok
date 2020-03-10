<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="b_member.model.vo.*"%>
<%
	Member member = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<style>

		#main{ width : 100%; text-align: center; height : 1170px;}
		#realMain {display : inline-table; width : 1170px; display : inline-table; height : 1100px;
			/* 현재 임시값 입력해놓음 */
			margin-left : 40px; 
		}

		#box2{
			margin-top : 2%;
			width : 1170px;
			text-align : left;
			padding : 20px 0px 20px 0px; 
			background : rgb(242, 242, 242);
		}
		
		#box{margin-top: 2%; border: solid 2px gray; width : 1170px; 
			padding: 20px 0px 20px 0px; background: rgb(242, 242, 242);}
		#text{text-align:left;}
		#confirm_comment1{text-align:left;padding-left: 30px; font-weight: bold; font-size: 20px; margin-bottom: 5px;}
		#confirm_comment2{font-size : 15px;color : gray;padding-left : 30px;margin-bottom : 20px;}
		
		.left{font-size: 20px; font-bold:600; width : 150px; display: inline-table;}
		.right{text-align: left; border-radius: 5px; width: 300px; height: 30px; margin-bottom: 20px;
				heigth:10px; border:1px solid gray;}
		
		#input{text-align: left; margin-left: 25%; border:0px; padding-left:10px;}
		input{padding:5px;}
		.class{text-align:center;}
		#next_bt{
			width : 100px;
			height : 40px;
			background-color : rgb(241, 131, 50);
			color : white;
			border-radius: 5px;
			margin-left : 25%;
			margin-bottom : 10px;
			line-height: 40px;
			font-weight: bold;
			text-align: center;
			border:0px;
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

<title>Insert title here</title>
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
					<div id = "confirm_comment1"> 비밀번호 변경</div><br>
				
					<form action="<%= request.getContextPath() %>/updatePwd.new" id="pwdUpdateForm" method="post">
						<div id = "input" >
							<input type="hidden" name="id" value="<%= member.getUserId() %>">
							<input type="hidden" name="userPwd" value="<%= member.getUserPwd() %>">
							<div class = "left">새비밀번호</div> 
								<input type="password" class = "right" name="newPwd" id="pwd1" required>
								<label id="pwdResult"></label>
							<div class = "input">
							<div class = "left">새비밀번호 확인</div>
								<input type = "password" class = "right" name="newPwd2" id="pwd2" required>
								<label id="pwdResult2"></label><br>
							<div class="center">
								<button type="button" id="next_bt" onclick="validate();">확인</button>
							</div>
							
							</div>
					
						</div>
					</form>
				
				</div>
								
				<div id = "box2">
					<div class = "comment" id = "comment1">※ 사용 불가한 비밀번호</div>
					<div class="comment" id="comment2">
						1. 빈칸 / 공백이 포함된 경우 <br>
						2. 숫자만으로 이루어진 경우 <br>
						3. 첫 글자가 영어로 시작하지 않는 경우
					</div>
					
				</div>
				
			</div>	
			
		</div>
	
	</section>
	</body>

	<script>
	
	var isUsable = false;
	var pwdCheck = false;
	
	$('#pwd1').blur(function(){
		var str = $(this).val();
	    var regExp1 = /^[a-z]/gi;
	    var regExp2 = /[^a-z][^0-9]/gi; 
	    var regExp3 = /[0-9]/gi;
	    
	if(regExp1.test(str) && !regExp2.test(str) && regExp3.test(str) && str.length >= 8 && str.length <= 16){
	      $('#pwdResult').text("정상입력");
	      $('#pwdResult').css('color', '#768149');
	      $(this).parent().css('background', '');
	      $(this).css('background', '');
	      isUsable = true;
	   } else {
		   $('#pwdResult').text("영어와 숫자를 혼합하여 8~16자로 만들어주세요");
		   $('#pwdResult').css('color', '#f18332');
		   isUsable = false;
	      $(this).focus();
	   }
	});
	
		var newPwd = $("#pwd1");
		var newPwd2 = $("#pwd2");
		
	$('#pwd2').on('change paste keyup',function(){
		
		if(newPwd.val().trim() != newPwd2.val().trim()){
			$('#pwdResult2').text("비밀번호가 일치하지 않습니다.");
			$('#pwdResult2').css('color', '#f18332');
		 	pwdCheck = false;
		} else{
			$('#pwdResult2').text("비밀번호가 일치합니다.");
			$('#pwdResult2').css('color', '#768149');
			pwdCheck = true;
		}
	});
	
	function validate(){
		if(isUsable && pwdCheck){
	        $('#pwdUpdateForm').attr('action','<%= request.getContextPath() %>/updatePwd.new');
	        $('#pwdUpdateForm').submit();
		} else {
			alert('비밀번호를 확인해주세요');
		}
	}
	
	</script>

</body>
</html>