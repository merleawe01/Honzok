<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  page import = "java.util.ArrayList, b_member.model.vo.Member, f_message.model.vo.*" %>
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
    #store{background: powderblue;}
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
	<form action="/list.box" id="BoxListForm" method="post">
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
				<td colspan="4">보관한 쪽지가 없습니다.</td>
			</tr>
				
			<% } else{  %>
					<% for(Message m : list){ %>
			<tr id="contentTr">
				<td width=30px>
					<input type="checkbox" name="select" id="selectmNo" value="<%= m.getmNo()%>">
					<input type="hidden" name="mNo" id="mNo" value="<%= m.getmNo()%>">
				</td>
				<td class="detail" width=100px><%= m.getFrom()%></td>
				
			<% if(m.getmTitle().length() > 11) {
				String title = m.getmTitle().substring(0,11);
			%>
				<% if(m.getView() == 0) { %>
					<td class="detail" style="color:#f18332; width:300px;" id="title"><%= title + "..." %>
						<img src="images/new.png" width=20px; height=20px; style="vertical-align:bottom;">
					</td>
				<% } else { %>
					<td class="detail" style="color:#768149; width:300px;" id="title"><%= title + "..." %></td>
				<% } %>	
					<td class="detail" width=100px><%= m.getDate()%></td>
				</tr>
			<% 
				} else{	%>
					<% if(m.getView() == 0) { %>
						<td class="detail" style="color:#f18332; width:300px;" id="title"><%= m.getmTitle() %>
							<img src="images/new.png" width=20px; height=20px; style="vertical-align:bottom;">
						</td>
					<% } else { %>
						<td class="detail" style="color:#768149; width:300px;" id="title"><%= m.getmTitle() %></td>
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
		<button class="pagingBtn" onclick="location.href='<%= request.getContextPath()%>/list.box?currentPage=1'">&lt;&lt;</button>
		<!-- 버튼을 클릭하면 Servlet으로 넘어가서 currentPage가 1로 바뀐다. -->
			
		<!-- 이전 페이지로 -->
		<button onclick="location.href='<%= request.getContextPath()%>/list.box?currentPage=<%= currentPage - 1%>'"
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
				<button id="numBtn" onclick ="location.href='<%= request.getContextPath()%>/list.box?currentPage=<%= p %>'"><%= p %></button>
			<% } %> 
		<% } %>
		
		<!-- 다음 페이지로  -->
		<button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/list.box?currentPage=<%= currentPage + 1 %>'" id="afterBtn">next</button>
		<script>
			if(<%= currentPage%> >= <%=maxPage%>){
				var after = $("#afterBtn");
				after.attr('disabled', 'true');
			}
		</script>
			
		<!-- 맨 끝으로 -->
		<button class="pagingBtn" onclick="location.href='<%= request.getContextPath()%>/list.box?currentPage=<%= maxPage %>'">&gt;&gt;</button>
			
		<% } %>
		
	</div>
	<br>

	<button type="button" class="messageBtn" id="storeBtn" onclick="offMessage();">보관 해제</button>
			
	<script>
		$(function(){
			$('.detail').mouseenter(function(){
					$(this).parent().css({'background':'#FFD393', 'cursor':'pointer'});
				}).mouseout(function(){
					 $(this).parent().css('background','none');
				}).click(function(){
					var mNo = $(this).parent().children().children('input').val();
					location.href='<%= request.getContextPath() %>/detail.st?mNo=' + mNo;
				});
			
			$('.pagingBtn').mouseenter(function(){
				$(this).css('background','#FFD393');
			}).mouseout(function(){
				$(this).css('background','none');
			});
		});
		
		$('.menu').mouseout(function() {
			$('#store').css('background', 'powderblue');
			$('#send').css('background', '#e0e0e0');
			$('#recieve').css('background', '#e0e0e0');
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
		function offMessage(){
			var bool = confirm("선택한 쪽지를 보관 해제하시겠습니까?");
			if(bool){
				var check = document.getElementsByName("select");
				
				for (var i=1; i<check.length; i++){
					if(check[i].checked == true){
						checkMessage += check[i].value + ",";
					}
				}
				
				var mNo = $("#mNo").val(checkMessage).val();
				console.log(mNo);
				
				$('#BoxListForm').attr('action', '<%= request.getContextPath()%>/off.msg');
				$('#BoxListForm').submit();
			}
		}

	</script>
</body>
</html>