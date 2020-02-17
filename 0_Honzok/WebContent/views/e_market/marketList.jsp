<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, e_market.model.vo.*" %> 
<%
	ArrayList<Market> mList = (ArrayList<Market>)request.getAttribute("mList");
	ArrayList<Attachment> fList = (ArrayList<Attachment>)request.getAttribute("fList");
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
	.tableArea{width:800px; height:auto; margin-left:auto; margin-right:auto;}
		#listArea{text-align:center; height:250px;}
		#write{  text-align:center;
				 font-size : 15pt;
				  width : 100px;
				  height : 40px;
			      background-color : rgb(241, 131, 50);
			      color : white;
			      border-radius: 5px;
			      border: 0;
			      font-weight: bold;
			      line-height: 40px;
			      margin-left: 650px;
			      cursor:pointer;}
		.searchArea {width:80px; margin-left:auto; margin-right:auto; float:right;}
		#insertBtn{background-color : rgb(241, 131, 50); border-radius: 15px; border:0px; color: white; width: 80px; height: 25px; cursor: pointer;}
		footer{margin-bottom : 100px;}
</style>

</head>
<body>
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('혼플리마켓');
	</script>
	
	<div id="main">
		<div class="tableArea">
				<table id="listArea" border="1">
				
				<% if(mList.isEmpty()){ %>
				
					<div>조회된 리스트가 없습니다.</div>
				
				<% } else{ 
						for(Market m : mList){
				%>	
					<tr> 
						<td rowspan="4" width="300px">
							<% for(int i = 0; i < fList.size(); i++) {
							Attachment a = fList.get(i);
							%>
								<% if(m.getPostNo() == a.getPostNo()){%>
									<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= a.getChangeName()%>" width="200px" height="150px">
								<% } %>				
							<% } %>
							
						</td>
						<td width="600px">◈<%= m.getPostTitle() %>◈</td>
							
					</tr>
						
					<tr>
						<td>상태:<%= m.getItemStatus() %></td>
					</tr>
						
					<tr>
						<td>가격:<%= m.getItemPrice() %></td>
					</tr>
						
					<tr>
						<td>기타:<%= m.getEtc() %></td>
					</tr>
					<% 		}
					}
				%>
				</table>
					
					<br><br>
					
				<div class="searchArea">
					<%-- <% if(loginUser != null) { %> --%>
						<button onclick="location.href='views/e_market/marketInsertForm.jsp'" id="insertBtn">글쓰기</button>
					<%-- <% } %> --%>
				</div>	
			</div>
			<br><br>
				
		<div class='pagingArea' align='center'>
			<% if(!mList.isEmpty()){ %>
			<!-- 맨 처음으로 -->
			<button onclick="location.href='<%= request.getContextPath()%>/list.m?currentPage=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath()%>/list.m?currentPage=<%= currentPage-1%>'" id="beforeBtn">&lt;</button>
			<script>
				if(<%= currentPage%> <= 1){
					var before = $('#beforeBtn');
					before.attr('disabled', 'true');
				}
			</script>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button id="choosen" disabled><%= p %></button>
				<% } else {%>
				<button id="numBtn" onclick="location.href='<%= request.getContextPath()%>/list.m?currentPage=<%= p %>'"><%= p %></button>
				<% } %>
			<% } %>
			
			<!-- 다음페이지로 -->
			<button onclick="location.href='<%= request.getContextPath()%>/list.m?currentPage=<%= currentPage + 1%>'" id="afterBtn">&gt;</button>
			<script>
				if(<%= currentPage%> >= <%= maxPage%>){
					var after = $("#afterBtn");
					after.attr('disabled', 'true');
				}
			</script>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.m?currentPage=<%= maxPage %>'">&gt;&gt;</button>
			
			<% } %>
			
		
		</div>
	</div>
	
	<script>
		$(function(){
			$('.listArea').click(function(){
				var bid = $(this).children().children().eq(0).val();
				location.href="<%= request.getContextPath() %>/detail.m?postno=" + postno;
			})
		});
	</script>
	
</body>
</html>