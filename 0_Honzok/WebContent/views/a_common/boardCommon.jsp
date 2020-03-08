<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "f_message.model.vo.*, b_member.model.vo.*"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)request.getAttribute("msg"); 

	Message message = new Message();
	int view = message.getView();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a37066af0c038845c5bf58548af2378b&libraries=services"></script>

<style>
	body {
		background-color: #fff9f0;
	}
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
		cursor: pointer;
	}
	#list {
		height : 100%;
		width : auto;
		float : right;
		cursor: pointer;
		margin-left: 10px;
	}
	#icon {
		height : 100%;
		width : auto;
		float : right;
	}
	.messageBtn {padding:3px; display: inline-table; float: right;
          background-color: transparent; border: none; cursor: pointer;}
	#nickname {
		float : right;
		padding : 10px;
		color: rgb(241,131,50);
		font-family: 'Nanum Gothic', sans-serif;
		font-size: 12pt;
		cursor: pointer;
		font-weight: bold;
	}
	/* #nickname::after{
		content : "님";
		color : black;
	} */
	#logout {
		float : right;
		padding : 10px;
		color: rgb(118,129,73);
		font-family: 'Nanum Gothic', sans-serif;
		font-size: 12pt;
		cursor: pointer;
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
	
	body {
       	overflow-y:scroll;
       	text-align: center;
       	font-family: 'Nanum Gothic', sans-serif;
	}
	@media only screen and (max-width: 1200px) {
		.sidebar {
			display:none;
		}
	}
	
	#quicklink {
		position: fixed;
		top: 250px;
	}
	#quicklink table {
		display: inline-table;
		text-align: center;
		border-top: 2px solid gray;
		border-bottom: 2px solid gray;
		margin-bottom: 20px;
	}
	.boardTr{width:50px; height:100px; background-color: white;}
	#quicklink td {
		cursor: pointer;
	}
	.td {
		border-bottom: 1px solid gray;
	}
	#quicklink img {
		width: 50px;
		height: auto;
		cursor: pointer;
	}
	
	#topBt{
	 display: none;}
	
	#main {
		width : 900px;
		display : inline-table;
		font-family: 'Nanum Gothic', sans-serif;
		min-height : 600px;
		overflow:hidden;
		height:auto;
		margin-bottom: 20px;
		text-align: center;
	}
	
	 nav {
      background-color:#fff4c7;
      position: fixed;
      width: 99%;
      height: 90%;
      top: 60px;
      z-index: 3;
   }
   .menu {margin:100px auto;}
   .menu img {width: 100%; height: 100%; cursor: pointer;}
   .circle {width:250px; height: 250px; border-radius: 80%; background-color:gray;
         margin:30px auto; margin-left:20px; margin-right:20px; display:inline-block;}
         
</style>

</head>
<body>
	<header>
		<div id="mainHeader">
			<img alt="로고" src="<%= request.getContextPath() %>/images/Logo.png" onclick="location.href='<%= request.getContextPath()%>'" id="logo">
			<img alt="메뉴" src="<%= request.getContextPath() %>/images/list.png" id="list" onclick="slideMenu()">
			
			<span id="message">
				<button type="button" class="messageBtn" onclick="goMessage();">
 				<% if(view == 0) {%> 
					<img alt="메세지" src="<%= request.getContextPath() %>/images/receive_letter.png" style="width:40px; height:40px;">
				<% } else { %>
					<img alt="메세지" src="<%= request.getContextPath() %>/images/basic_letter.png" style="width:40px; height:40px;">
				<% } %>
				</button>
			</span>
			
			<% if(loginUser == null){ %>
				<div id="nickname" onclick="location.href='views/b_member/login.jsp'">로그인</div>
			<%}else{ %>
				<div id="logout">로그아웃</div>
				<div id="nickname" onclick="location.href='<%= request.getContextPath()%>/myPage.me'"><%= loginUser.getUserName() %>님</div>
			<%} %>
					
			<img alt="아이콘" src="<%= request.getContextPath() %>/images/blanket.png" id="icon">
			
			<div id="quicklink">
				<table>
					<tr class="boardTr"><td class="td" onclick="moveLink('list.food');">욜로홀로솔로</td></tr>
					<tr class="boardTr"><td class="td" onclick="moveLink('list.bo');">자유게시판</td></tr>
					<tr class="boardTr"><td class="td" onclick="moveLink('list.gy');">물귤교환</td></tr>
					<tr class="boardTr"><td onclick="moveLink('list.m');">혼플리마켓</td></tr>
				</table>
				
				<br>
				<img id="goTop" src="<%= request.getContextPath() %>/images/top_button2.png">
				
				<script>
					$('#logout').click(function(){
						location.href="<%= request.getContextPath()%>/logout.me?page=" + window.location.pathname.substring(10);
					})
					
					function moveLink(link){
						location.href="<%= request.getContextPath() %>/" + link;
					}
				
					$("#goTop").click(function() {
			            $('html, body').animate({
			                scrollTop : 0
			            }, 300);
			            return false;
			        });
					
					function goMessage(){
						<% if(loginUser != null) {%>
							window.open("<%= request.getContextPath() %>/list.re", "messgaeHome", "width=1000", "height=1000");
						<% } else {%>
							alert("로그인 후 이용해주세요.");
						<% } %>
					}
				</script>
				
			</div>
		</div>
		
		<div id="subHeader">
			<div id="boardName">
				게시판이름 작성하기
			</div>
		</div>
		
		<nav hidden="">
			<table class="menu">
				<tr>
					<td><div class="circle" id="circle1" onclick="goInfo();"><img src="<%= request.getContextPath() %>/images/menu_info.png"></div></td>
					<td></td>
					<td><div class="circle" id="circle2" onclick="goFree();"><img src="<%= request.getContextPath() %>/images/menu_free.png"></div></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><div class="circle" id="circle1" onclick="goGy();"><img src="<%= request.getContextPath() %>/images/menu_barter.png"></div></td>
					<td></td>
					<td><div class="circle" id="circle2" onclick="goMarket();"><img src="<%= request.getContextPath() %>/images/menu_market.png"></div></td>
				</tr>
			</table>
		</nav>
		
		<script>
			$('nav').height($(document).height()-50)
			var updownCheck = true;
			
			function slideMenu() {
				if(updownCheck) {
					$('nav').slideDown(300);
					updownCheck = false;
					document.body.style.overflow= 'hidden';
				} else {
					$('nav').slideUp(300);
					updownCheck = true;
					document.body.style.overflow= 'visible';
				}
			}
		
			function goInfo(){
				location.href="<%= request.getContextPath()%>/list.food";
			}
			function goFree(){
				location.href="<%= request.getContextPath()%>/list.bo";
			}
			function goMarket(){
				location.href="<%= request.getContextPath()%>/list.m";
			}
			function goGy(){
				location.href="<%= request.getContextPath()%>/list.gy";
			};
		</script>
	</header>
</body>
</html>