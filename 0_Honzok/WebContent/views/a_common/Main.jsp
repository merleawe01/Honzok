<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "f_message.model.vo.Message, b_member.model.vo.*"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	Message m = new Message();
	int view = m.getView();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼족옵서예</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	header {width: 100%; height: 170px; text-align: center;}
	#mainHeader {width: 1170px; height: 50px; display: inline-block;}
	.menuBtn {padding:3px; display: inline-table; float: right;
			 background-color: transparent; border: none; cursor: pointer;}
	.messageBtn {padding:3px; display: inline-table; float: right;
			 background-color: transparent; border: none; cursor: pointer;}
	#login {float: right; padding: 10px; color: rgb(241, 131, 50); border:0;
			font-family: 'Nanum Gothic', sans-serif; font-size: 12pt;}
	#icon {height: 90%; width: auto; float: right;}
	#main {width: 100%;text-align: center;overflow: hidden;height: auto;}
	#realMain {width: 900px; display: inline-table; min-height: 600px; overflow: hidden; height: auto;}
	#subHeader{width : 1170px; height : 100px;display : inline-block;}
	#logo {height: auto; width: auto; float: center;}
	#travel {position:relative; left:50px; top:100px;}
	
	nav {background-color:#fff4c7; visibility: hidden;}
	.menu {margin:100px auto;}
	.circle {width:250px; height: 250px; border-radius: 80%; background-color:gray;
			margin:30px auto; margin-left:20px; margin-right:20px; display:inline-block;}
</style>

</head>

<body>
	<header>
		<div id="mainHeader">
			<button type="button" class="menuBtn" onclick="">
				<img alt="메뉴" src="images/list.png" style="width: 30px; heigth: 30px;">
			</button>

			<span id="message">
				<button type="button" class="messageBtn" onclick="goMessage();">
 				<% if(view == 0) {%> 
					<img alt="메세지" src="images/receive_letter.png" style="width:30px; height:30px;">
				<% } else { %>
					<img alt="메세지" src="images/basic_letter.png" style="width:30px; height:30px;">
				<% } %>
				</button>
			</span>

			<button id = "login" onclick="location.href = 'views/b_member/login.jsp'">로그인</button>
			<img alt="아이콘" src="images/blanket.png" id="icon">

		</div>
		<div id="subHeader">
			<img alt="로고" src="images/Logo.png" id="logo">
		</div>
		
		<!-- 메뉴 -->
		<nav>
		<table class="menu">
				<tr>
					<td><div class="circle" id="circle1"></div></td>
					<td></td>
					<td><div class="circle" id="circle2"></div></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><div class="circle" id="circle1"></div></td>
					<td></td>
					<td><div class="circle" id="circle2"></div></td>
				</tr>
		</table>
		</nav>
	</header>

	<section>

		<div id="realMain" style="display : inline-block">
				<a href="#" style="transform:translate(0px, 0px);">
					<img src="images/travel.PNG" width="25%" height=35% id="travel"/>
				</a>
		</div>
		
		
	</section>

	<footer>
		<div class="menu" onclick="goThumbnail();">마켓</div>
	</footer>
	
	<script>
		function goMessage(){
			<% if(loginUser != null) {%>
				window.open("<%= request.getContextPath() %>/list.re", "messgaeHome", "width=1000", "height=1000");
			<% } else {%>
				alert("로그인 후 이용해주세요.");
			<% } %>
		}	
		
		function goThumbnail(){
			location.href="<%= request.getContextPath()%>/list.m";
		}
	</script>
	
</body>
</html>