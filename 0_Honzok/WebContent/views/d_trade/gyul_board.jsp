<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, d_trade.model.vo.*" %>
<%
	ArrayList<Trade> tList = (ArrayList<Trade>)request.getAttribute("tList");
	ArrayList<Image> iList = (ArrayList<Image>)request.getAttribute("iList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		#nickname::after{
			content: "님";
			color : black;
		}
		#boardName{
			margin : 20px;
			width : 100%;
			height : 70px;
			font-family: 'Nanum Gothic', sans-serif;
			font-size: 30pt;
			font-weight: bold;
			display : inline-table;
			border-bottom: 2px solid gray;
		}

		
		#title_table {
			border-collapse: collapse;
			border-spacing: 0;
			margin-left : 90px;
		}
		
		#gyul{
			width:25px;
			height:25px;
		}
		
		.list_title{
			background : orange;
			color : white;
		}
		
		#th1{ width:250px; height:50px; border-radius : 10px 0px 0px 10px; }
		#th2{ width:130px; }
		#th3{ width:130px; }
		#th4{ width:150px; }
		#th5{ width:150px; border-radius : 0px 10px 10px 0px; }
				
		
		#list_table{
			margin-top : 30px;
			border-collapse: collapse;
			border-spacing: 0;
			border-top : 2px solid gray;
			border-bottom : 2px solid gray;
		}
		
		#list_table td { border-bottom : 2px solid lightgray; }
		
		.list_line{
			height:70px;
		}
		
		#sell{
			width : 50px;
			height : 50px;
		}
		
		#td1{ width:40px; }
		#td2{ width:50px; }
		#td3{ width:250px; }
		#td4{ width:130px; }
		#td5{ width:130px; }
		#td6{ width:150px; }
		#td7{ width:150px; }
		
		.name{
			font-size : 20px;
			font-weight : bold;
		}
		
		#go_write{
			font-weight : bold;
			width : 100px;
			height : 40px;
			border : 0px;
			border-radius: 5px;
			background-color: rgb(224, 224, 224);
			cursor: pointer;
		}
		
		#write{
			margin-left : 800px;
			margin-top : 15px;
			
		}
		
		#search{
			margin-top : 20px;
		}
</style>
</head>
<body>
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('물귤교환');
	</script>
	
	<div id="main">
	
	<div id = "tablearea1">
					<table id = "title_table">
						<tr>
							<th class="list_title" id="th1">상품명</th>
							<th class="list_title" id="th2">현재입찰귤</th>
							<th class="list_title" id="th3">즉시구입귤</th>
							<th class="list_title" id="th4">마감시간</th>
							<th class="list_title" id="th5">작성자</th>
						</tr>
					</table>
				</div>
				
				<div id = "tablearea2">
					<table id = "list_table">
						<!-- 게시글 불러오는곳 -->
						<% if(tList.isEmpty()){ %>
				<tr>
					<td colspan="7">존재하는 공지사항이 없습니다.</td>
				</tr>
				<% } else{ 
						 for(int i = 0; i < tList.size(); i++){ 
						 Trade t = tList.get(i);
						 %>
						<tr class = "list_line">
							<td id="td1"><%= t.getBoardNo() %></td>
							<td id="td2">사진</td>
							<td class = "name" id="td3"><%= t.getPostTitle() %></td>
							<td id="td4"><%= t.getPoint() %> <img alt="귤" src="../../images/orange.png" id="gyul"></td>
							<td id="td5"><%= t.getMaxPoint() %><img alt="귤" src="../../images/orange.png" id="gyul"></td>
							<td id="td6">23:22</td>
							<td id="td7"><%= t.getWriter() %></td>
						</tr>
						<% }
							}%>
					</table>
				</div>
				
				<div id = "write">
				
					<button onclick = "location.href = 'gyul_write.jsp'" id = "go_write">글쓰기</button>
				
				</div>
				
				<%-- <!-- 페이징 -->
				<div class = 'pagingArea' align='center'>
                    <button onclick = "location.href ='<%= request.getContextPath() %>/list.pg?currentPage=<%= currentPage-1 %>'" id = "beforeBtn">◀</button>
                    <script>
                    	if(<%= currentPage %> <= 1){
                    		var before = $('#beforeBtn');
                    		before.attr('disabled','true');
                    	}
                    </script>
                    
                    <% for(int p = startPage; p <= endPage; p++){ %>
                    	<% if(p == currentPage){ %>
                    		<button id = "choosen" disabled><%= p %></button>
                    	<% }else{ %>
                    		<button id = "numBtn" onclick = "location.href='<%= request.getContextPath() %>/list.bo?currentPage<%= p %>'"><%= p %></button>
                    	<% } %>	
                    <% } %>
                    
                    
                    <button>1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>4</button>
                    <button>5</button>
                    <button>▶</button>
				</div> --%>
				
				<div id = "search">
                    <select id="searchOption">
                        <option value='title'>제목</option>
                        <option value='content'>내용</option>
                        <option value='title_content'>제목+내용</option>
                        <option value='nickname'>닉네임</option>
                    </select>
                    <input id="keyWord">
                    <input type='button' value='검색'>
                </div>
	
	</div>
	
	<script>
		$(function(){
			$('.list_line').click(function(){
				var pn = $(this).children().eq(0).val();
				location.href="<%= request.getContextPath()%>/detail.gy?post_no="+pn;
			});
		});
	</script>
</body>
</html>