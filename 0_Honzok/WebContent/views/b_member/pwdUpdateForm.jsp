<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="b_member.model.vo.Member"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
	String msg = (String)request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>

<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<style>
header {
	width: 100%;
	height: 170px;
	text-align: center;
}

#mainHeader {
	width: 1170px;
	height: 50px;
	display: inline-block;
}

#subHeader {
	width: 1170px;
	height: 100px;
	display: inline-block;
}

#logo {
	height: 100%;
	width: auto;
	float: left;
}

#list {
	height: 100%;
	width: auto;
	float: right;
}

#icon {
	height: 100%;
	width: auto;
	float: right;
}

#nickname {
	float: right;
	padding: 10px;
	color: rgb(241, 131, 50);
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 12pt;
}

#nickname::after {
	color: black;
}

#boardName {
	margin: 20px;
	width: 100%;
	height: 70px;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 30pt;
	font-weight: bold;
	display: inline-table;
	border-bottom: 2pt solid gray;
}

#main {
	width: 100%;
	text-align: center;
	height: 1170px;
}

#realMain {
	display: inline-table;
	width: 1170px;
	display: inline-table;
	height: 1100px;
	/* 현재 임시값 입력해놓음 */
	margin-left: 40px;
}

#box {
	margin-top: 2%;
	border: solid 2px gray;
	width: 100%;
	text-align: left;
	padding: 20px 0px 20px 0px;
	background: rgb(242, 242, 242);
}

#box2 {
	margin-top: 2%;
	width: 100%;
	text-align: left;
	padding: 20px 0px 20px 0px;
	background: rgb(242, 242, 242);
}

#confirm_comment1 {
	padding-left: 30px;
	font-weight: bold;
	font-size: 20px;
	margin-bottom: 5px;
}

#confirm_comment2 {
	font-size: 15px;
	color: gray;
	padding-left: 30px;
	margin-bottom: 20px;
}

.left {
	font-size: 17px;
	width: 150px;
	display: inline-table;
	margin-left: 7%;
	font-weight: bold;
}

.right {
	border-radius: 5px;
	width: 200px;
	height: 30px;
	margin-left: 5%;
	margin-top: 3%;
}

#input {
	text-align: left;
	margin-left: 25%;
}

#code {
	margin-left: 155px;
	margin-bottom: 3px;
}

#code_get {
	border-radius: 5px;
	background: lightgray;
	height: 25px;
	font-weight: bold;
}

#help {
	margin-left: 155px;
	font-size: 13px;
}

#hover_bt {
	border: 1px solid black;
	position: relative;
	background: gray;
	width: 20px;
	height: 20px;
	display: inline-block;
	font-weight: bold;
	margin-left: 5px;
	display: block;
}

#hover_content {
	width: 300px;
	height: 30px;
}
#nickname:hover{color:rgb(118,129,73); cursor:pointer;}
#next_bt {
	width: 100px;
	height: 40px;
	background-color: rgb(241, 131, 50);
	color: white;
	border-radius: 5px;
	margin-left: 25%;
	margin-top: 30px;
	margin-bottom: 10px;
	line-height: 40px;
	font-weight: bold;
	text-align: center;
	border: 0;
	font-size: 14pt;
	
}

#cancle {
	width: 100px;
	height: 40px;
	background-color: #5f5f5f;
	color: white;
	font-weight: bold;
	cursor: pointer;
	margin: 10px;
	line-height: 40px;
	display: inline-table;
	text-align: center;
	border: 0;
	border-radius: 5px;
}

.comment {
	margin-left: 20px;
}

#comment1 {
	font-weight: bold;
	margin-bottom: 20px;
}

@media only screen and (max-width: 1200px) {
	.sidebar {
		display: none;
	}
}
</style>

</head>
<body>


	<header>
		<div id="mainHeader">
			<a href="../../index.jsp"> <img alt="로고"
				src="../../images/Logo.png" id="logo"></a> <img alt="메뉴"
				src="../../images/list.png" id="list">

			<div id="nickname"
				onclick="location.href='<%=request.getContextPath()%>/myPage.me'"><%=loginUser.getUserName()%>님
			</div>



		</div>

		<div id="subHeader">
			<div id="boardName">비밀번호 변경</div>
		</div>

	</header>

	<section>

		<div id="main">


			<div id="realMain">

				<div id="box">
					<form action="<%=request.getContextPath()%>/updatePwd.me"
						method="post" id="updatePwdForm" name="updatePwdForm"
						onsubmit="return send();">
						<div id="confirm_comment1">비밀번호 변경</div>


						<div id="input">
							<div class="left">현재 비밀번호</div>
							<input type="password" class="right" name="userPwd" id="userPwd">
							 <label id="pwd1Result"></label>
						</div>
						<div id="input">
							<div class="left">새비밀번호</div>

							<input type="password" class="right" id="pwd1" name="newPwd"> <label id="pwd2Result"></label>
								<span id="spanteg1">(영어로 시작하며 영어와 숫자, 8~16자)</span>
						</div>


						<div id="input">
							<div class="left">새비밀번호 확인</div>

							<input type="password" class="right" id="pwd2" name="newPwd2">
							<label id="pwd3Result"></label>
						</div>
			
			<script>
						$('#pwd1').focus(function(){
			       		  $(this).parent().css('background', 'beige');
			    		  });
			    	    $('#pwd1').blur(function(){
					         var str = $(this).val();
					         var regExp1 = /^[a-z]/gi; // 영어로 시작하는지 체크. true여야함
					         var regExp2 = /[^a-z][^0-9]/gi; // a-z 0-9 !*& 하나라도 포함되어있으면 false
					         var regExp3 = /[0-9]/gi; // 0-9 하나라도 들어가있어야 true (섞여있는지 체크)
					        
			         
			         if(regExp1.test(str) && !regExp2.test(str) && regExp3.test(str) && str.length >= 8 && str.length <= 16){
			            $('#pwd2Result').text("정상입력");
			            $('#pwd2Result').css('color', 'green');
			            $(this).parent().css('background', '');
			            $(this).css('background', '');
			        	$("#spanteg1").attr("hidden", true);
			         } else {
			            $('#pwd2Result').text("알맞은 비밀번호를 입력하세요");
			            $('#pwd2Result').css('color', 'red');
			           
			            $(this).focus();
			         }
			      });
      </script>
						<script>
							$('#pwd2').focusout(function() {
								var pwd1 = $("#pwd1").val();
								var pwd2 = $("#pwd2").val();
								
								if (pwd1 != "" || pwd2 != "") {
									if (pwd1 == pwd2) {
										$("#alert-success")
												.css('display',
														'inline-block');
										 
										$("#alert-danger").css(
												'display',
												'none');
									} else {
										alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
										$("#alert-success")
												.css('display',
														'none');
										$("#alert-danger").css(
												'display',
												'inline-block');
									}
								}
							});
							
							
							var msg = "<%= msg %>";
							$(function(){
								if(msg != "null"){
									alert(msg);
								}
							});
						</script>

						<div id="input">
							<input type="submit" id="next_bt" value="확인"
								onclick="pwdupdate()">
							<div id="cancle"
								onclick="location.href='javascript:history.go(-1)'">취소하기</div>
						
						</div>
					</form>
				</div>

			</div>

		</div>

		<div id="box2">
			<div class="comment" id="comment1">※ 사용 불가한 비밀번호</div>

			<div class="comment" id="comment2">
				1. 빈칸 / 공백이 포함된 경우 <br>
				2. 숫자만으로 이루어진 경우 <br>
				3. 첫 글자가 영어로 시작하지 않는 경우
			</div>

		</div>


	</section>

	<footer> </footer>
	
	
</body>
</html>