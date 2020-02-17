<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  page import = "java.util.ArrayList, b_member.model.vo.Member, f_message.model.vo.*" %>
<%
	String nickName = ((Member)session.getAttribute("loginUser")).getNickName();
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	body {align:center; background:#FFF6E6;}
	#userMessage {text-align:center; width:480px; height:40px; background:#A0CEDE; color:white;
					font-weight:bold; margin:0 auto;}
	.wrap{background: white; width: 100%; height: 40px; align:center;}
	.menu{background: #e0e0e0; color: black; text-align: center; font-weight: bold;
         vertical-align: middle; width: 160px; height: 40px; display: table-cell; margin:5px auto;}
    #recieve{background: powderblue; }
    nav{width: 480px; margin-left: auto; margin-right: auto; background:#e0e0e0;}
	.menu:hover {cursor:pointer;}
    .tableArea{width:480px; margin-left:auto; margin-right:auto;}
	#list{text-align:center; table-layout: fixed}
	th{color:gray;  padding:2px;}
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
<body onresize="parent.resizeTo(510,600)" onload="parent.resizeTo(510,600)">
	<div class="outer">
		<div id="userMessage">
			<%= nickName %>님의 쪽지함
			<img alt="쪽지이미지" src="images/receive_letter.png"  
					style="width:30px; height:30px; align:center; vertical-align:bottom;">
		</div>
		<div class="wrap" style="margin-bottom:5px;">
			<nav>
				<div class="menu" id="recieve" onclick="goRecieve();">받은쪽지함</div>
				<div class="menu" id="send" onclick="goSend();">보낸쪽지함</div>
				<div class="menu" id="store" onclick="goBox();">쪽지보관함</div>
			</nav>
		</div>
		<div class="tableArea">
		<form action="views/f_message/MessageDetailForm.jsp" id="RListForm" method="post">
			<table id="list">
				<tr>
					<th width=30px>
						<input type="checkbox" name="select" id="All" onclick="selectAll();">
					</th>
					<th width=100px>보낸 사람</th>
					<th width=300px>제목</th>
					<th width=100px>받은 날짜</th>
				</tr>
				
				<% if(list.isEmpty()){ %>
				<tr>
					<td colspan="4">받은 쪽지가 없습니다.</td>
				</tr>
				
				<% } else{  %>
						<% for(Message m : list){ %>
				<tr>
					<td width=30px>
						<input type="checkbox" name="select" id="selectmNo" value="<%= m.getmNo()%>">
						<input type="hidden" name="mNo" id="mNo" value="<%= m.getmNo()%>">
					</td>
					<td width=100px><%= m.getFrom()%></td>
				
				<% if(m.getmTitle().length() > 11) {
					String title = m.getmTitle().substring(0,11);
				%>
					<% if(m.getView() == 0) { %>
						<td style="color:#f18332; width:300px;" id="title"><%= title + "..." %>
							<img src="images/new.png" width=20px; height=20px; style="vertical-align:bottom;">
						</td>
					<% } else { %>
						<td style="color:#768149; width:300px;" id="title"><%= title + "..." %></td>
					<% } %>	
						<td width=100px><%= m.getDate()%></td>
					</tr>
				<% 
					} else{	%>
						<% if(m.getView() == 0) { %>
							<td style="color:#f18332; width:300px;" id="title"><%= m.getmTitle() %>
								<img src="images/new.png" width=20px; height=20px; style="vertical-align:bottom;">
							</td>
						<% } else { %>
							<td style="color:#768149; width:300px;" id="title"><%= m.getmTitle() %></td>
						<% } %>	
							<td width=100px><%= m.getDate()%></td>
						</tr>					
				<% 		
					}
						}
						
					} 
				%>	
			</table>
		</form>
		</div>
		
		<div class="pagingArea" align="center">
			<% if(!list.isEmpty()) { %>
			<!-- 맨 처음으로 -->
			<button onclick="location.href='<%= request.getContextPath()%>/list.re?currentPage=1'">&lt;&lt;</button>
			<!-- 버튼을 클릭하면 Servlet으로 넘어가서 currentPage가 1로 바뀐다. -->
			
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath()%>/list.re?currentPage=<%= currentPage - 1%>'"
					id="beforeBtn">&lt;</button>
			<script>
			if(<%= currentPage%> <= 1){ //1page면 클릭 안되게
				var before = $('#beforeBtn');
				before.attr('disabled', 'true');
			}
			</script>
			
			<!-- 5개의 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
			
				<% if(p == currentPage){ %> <!-- 현재 페이지랑 똑같다면  -->
					<button id="choosen" disabled><%= p %></button>
				<% } else { %>
					<button id="numBtn" onclick ="location.href='<%= request.getContextPath()%>/list.re?currentPage=<%= p %>'"><%= p %></button>
				<% } %> 
			<% } %>
			<!-- 다음 페이지로  -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.re?currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
			<script>
				if(<%= currentPage%> >= <%=maxPage%>){
					var after = $("#afterBtn");
					after.attr('disabled', 'true');
				}
			</script>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='<%= request.getContextPath()%>/list.re?currentPage=<%= maxPage %>'">&gt;&gt;</button>
			
			<% } %>
		
		</div>
		
		<button type="button" class="messageBtn" id="writeBtn"
			onclick="location href='views/f_message/sendMessageForm.jsp'">쪽지보내기</button>
		<button type="button" class="messageBtn" id="storeBtn" >보관</button>
		<button type="button" class="messageBtn" id="deleteBtn">삭제</button>
		
		
	
	</div>
	<script>
	
		$(function(){

			$('#send').hover(function(){
				$(this).css('background','powderblue');
				$('#recieve').css('background','#e0e0e0');
				$('#store').css('background','#e0e0e0');
			});

			$('#store').hover(function(){
				$(this).css('background','powderblue');
				$('#recieve').css('background','#e0e0e0');
				$('#send').css('background','#e0e0e0');
			});
			
			$('.menu').mouseout(function(){
				$('#recieve').css('background','powderblue');
				$('#send').css('background','#e0e0e0');
				$('#store').css('background','#e0e0e0');
			});
			
			$('#list td').mouseenter(function(){
				$(this).parent().css({'background':'pink', 'cursor':'pointer'});
			}).mouseout(function(){
				 $(this).parent().css('background','none');
			}).click(function(){
				var mNo = $(this).parent().children().children('input').val();
			});
			
		});
		
		function selectAll() {
			var check = document.getElementsByName("select");

			for (var i = 0; i < check.length; i++) {
				if (check[0].checked) {
					check[i].checked = true;
				} else {
					check[i].checked = false;
				}
			}
		}
		
		var checkMessage = "";
		function selectMessage() {
			var check = document.getElementsByName("select");

			for (var i = 1; i < check.length; i++) {
				if (check[i].checked == true) {
					checkMessage += check[i].value + ",";
				}
			}
		}
		
		$('#deleteBtn').click(function(){
	        var bool = confirm("선택한 쪽지를 삭제하시겠습니까?");
			if(bool){
				$.ajax({
					url:'delete.re',
					type:'post',
					data: {mNo:checkMessage},
					success: function(data){
						console.log(data);
					}
				});
			}
		});
/* 	         if(bool){
		 			$.ajax({
						url:'delete.re',
						type:'post',
						data: {mNo:checkMessage},
						success: function(data){
							console.log(data);
						}
					});
	         } */
		

		function goRecieve(){
			location.href="<%= request.getContextPath()%>/list.re";
		}
		function goSend(){
			location.href="<%= request.getContextPath()%>/list.se";
		}
		function goBox(){
			location.href="<%= request.getContextPath()%>/list.box"
		}
	</script>
</body>
</html>