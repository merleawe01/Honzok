<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, e_market.model.vo.*, a_common.*" %> 
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
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
	.tableArea{width:800px; height:auto; margin-left:auto; margin-right:auto;}
		.listArea{text-align:center; height:250px;}
		#write{text-align:center; font-size : 17pt; width : 100px; height : 40px;
			   background-color : rgb(241, 131, 50); color : white; border-radius: 5px;
			   border: 0; font-weight: bold; line-height: 40px; margin-left: 650px;
			   cursor:pointer;}
		.searchArea {width:80px; margin-left:auto; margin-right:auto; float:right;}
		#insertBtn{background-color : rgb(241, 131, 50); border-radius: 5px; border:0px; font-size:17px;
					color: white; width: 100px; height: 40px; cursor: pointer; font-weight: bold; }
		.listArea{cursor:pointer; border-spacing: 10px;}
		
		#border td{border-bottom : 1px solid black;}
		.pagingArea{display:block;}
	    .pagingArea > button{background:none; border-radius:50px; color:#805959; padding:10px auto;}
	    #numBtn{background:none; margin:3px; padding:10px auto;}
  		#choosen{background:#f18332; border-radius:50px; color:white;}
 
	}
	    
</style>

</head>
<body>
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('혼플리마켓');
	</script>
	
	<div id="main">
		<div class="tableArea">
				<table class="listArea" >
				
				<% if(mList.isEmpty()){ %>
				
					<div>조회된 리스트가 없습니다.</div>
				
				<% } else{ 
						for(int i = 0; i < mList.size(); i++){
							Market m = mList.get(i);
				%>	
					<tr id="borderTr"> 
						<td rowspan="4" width="300px">
						<input type="hidden" value ="<%= m.getPostNo() %>">
							<% for(int j = 0; j < fList.size(); j++) {
								Attachment a = fList.get(j);
							%>
								<% if(m.getPostNo() == a.getPostNo()){%>
									<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= a.getChangeName()%>" width="300px" height="200px">
								<% } %>				
							<% } %>
							
						</td>
						<td width="600px" style="border-top: 1px solid black">◈<%= m.getPostTitle() %>◈</td>
							
					</tr>
						
					<tr>
						<td >상태 : <%= m.getItemStatus() %>급</td>
					</tr>
						
					<tr>
						<td >가격 : <%= m.getItemPrice() %>원</td>
					</tr>
						
					<tr>
						<td style="border-bottom: 1px solid black">기타 : <%= m.getEtc() %></td>
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
			<br><br><br>
				
		<div class="pagingArea" align="center">
			<% if(!mList.isEmpty()){ %>
			<!-- 맨 처음으로 -->
			<button type="button" class="pagingBtn" onclick="location.href='<%= request.getContextPath()%>/list.m?currentPage=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button type="button" onclick="location.href='<%= request.getContextPath()%>/list.m?currentPage=<%= currentPage-1%>'" id="beforeBtn" class="pagingBtn">&lt;</button>
			
			<script>
				if(<%= currentPage%> <= 1){
					var before = $('#beforeBtn');
					before.attr('disabled', 'true');
				}
			</script>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button  type="button" id="choosen" disabled><%= p %></button>
				<% } else {%>
				<button  type="button" id="numBtn" onclick="location.href='<%= request.getContextPath()%>/list.m?currentPage=<%= p %>'"><%= p %></button>
				<% } %>
			<% } %>
			
			<!-- 다음페이지로 -->
			<button type="button" class="pagingBtn" onclick="location.href='<%= request.getContextPath()%>/list.m?currentPage=<%= currentPage + 1%>'" id="afterBtn">&gt;</button>
			<script>
				if(<%= currentPage%> >= <%= maxPage%>){
					var after = $("#afterBtn");
					after.attr('disabled', 'true');
				}
			</script>
			
			<!-- 맨 끝으로 -->
			<button type="button" class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/list.m?currentPage=<%= maxPage %>'">&gt;&gt;</button>
			
			<% } %>
			
		
		</div>
	</div>
	
	<script>
    $('.pagingBtn').mouseenter(function(){
        $(this).css('background','#FFD393');
     }).mouseout(function(){
        $(this).css('background','none');
     });
	
		$(function(){
			$('.listArea img').click(function(){
				var postno = $(this).prev().val();
				location.href="<%= request.getContextPath() %>/detail.m?postNo=" + postno;
			})
		});
		
	</script>
	
</body>
</html>