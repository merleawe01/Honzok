<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, g_board.model.vo.*, a_common.*" %>
<%
	ArrayList<Board> List = (ArrayList<Board>)request.getAttribute("List");
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
<title>Insert title here</title>
<style>
		#title_table {
			border-collapse: collapse;
			border-spacing: 0;
			margin-left : 90px;
			font-weight: bold;
			height:60px;
			font-family: 'Nanum Gothic', sans-serif;
			font-size: 17pt;
			display : inline-table;
		
		}
		
		.list_title{
			background : orange;
			color : white;
		}
		
		#th1{ width:90px; height:50px; border-radius : 10px 0px 0px 10px;}
		#th2{ width:380px;  }
		#th3{ width:145px; }
		#th4{ width:100px; }
		#th5{ width:100px; border-radius : 0px 10px 10px 0px; }		
		
		#list_table{
			margin-top : 30px;
			margin-left : 90px;
			border-collapse: collapse;
			border-spacing: 0;
			border-top : 2px solid gray;
			border-bottom : 2px solid gray;
		}
		
		#list_table td { border-bottom : 2px solid lightgray; }
		
		.list_line{
			height:70px;
			cursor : pointer;
		}
		
		#sell{
			width : 50px;
			height : 50px;
		}
		
		#td1{ width:100px; height:30px; }
		#td2{ width:380px;}
		#td3{ width:100px; }
		#td4{ width:145px; }
		#td5{ width:100px; }
		.list_line2{
			font-size : 15px;
		}
		
		#go_write{
			font-weight : bold;
			font-size : 18px;
			width : 100px;
			height : 40px;
			border : 0px;
			border-radius: 5px;
			background-color: rgb(224, 224, 224);
			cursor: pointer;
			margin-left : 800px;
			margin-top : 15px;
			font-weight: bold;
		}
		#go_write:hover {
		background-color: rgb(241, 131, 50);
		color: white;
		}
	
		
		.searchArea{text-align:center;
		}
		
		.wordArea{height:25px; 
		width:250px; 
		margin-top:10px; 
		border:1px solid #f18332; 
		background:#fff; 
		display:inline-block; 
		vertical-align:bottom;
		}
		
		.selectArea{height:27px; 
		margin-top:0px; 
		display:inline-block;
		}
		
		select{height:27px; 
		border:1px solid #f18332;
		}
		
		option{border:1px solid #f18332;
		}
		
		#word{font-size:12px; 
		width:195px; 
		padding:5px; 
		margin-left:5px; 
		border: 0px; 
		outline:none; 
		float:left;
		}
		
		#searchBtn{width:40px; 
		height:100%; 
		border: 0px; 
		border-radius:0px; 
		background: #f18332; 
		outline: none; 
		float:right; 
		color: #fff;
		}
		
		#noList{text-align:center; width:900px; height:300px;}

		button:hover{
			cursor: pointer;}
		
		#numBtn{
			background:none;
			margin:3px; 
			padding:10px auto;}
		#choosen{
			background:#f18332; 
			border-radius:50px; 
			color:white;}
		
		.pagingArea{
			display:block;
		}
		
		.pagingArea > button{
			background:none; 
			border-radius:50px; 
			color:#805959; 
			padding:10px auto;
			border:0;
			}
</style>
</head>
<body>
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('자유게시판');
	</script>
	
	<div id="main">
	
	<div id = "tablearea1">
					<table id = "title_table">
						<tr>
							<th class="list_title" id="th1">번호</th>
							<th class="list_title" id="th2">제목</th>
							<th class="list_title" id="th4">조회수</th>
							<th class="list_title" id="th3">작성일</th>
							<th class="list_title" id="th5">작성자</th>
						</tr>
					</table>
				</div>
				
				<div id = "tablearea2">
					<table id = "list_table">
						<!-- 게시글 불러오는곳 -->
				<% if(List.isEmpty()){ %>
					<tr>
						<td id="noList">존재하는 게시글이 없습니다.</td>
					</tr>
				<% } else{ 
						 for(Board b : List){ 
						
							 %>
							<tr id="contentTr">
						<td class = "list_line2" id="td1"  ><input type = "hidden" name="select"   value="<%= b.getPostNo() %>"><%= b.getPostNo() %></td>
							<td class = "list_line2" id="td2" ><%= b.getPostTitle() %></td>
							<td class="list_line2" id="td3"><%= b.getViewCount() %></td>
							<td class="list_line2" id="td4"><%= b.getWriteDate() %></td>
							<td class="list_line2" id="td5"><%= b.getNickname() %></td>
						</tr>
						<% }
							}%>
					</table>
				</div>
				
				<div id = "write">
				
					<button onclick = "location.href = 'views/g_board/boardWrite.jsp'" id = "go_write">글쓰기</button>
				
				</div>
				
				<!-- 페이징 -->
				<div class = 'pagingArea' align='center'>
					<% if(!List.isEmpty()){ %>
					<!-- 맨 처음으로 -->
					<button class="pagingBtn" onclick = "location.href='<%= request.getContextPath() %>/list.bo?currentPage=1'">&lt;&lt;</button>
					<!-- 이전 페이지로 -->
                    <button onclick = "location.href ='<%= request.getContextPath() %>/list.bo?currentPage=<%= currentPage-1 %>'" id = "beforeBtn"  class="pagingBtn">pre</button>
                    <script>
                    	if(<%= currentPage %> <= 1){
                    		var before = $('#beforeBtn');
                    		before.attr('disabled','true');
                    	}
                    </script>
                    
                    <!-- 10개의 페이지 목록 -->
                    <% for(int p = startPage; p <= endPage; p++){ %>
                    	<% if(p == currentPage){ %>
                    		<button id = "choosen" disabled><%= p %></button>
                    	<% }else{ %>
                    		<button id = "numBtn" onclick = "location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= p %>'"><%= p %></button>
                    	<% } %>	
                    <% } %>
                    
                    <!-- 다음 페이지로 -->
                    <button class="pagingBtn" onclick = "location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= currentPage + 1 %>'"id = "afterBtn">next</button>
                    <script>
                    	if(<%= currentPage %> >= <%= maxPage %>){
                    		var after = $("#afterBtn");
                    		after.attr('disabled','true');
                    	}
                    </script>
                    
                    <!-- 맨 끝으로 -->
                    <button class="pagingBtn" onclick = "location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= maxPage %>'">&gt;&gt;</button>
                     
                   <% } %>
				</div>
	
	</div>
	<script>
	$(function(){
		$('#contentTr td').mouseenter(function(){
			$(this).parent().css({'background':'#FFD393', 'cursor':'pointer'});
		}).mouseout(function(){
			$(this).parent().css('background', 'none');
		}).click(function(){
			var pn = $(this).parent().children().children('input').val();
		}); 
	});
			
	$(function(){
			$('.list_line2').click(function(){
				var pn = $(this).parent().children().eq(0).children().val();
				location.href="<%= request.getContextPath()%>/detail.bo?postNo="+pn;
			});
		});
		$(function(){
			$('.pagingBtn').mouseenter(function(){
				$(this).css('background','#FFD393');
			}).mouseout(function(){
				$(this).css('background','none');
			});
		});
	
	</script>
</body>
</html>