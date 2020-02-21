<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  page import = "java.util.ArrayList, b_member.model.vo.Member, f_message.model.vo.*, a_common.*" %>
<%
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
    .tableArea{width:480px; margin-left:auto; margin-right:auto;}
    #send{background: powderblue;}
	#list{text-align:center; table-layout: fixed}
	th{color:gray;  padding:5px; margin:5px;}
	.detail{height:40px; padding:5px; white-space:nowrap; overflow:hidden; word-break:break-all;}
	td #title{overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width:300px;}
	button{border: 0px; border-radius: 5px; background:gray; padding:5px auto;}
	button:hover{cursor: pointer;}
	.messageBtn{background: #AEBF2A; color:white; float:right; display:inline-block;
			 padding:5px; margin:5px;}
	.pagingArea {margin-top:10px;}
	.pagingArea button{background:none; border-radius:50px; color:#805959; margin:3px; padding:10px auto;}
	#numBtn{background:none; margin:3px; padding:10px auto;}
	#choosen{background:#f18332; border-radius:50px; color:white;}

</style>
</head>
<body onresize="parent.resizeTo(530,600)" onload="parent.resizeTo(530,600)">
	<%@ include file="messageMenuBar.jsp"%>
	
	<div class="tableArea">
	<form action="/list.se" id="SeListForm" method="post">
		<table id="list">
			<tr>
				<th width=100px>받은 사람</th>
				<th width=300px>제목</th>
				<th width=100px>보낸 날짜</th>
			</tr>
				
			<% if(list.isEmpty()){ %>
			<tr>
				<td colspan="3">보낸 쪽지가 없습니다.</td>
			</tr>
				
			<% } else{  %>
					<% for(Message m : list){ %>
			<tr id="contentTr">
				
				<td class="detail" width=100px>
				<input type="hidden" name="mNo" id="mNo" value="<%= m.getmNo()%>"/>
				<%= m.getTo()%>
				</td>
				
			<% if(m.getmTitle().length() > 11) {
				String title = m.getmTitle().substring(0,11);
			%>
				<td class="detail" style="color:#768149; width:300px;" id="title"><%= title + "..." %></td>
				<td class="detail" width=100px><%= m.getDate()%></td>
			</tr>
			<% 
				} else{	%>
					<td class="detail" style="color:#768149; width:300px;" id="title"><%= m.getmTitle() %></td>
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
		<button class="pagingBtn" onclick="location.href='<%= request.getContextPath()%>/list.se?currentPage=1'">&lt;&lt;</button>
		<!-- 버튼을 클릭하면 Servlet으로 넘어가서 currentPage가 1로 바뀐다. -->
			
		<!-- 이전 페이지로 -->
		<button onclick="location.href='<%= request.getContextPath()%>/list.se?currentPage=<%= currentPage - 1%>'"
				id="beforeBtn" class="pagingBtn">pre</button>
		
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
				<button id="numBtn" onclick ="location.href='<%= request.getContextPath()%>/list.se?currentPage=<%= p %>'"><%= p %></button>
			<% } %> 
		<% } %>
		
		<!-- 다음 페이지로  -->
		<button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/list.se?currentPage=<%= currentPage + 1 %>'" id="afterBtn">next</button>
		<script>
			if(<%= currentPage%> >= <%=maxPage%>){
				var after = $("#afterBtn");
				after.attr('disabled', 'true');
			}
		</script>
			
		<!-- 맨 끝으로 -->
		<button class="pagingBtn" onclick="location.href='<%= request.getContextPath()%>/list.se?currentPage=<%= maxPage %>'">&gt;&gt;</button>
			
		<% } %>
		
	</div>
	<br>

	<button class="messageBtn" id="writeBtn"
			onclick="location.href='views/f_message/sendMessageForm.jsp'">쪽지보내기</button>
			
	<script>
		$(function(){
			$('.detail').mouseenter(function(){
					$(this).parent().css({'background':'#FFD393', 'cursor':'pointer'});
				}).mouseout(function(){
					 $(this).parent().css('background','none');
				}).click(function(){
					var mNo = $(this).parent().children().children('input').val();
					location.href='<%= request.getContextPath() %>/detail.se?mNo=' + mNo;
				});
			
			$('.pagingBtn').mouseenter(function(){
				$(this).css('background','#FFD393');
			}).mouseout(function(){
				$(this).css('background','none');
			});
		});
		
		$('.menu').mouseout(function() {
			$('#send').css('background', 'powderblue');
			$('#store').css('background', '#e0e0e0');
			$('#recieve').css('background', '#e0e0e0');
		});

	</script>
</body>
</html>