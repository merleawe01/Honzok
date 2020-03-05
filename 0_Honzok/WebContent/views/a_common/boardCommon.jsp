<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "f_message.model.vo.*, b_member.model.vo.*"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	/* String msg = (String)request.getAttribute("msg"); 

	Message m = new Message();
	int view = m.getView(); */
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
	}
	#icon {
		height : 100%;
		width : auto;
		float : right;
	}
	#nickname {
		float : right;
		padding : 10px;
		color: rgb(241,131,50);
		font-family: 'Nanum Gothic', sans-serif;
		font-size: 12pt;
		cursor: pointer;
	}
	/* #nickname::after{
		content : "님";
		color : black;
	} */
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
		top: 300px;
	}
	#quicklink table {
		display: inline-table;
		text-align: center;
		background-color: rgb(252, 223, 212);
		border-top: 2px solid gray;
		border-bottom: 2px solid gray;
		margin-bottom: 20px;
	}
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
</style>

</head>
<body>
	<header>
		<div id="mainHeader">
			<img alt="로고" src="<%= request.getContextPath() %>/images/Logo.png" onclick="location.href='<%= request.getContextPath()%>'" id="logo">
			<img alt="메뉴" src="<%= request.getContextPath() %>/images/list.png" id="list">
			
			<!-- 추후에 로그인 이전과 이후로 구분할 예정 -->
			
			<% if(loginUser == null){ %>
				<div id="nickname" onclick="location.href='views/b_member/login.jsp'">로그인</div>
			<%}else{ %>
				<div id="nickname" onclick="location.href='<%= request.getContextPath()%>/myPage.me'"><%= loginUser.getUserName() %>님</div>
			<%} %>
					
			<img alt="아이콘" src="<%= request.getContextPath() %>/images/blanket.png" id="icon">
			
			<div id="quicklink">
				<table>
					<tr><td class="td" onclick="moveLink('list.food');">욜로홀로솔로</td></tr>
					<tr><td class="td" onclick="moveLink('');">자유게시판</td></tr>
					<tr><td class="td" onclick="moveLink('list.gy');">물귤교환</td></tr>
					<tr><td onclick="moveLink('list.m');">혼플리마켓</td></tr>
				</table>
				
				<br>
				<img id="goTop" src="<%= request.getContextPath() %>/images/top_button2.png">
				
				<script>
					function moveLink(link){
						location.href="<%= request.getContextPath() %>/" + link;
					}
					
					$("#goTop").click(function() {
			            $('html, body').animate({
			                scrollTop : 0
			            }, 300);
			            return false;
			        });
				</script>
				
			</div>
		</div>
		
		<div id="subHeader">
			<div id="boardName">
				게시판이름
			</div>
		</div>
	</header>
	
	
	
</body>

</html>