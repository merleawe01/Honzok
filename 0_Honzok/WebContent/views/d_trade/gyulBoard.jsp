<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, d_trade.model.vo.*, a_common.*, java.util.Calendar, java.text.SimpleDateFormat" %>
<%
	ArrayList<Trade> tList = (ArrayList<Trade>)request.getAttribute("tList");
	ArrayList<Image> iList = (ArrayList<Image>)request.getAttribute("iList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	SimpleDateFormat format = new SimpleDateFormat ("yyyyMMddHHmmss");
	Calendar time = Calendar.getInstance();
	String timeNow = format.format(time.getTime());
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
			
		}
		
		#gyul{
			width:25px;
			height:25px;
		}
		
		.list_title{
			background : orange;
			color : white;
		}
		
		#th0{ width:90px; height:50px; border-radius : 10px 0px 0px 10px; text-align : left; padding-left : 10px;}
		#th1{ width:250px; }
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
			cursor : pointer;
		}
		
		#sell{
			width : 50px;
			height : 50px;
		}
		
		#td1{ width:40px; }
		#td2{ width:50px; height : 50px; }
		#td3{ width:250px; }
		#td4{ width:130px; }
		#td5{ width:130px; }
		.td6{ width:150px; }
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
			background-color: rgb(241, 131, 50);
			cursor: pointer;
			color : white;
			font-size : 18px;
		}
		
		#write{
			margin-left : 800px;
			margin-top : 15px;
			
		}
		
		#search{
			margin-top : 20px;
		}
		
		#no_exist{
			width:900px;
			height:300px;
		}
		
		
		.pagingArea{display:block; border:0px;}
        .pagingArea > button{ border:0px;background:none; border-radius:50px; color:#805959; padding:10px auto; font-size:20px;}
        #numBtn{background:none; margin:3px; padding:10px auto; border:0px;}
        #choosen{background:#f18332; border-radius:50px; color:white; border:0px;}
		
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
							<th class="list_title" id="th0">번호</th>
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
					<td id = "no_exist">존재하는 게시글이 없습니다.</td>
				</tr>
				<% } else{ 
					for(Trade t : tList){ 
	                      
	                      Double timer = Double.parseDouble(t.getDlTime()) - Double.parseDouble(timeNow);
	                            
	                            String timeCheck = "";
	                            
	                            int hour = 0;
	                            int min = 0;
	                            int sec = 0;
	                            
	                            if(timer < 0) {
	                               timeCheck = "마감";
	                            } else {
	                              int sec1 = Integer.parseInt(t.getDlTime().substring(8, 10)) * 3600
	                                    + Integer.parseInt(t.getDlTime().substring(10, 12)) * 60
	                                    + Integer.parseInt(t.getDlTime().substring(12, 14));
	                              int sec2 = Integer.parseInt(timeNow.substring(8, 10)) * 3600
	                                    + Integer.parseInt(timeNow.substring(10, 12)) * 60
	                                    + Integer.parseInt(timeNow.substring(12, 14));
	                              
	                              int timeAll = sec1 - sec2;
	                              if(timeAll <= 0) {
	                                 timeAll = timeAll + 86400;
	                              }
	                              hour = timeAll / 3600;
	                              min = (timeAll - hour * 3600) / 60;
	                              sec = timeAll - hour * 3600 - min * 60;

	                              
	                              timeCheck = hour+":"+min+":"+sec;
	                            }
	                   %>
	                   
	                   <script> 
	                           var hours<%= t.getrNo() %> = <%if(hour<10){%>
	                                       "0<%= hour %>"
	                                       <%}else{%>
	                                       "<%= hour %>"
	                                       <%}%>;
	                          
	                           
	                           var minutes<%= t.getrNo() %> = <%if(min<10){%>
	                                     "0<%= min %>"
	                                     <%}else{%>
	                                     "<%= min %>"
	                                     <%}%>;
	                           
	                           var seconds<%= t.getrNo() %> = <%if(sec<10){%>
	                                     "0<%= sec %>"
	                                     <%}else{%>
	                                     "<%= sec %>"
	                                      <%}%>;
	                           
	                           $(function(){
	                              var timer<%= t.getrNo() %> = setInterval(function() {
	                                 if((hours<%= t.getrNo() %> == "00" && minutes<%= t.getrNo() %> == "00" && seconds<%= t.getrNo() %> == "00")||'<%= t.getDlYN() %>' == ('Y')){
	                                    $("#td6<%= t.getrNo() %>").html("마감"); 
	                                      clearInterval(timer<%= t.getrNo() %>);
	                                 } else {
	                                    seconds<%= t.getrNo() %>--;
	                                    
	                                    if(seconds<%= t.getrNo() %> == -1){
	                                          seconds<%= t.getrNo() %> = 59;
	                                          minutes<%= t.getrNo() %>--;
	                                          if(minutes<%= t.getrNo() %> < 10){
	                                             minutes<%= t.getrNo() %> = "0" + minutes<%= t.getrNo() %>;
	                                          }
	                                       }
	                                       if(minutes<%= t.getrNo() %> == "0-1"){
	                                          minutes<%= t.getrNo() %> = 59;
	                                          hours<%= t.getrNo() %>--;
	                                          if(hours<%= t.getrNo() %> < 10){
	                                             hours<%= t.getrNo() %> = "0" + hours<%= t.getrNo() %>;
	                                          }
	                                       }
	                                       if(seconds<%= t.getrNo() %> < 10){
	                                          seconds<%= t.getrNo() %> = "0" + seconds<%= t.getrNo() %>;
	                                       }
	                                       
	                                       $("#td6<%= t.getrNo() %>").html(hours<%= t.getrNo() %> + ":" + minutes<%= t.getrNo() %> + ":" + seconds<%= t.getrNo() %>);
	                                 }
	                              }, 1000);
	                           });
	                        </script>
						 
						<tr class = "list_line">
							<td class="list_line2" id="td1"><input type = "hidden" value = "<%= t.getPostNo() %>"><%= t.getrNo() %></td>
							<td class="list_line2" id="td2">
								<% for(int j = 0; j < iList.size(); j++){
									Image m = iList.get(j);
									
								%>
									<% if(t.getPostNo() == m.getPostNo()){ %>
										<img width="100%" height="100%" src = "<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= m.getChangeName() %>">
									<% } %>
								<% } %>
							
							</td>
							<td class = "name list_line2" id="td3"><%= t.getPostTitle() %></td>
							<td class="list_line2" id="td4"><%= t.getPoint() %> <img alt="귤" src="<%= request.getContextPath() %>/images/orange.png" id="gyul"></td>
							<td class="list_line2" id="td5"><%= t.getMaxPoint() %><img alt="귤" src="<%= request.getContextPath() %>/images/orange.png" id="gyul"></td>
							<td class="list_line2 td6" id="td6<%= t.getrNo() %>"><%= timeCheck %></td>
							<td class="list_line2" id="td7" name="writer"><%= t.getWriter() %></td>
						</tr>
						<% }
							}%>
					</table>
				</div>
				
				<div id = "write">
				
					<button onclick = "location.href = 'views/d_trade/gyulWrite.jsp'" id = "go_write">글쓰기</button>
				
				</div>
				
				<!-- 페이징 -->
				<div class = 'pagingArea' align='center'>
					<% if(!tList.isEmpty()){ %>
					<button onclick = "location.href='<%= request.getContextPath() %>/list.gy?currentPage=1'">&lt;&lt;</button>
				
                    <button onclick = "location.href ='<%= request.getContextPath() %>/list.gy?currentPage=<%= currentPage-1 %>'" id = "beforeBtn">pre</button>
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
                    		<button id = "numBtn" onclick = "location.href='<%= request.getContextPath() %>/list.gy?currentPage=<%= p %>'"><%= p %></button>
                    	<% } %>	
                    <% } %>
                    
                    <button onclick = "location.href='<%= request.getContextPath() %>/list.gy?currentPage=<%= currentPage + 1 %>'"id = "afterBtn">next</button>
                    <script>
                    	if(<%= currentPage %> >= <%= maxPage %>){
                    		var after = $("#afterBtn");
                    		after.attr('disabled','true');
                    	}
                    </script>
                    
                    <button onclick = "location.href='<%= request.getContextPath() %>/list.gy?currentPage=<%= maxPage %>'">&gt;&gt;</button>
                     
                   <% } %>
				</div>
				
				
	
	</div>
	<script>
		$(function(){
			$('.list_line2').click(function(){
				var pn = $(this).parent().children().eq(0).children().val();
				location.href="<%= request.getContextPath()%>/detail.gy?postNo="+pn;
			});
		});
	</script>
</body>
</html>
