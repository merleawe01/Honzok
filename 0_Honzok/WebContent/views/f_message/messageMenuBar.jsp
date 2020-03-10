<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  page import = "java.util.ArrayList, b_member.model.vo.Member, f_message.model.vo.*" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String nickName = ((Member)session.getAttribute("loginUser")).getNickName();
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	body {align:center; background:#FFF6E6; font-family: 'Nanum Gothic', sans-serif;}
	#userMessage {text-align:center; width:480px; height:40px; background:#A0CEDE; color:white;
					font-weight:bold; margin:0 auto;}
	.wrap{width: 100%; height: 40px; align:center;}
	.menu{background: #e0e0e0; color: black; text-align: center; font-weight: bold;
         vertical-align: middle; width: 160px; height: 40px; display: table-cell; margin:5px auto;}
    nav{width: 480px; margin-left: auto; margin-right: auto; background:#e0e0e0;}
	.menu:hover {cursor:pointer;}
    .tableArea{width:480px; margin-left:auto; margin-right:auto;}
	#list{text-align:center; table-layout: fixed}
	#list td{height:40px; white-space:nowrap; overflow:hidden; word-break:break-all;}
	td #title{overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width:300px;}
	button{border: 0px; border-radius: 5px; background:#e0e0e0; padding:5px auto;}
	button:hover{cursor: pointer;}
	.messageBtn{background: #AEBF2A; color:white; float:right; display:inline-block;
			 padding:5px; margin:5px;}
	.pagingArea {margin-top:10px;}
	.pagingArea button{margin:3px; padding:10px;}
	#choosen{background:#f18332; color:white;}

</style>
</head>
<body onresize="parent.resizeTo(530,600)" onload="parent.resizeTo(530,600)">
	<% if(loginUser != null) { %>

	<div class="outer">
		<div id="userMessage">
			<%= nickName %>님의 쪽지함
			<img alt="쪽지이미지" src="<%=request.getContextPath() %>/images/receive_letter.png"  
					style="width:30px; height:30px; align:center; vertical-align:bottom;">
		</div>
		<div class="wrap" style="margin-bottom:5px;">
			<nav>
				<div class="menu" id="recieve" onclick="goRecieve();">받은쪽지함</div>
				<div class="menu" id="send" onclick="goSend();">보낸쪽지함</div>
				<div class="menu" id="store" onclick="goBox();">쪽지보관함</div>
			</nav>
		</div>
	</div>
		
	<script>
	
		var msg = "<%= msg %>";
		
		$(function(){
			if(msg != "null") 
				alert(msg);
		});
				

		$('#send').hover(function() {
			$(this).css('background', 'powderblue');
			$('#recieve').css('background', '#e0e0e0');
			$('#store').css('background', '#e0e0e0');
		});

		$('#store').hover(function() {
			$(this).css('background', 'powderblue');
			$('#recieve').css('background', '#e0e0e0');
			$('#send').css('background', '#e0e0e0');
		});

		$('#recieve').hover(function() {
			$(this).css('background', 'powderblue');
			$('#store').css('background', '#e0e0e0');
			$('#send').css('background', '#e0e0e0');
		});
		

		function goRecieve() {
			location.href = "<%= request.getContextPath()%>/list.re";
		}
		function goSend(){
			location.href="<%= request.getContextPath()%>/list.se";
		}
		function goBox(){
			location.href="<%= request.getContextPath()%>/list.box"
		}
	</script>
	<% } else { %>
	<script>
		alert("로그인 후 이용해주세요!");
	</script>
	<% } %>
</body>
</html>