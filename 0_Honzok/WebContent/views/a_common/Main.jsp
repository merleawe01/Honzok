<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "f_message.model.vo.Message"%>
<%@ page import="b_member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	//System.out.println(loginUser);
	String msg = (String)request.getAttribute("msg"); 

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
	#mainHeader {width: 1170px; height: 50px; display: inline-block; float:right;}
	.menuBtn {padding:3px; display: inline-table; float: right;
			 background-color: transparent; border: none; cursor: pointer;}
	.messageBtn {padding:3px; display: inline-table; float: right;
			 background-color: transparent; border: none; cursor: pointer;}
	#login {float: right; padding: 10px; font-family: 'Nanum Gothic', sans-serif; font-size: 13pt;}
	#loginText, #nickname{color: rgb(241, 131, 50); font-weight:bold;}
	#loginText:hover{cursor:pointer;}
	#nickname:hover{color:rgb(118,129,73); cursor:pointer;}
	
	#icon {height: 45px; width: 45px; float: right; vertical-align:center;}
	#main {width: 100%;text-align: center;overflow: hidden;height: auto;}
	#realMain {width: 900px; display: inline-table; min-height: 600px; overflow: hidden; height: auto;}
	#subHeader{width : 1170px; height : 100px;display : inline-block;}
	#logo {height: auto; width: auto; float: center;}
	#travel {position:relative; left:50px; top:100px;}
	
	nav {background-color:#fff4c7; }
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
			<div id="login">
					<% if(loginUser == null){ %>
						<span id="loginText" onclick="goLogin();">로그인</span>
					<%}else{ %>
						<span id="nickname" onclick="location.href='<%= request.getContextPath()%>/myPage.me'"><%= loginUser.getUserName() %></span>님
						<a href="logout.me">로그아웃</a>
					<%} %>
				<img src="images/blanket.png" id="icon">
			</div>
     	</div>
			
		
		
		<div id="subHeader">
			<img alt="로고" src="images/Logo.png" id="logo" onclick="location.href='index.jsp'">
		</div>
		
		<!-- 메뉴 -->
		<nav>
		<table class="menu">
				<tr>
					<td><div class="circle" id="circle1" onclick="goInfo();">욜로홀로솔로</div></td>
					<td></td>
					<td><div class="circle" id="circle2"></div></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><div class="circle" id="circle1" onclick="goGy();">물귤교환</div></td>
					<td></td>
					<td><div class="circle" id="circle2" onclick="goMarket();">혼플리마켓</div></td>
				</tr>
		</table>
		</nav>
	</header>

	<section>


		
		
	</section>

	<footer>

	</footer>
	
	<script>
		function goMessage(){
			<% if(loginUser != null) {%>
				window.open("<%= request.getContextPath() %>/list.re", "messgaeHome", "width=1000", "height=1000");
			<% } else {%>
				alert("로그인 후 이용해주세요.");
			<% } %>
		}	
		
		function goInfo(){
			location.href="<%= request.getContextPath()%>/list.food";
		}
		function goMarket(){
			location.href="<%= request.getContextPath()%>/list.m";
		}
		
		function goGy(){
			location.href="<%= request.getContextPath()%>/list.gy";
		}
		
		function goLogin(){
			location.href="views/b_member/login.jsp"
		}
	</script>
	
</body>
  
</html>