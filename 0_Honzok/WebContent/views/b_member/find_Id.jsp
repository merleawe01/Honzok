<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
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
      #logo {height: 50%; width: auto; float:left;}
      #list{height: 100%; width: auto; float: right;}
	  #icon {height: 45px; width: 45px; float: right; vertical-align:center;}
      .menuBtn {padding:3px; display: inline-table; float: right;
			 background-color: transparent; border: none; cursor: pointer;}
	  .messageBtn {padding:3px; display: inline-table; float: right;
				 background-color: transparent; border: none; cursor: pointer;}
	  #login {float: right; padding: 10px; font-family: 'Nanum Gothic', sans-serif; font-size: 13pt;}
	  #loginText, #nickname{color: rgb(241, 131, 50); font-weight:bold;}
      #boardName{margin : 20px;width : 100%;height : 70px; display : inline-table; border-bottom: 2pt solid gray;
					font-family: 'Nanum Gothic', sans-serif;font-size: 30pt;font-weight: bold;}

      #main{width : 100%; text-align: center; height : 1170px;}
	  #realMain {display: inline-table; width: 1170px; display: inline-table; height: 1100px; margin-left: 40px;}
      
      #box{margin-top: 2%; border: solid 2px gray; width:1170px; text-align:center;
			padding: 20px 0px 20px 0px; background: rgb(242, 242, 242);}
      #text{text-align:left;}
      
      #confirm_comment1{padding-left: 30px; font-weight: bold; font-size: 20px; margin-bottom: 5px;}
      #confirm_comment2{font-size : 15px;color : gray;padding-left : 30px;margin-bottom : 20px;}
      
      .left{font-size: 20px; font-bold:600; width : 150px; display: inline-table;}
	  .right{text-align: left; border-radius: 5px; width: 300px; height: 30px; margin-bottom: 20px;
				heigth:10px; border:1px solid gray;}
      
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
		$('#boardName').text('아이디 찾기');
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
					
				<form action="<%=request.getContextPath() %>/issue.idkc" id="findIdForm" method="post">
					<div id="input">
						<div class="left">이름</div>
						<input type="text" class="right" name="name" id="name" required autofocus><br>
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
		
		function goLogin(){
			location.href="login.jsp";
		}
		
		$('#getNumBtn').click(function(){
<%-- 			var name = $('#name');
			var email = $('#email');
			$.ajax({
				url:"<%= request.getContextPath()%>/find.id",
				data : {name:name.val(), email:email.val()},
				success: function(data){
					if(data == 'fail'){
						window.location.href = "views/b_member/login.jsp";
					} else{
						attr('실패');
					}
				}
			}); --%>
			$('#findIdForm').attr('action','<%=request.getContextPath() %>/issue.idkc');
	        $('#findIdForm').submit();
		});
		
	</script>
			            
</body>
</html>