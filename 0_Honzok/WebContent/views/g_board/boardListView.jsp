<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  page import = "java.util.ArrayList, b_member.model.vo.Member" %>
 <%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
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
<title>자유게시판</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
body {overflow-y: scroll;}
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
		#main{
			width : 100%;
			text-align: center;
			height : 1170px;
			
		}
		
		#realMain {
			display : inline-table;
			
			width : 1170px;
			display : inline-table;
			height : 1100px;
			/* 현재 임시값 입력해놓음 */
			margin-left : 40px; 
		}
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
<header>
		<div id="mainHeader"><a href="index.jsp">	
			<img alt="로고" src="images/Logo.png" id="logo"></a>
			
			<img alt="메뉴" src="images/list.png" id="list">
			
			<div id="nickname" onclick="location.href='<%= request.getContextPath()%>/myPage.me'"><%= loginUser.getUserName() %>님</div>
			
			
			</div>
	
		
		<div id="subHeader">
			<div id="boardName">
				자유게시판
			</div>
		</div>
	</header>
	
		
	<section>
		
		
			<div id="main">
			<!-- 자유게시판 쓰는 곳 -->	
			<div class="tableArea">
			<div id="realMain">
				<table id="list">
					<tr>
						<th width=100px>글번호</th>
						<th width=300px>제목</th>
						<th width=100px>작성일</th>
						<th width="100px">조회수</th>
					</tr>
						
		  		 <% if(list.isEmpty()){ %>
               <tr>
                  <td colspan="4">조회된 리스트가 없습니다.</td>
               </tr>
                  
               <% } else{ 
                      for(Board b : list){
               %>
               <tr>
                  <td><%= b.getbId() %><input type="hidden" value='<%= b.getbId() %>'></td>
                  <td><%= b.getbTitle() %></td>
                  <td><%= b.getModifyDate() %></td>
                  <td><%= b.getbCount() %></td>
               </tr>
               <%       }
                  }
               %>

					</table>
				</div>
				<!-- 페이징 -->
				<div class='pagingArea' align='center'>
					<% if(!list.isEmpty()){ %>
					<!-- 맨 처음으로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=1'">&lt;&lt;</button>
					
					<!-- 이전 페이지로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= currentPage-1 %>'" id="beforeBtn">&lt;</button>
					<script>
						if(<%= currentPage %> <= 1){
							var before = $('#beforeBtn');
							before.attr('disabled', 'true');
						}
					</script>
						<!-- 10개의 페이지 목록 -->
					<% for(int p = startPage; p <= endPage; p++){ %>
						<% if(p == currentPage){ %>
							<button id="choosen" disabled><%= p %></button>
						<% } else{ %>
							<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= p %>'"><%= p %></button>
						<% } %>
					<% } %>
					
					<!-- 다음 페이지로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
					<script>
						if(<%= currentPage %> >= <%= maxPage %>){
							var after = $("#afterBtn");
							after.attr('disabled', 'true');
						}
					</script>
					
					<!-- 맨 끝으로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= maxPage %>'">&gt;&gt;</button>
					
					<% } %>
					<div class='searchArea' align='right'>
						<% if(loginUser != null){ %>
						<button onclick='location.href="views/board/boardInsertForm.jsp"'>작성하기</button>
						<% } %>
						</div>
					</div>
				</div>
			</div>
		<script>
				
			
		</div>
	</section>
	
				
	
</body>
</html>