<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="d_trade.model.vo.*, java.util.*, b_member.model.vo.*, java.util.Calendar, java.text.SimpleDateFormat"%>
<%
	Trade t = (Trade)request.getAttribute("trade");
	ArrayList<Image> fileList = (ArrayList<Image>)request.getAttribute("fileList");
	Image titleImg = fileList.get(0);
	
	SimpleDateFormat format = new SimpleDateFormat ("yyyyMMddHHmmss");
	Calendar time = Calendar.getInstance();
	String timeNow = format.format(time.getTime());
	
	Trade sw = (Trade)request.getAttribute("sw");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		#boardTitle {
			width : 100%;
			height : 25px;
			display : inline-block;
			font-family: 'Nanum Gothic', sans-serif;
			padding-bottom: 5px;
			border-bottom : 1pt solid gray;
		}
		#titleLeft {
			display : inline-block;
			font-size: 13pt;
			float: left;
			font-weight: bold;
		}
		#titleRight {
			display : inline-block;
			font-size: 10pt;
			color: rgb(94, 94, 94);
			float: right;
		}
		#boardWriter {
			width : 100%;
			height : 40px;
			font-family: 'Nanum Gothic', sans-serif;
			font-size: 10pt;
			text-align: right;
			margin-top: 10px;
		}
		


		#detail_content{ border-bottom : 1px solid gray; margin-bottom : 20px; margin-top : 30px;}

		.td1{
			width : 200px;
			height : 60px;
		}
		
		#td2{
			width : 700px;
		}
		
		#content_td{ height : 360px;}
		
		.title1{
			margin-left : 30px;
			width : 100px;
			height : 30px;
 			display : inline-table;
			border-radius: 5px;
			float: left;
			background-color: rgb(224, 224, 224);
			line-height: 30px;
			font-weight: bold;
		}
		
		.contentImgArea{
			width : 300px;
			height : 300px;
			
		}
		
		#contentImgArea2{
			margin-left : 100px;
		}
		
		.price{
			float: left;
			font-size: 14pt;
			font-weight: bold;
		}
		
		#time{
			float: left;
			font-size: 14pt;
			font-weight: bold;
			color : yellowgreen;
		}
		
		#content{
			padding : 10px;
			float: left;
			width : 600px;
			height : 260px;
			background-color: rgba(52, 152, 219, 0.2);
			text-align: left;
		}
		
		#revise{
				  font-size : 10pt;
				  width : 100px;
				  height : 40px;
			      background-color : lightgray;
			      color : black;
			      border-radius: 5px;
			      border:0;
			      font-weight: bold;
			      cursor:pointer;
			      margin-left : 76%;
			      font-size : 18px;
		}
		#delete{
				  font-size : 10pt;
				  width : 100px;
				  height : 40px;
			      background-color : lightgray;
			      color : black;
			      border-radius: 5px;
			      border:0;
			      font-weight: bold;
			      margin-left:10px;
			      cursor:pointer;
			      font-size : 18px;
		}
		
		#onebu{
				  text-align : center;
				  width : 100px;
				  height : 40px;
			      background-color : rgb(241, 131, 50);
			      color : white;
			      border-radius: 5px;
			      border:0;
			      font-weight: bold;
			      line-height: 40px;
			      cursor:pointer;
			      font-size : 18px;
		}
		#twobu{
				  text-align : center;
				  width : 100px;
				  height : 40px;
			      background-color : lightgray;
			      color : black;
			      border-radius: 5px;
			      border:0;
			      line-height: 40px;
			      font-weight: bold;
			      margin-left:50px;
			      cursor:pointer;
			      font-size : 18px;
		}
		
		.sold_txt{
		    display: block;
		    position: absolute;
		    margin-left : 70px;
		    width: 100%;
		    font-weight : bold;
			font-size : 60px;
		    text-align: left;
		    color : black;
			top:80%;
		}
		

		
</style>
</head>
<body>
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('물귤교환');
		
	</script>
	
	<div id = "main">
	<form action="<%= request.getContextPath() %>/views/d_trade/gyulUpdateView.jsp" id="detailForm" method="post" class = "soldImg">
		<div id="boardTitle">
					<div id="titleLeft">
						<%= t.getPostTitle() %>
						<input type="hidden" value="<%= t.getPostTitle() %>" name = "title">
						<input type="hidden" name="pno" value="<%= request.getParameter("postNo") %>">
					</div>
					
					<div id="titleRight">
						<%= t.getWriteDate() %>
					</div>
				</div>
				
				<div id="boardWriter">
					<%= t.getNickname() %> | 조회 : <%= t.getViewCount() %>
				</div>
				
				<table style="margin-left: auto; margin-right: auto;">
					<tr>
						<td>
						<div class="contentImgArea">
						
							
							<img width="100%" height="100%" id = "titleImg" src = "<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(0).getChangeName() %>">
							<input type="hidden" value="<%= titleImg.getChangeName() %>" name="titleImage">
							<input type="hidden" value="<%= titleImg.getImgId() %>" name="detailImgId0">
							
						</div>
					</td>
					<td>
					<% for(int i = 1; i < fileList.size(); i++){ %>	
						<div class="contentImgArea" id = "contentImgArea2">
							<img width="100%" height="100%" id = "detailImg" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(i).getChangeName() %>">
							<input type="hidden" value="<%= fileList.get(i).getChangeName() %>" name="detailImg<%= i %>">
							<input type="hidden" value="<%= fileList.get(i).getImgId() %>" name="detailImgId<%= i %>">					
						</div>
					<% } %>	
					
					</td>
					</tr>
				</table>
			
				<div>
					<table id = "detail_content">
						<tr>
							<td class = "td1"><label id = "bid_title" class = "title1">현재 입찰귤</label></td>
							<td id = "td2"><label class = "price"><%= t.getPoint() %>귤</label></td>
							
							<input type="hidden" value="<%= t.getMinPoint() %>" name = "min">
						</tr>
						<tr>
							<td class = "td1"><label id = "buy_title" class = "title1">즉시 구입귤</label></td>
							<td>
								<label class = "price"><%= t.getMaxPoint() %>귤</label>
								<input type="hidden" value="<%= t.getMaxPoint() %>" name = "max">
							</td>
						</tr>
						<tr>
							<td class = "td1"><label id = "time_title" class = "title1">남은시간</label></td>
							<td><label id = "time"></label></td>
						</tr>
						
						<% Double timer = Double.parseDouble(t.getDlTime()) - Double.parseDouble(timeNow);
                        
                        int hour = 0;
                        int min = 0;
                        int sec = 0;
                        
                        if(timer>0){
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
	                        hour = /* timeAll / 3600 */ 0;
	                        min = /* (timeAll - hour * 3600) / 60; */ 0;
 	                        sec = /* timeAll - hour * 3600 - min * 60; */ 10;
                        }

                       %>
                        <script> 
                           
                           var check = '<%= t.getDlYN() %>';
                           
                           var hours = <%if(hour<10){%>
                                       "0<%= hour %>"
                                       <%}else{%>
                                       "<%= hour %>"
                                       <%}%>;
                           
                           var minutes = <%if(min<10){%>
                                     "0<%= min %>"
                                     <%}else{%>
                                     "<%= min %>"
                                     <%}%>;
                           
                           var seconds = <%if(sec<10){%>
                                     "0<%= sec %>"
                                     <%}else{%>
                                     "<%= sec %>"
                                     <%}%>;
                           
                           $(function(){
                              var timer = setInterval(function() {
                                 if(hours == "00" && minutes == "00" && seconds == "00"){
                                	
                                	 var pp = {postNo : <%= request.getParameter("postNo") %>,
                                			   point : <%= t.getPoint() %>,
                                	 		   writer : "<%= t.getNickname() %>",
                                	 		   title : "<%= t.getPostTitle() %>"}
                                	  $.ajax({
                                		  url: 'ac.point',
                                		  type : 'post',
                                		  data : pp,
                                		  success : function(data){
                          					$('.soldImg').css("opacity","0.3");
                          					$('.sold_txt').html("경매가 종료된 상품입니다.");
                          					check = 'Y';
                          				}
                                	  });
                                      clearInterval(timer);
                                      $("#time").html("마감");
                                   } else if(check =='Y'){
                                	 	$(function(){
                                	 		$('#time').html("마감");
                    	 					$('.soldImg').css("opacity","0.3");
                    	 					$('.sold_txt').html("경매가 종료된 상품입니다.");
                                	 	});
                                   } else {
                                      seconds--;
                                       if(seconds == -1){
                                          seconds = 59;
                                          minutes--;
                                          if(minutes < 10){
                                             minutes = "0" + minutes;
                                          }
                                       }
                                       if(minutes == -1){
                                          minutes = 59;
                                          hours--;
                                          if(hours < 10){
                                             hours = "0" + hours;
                                          }
                                       }
                                       if(seconds < 10){
                                          seconds = "0" + seconds;
                                       }
                                       
                                       $("#time").html(hours + ":" + minutes + ":" + seconds); 
                                   }
                              }, 1000);
                           });
                           
                        </script>
						
						<tr>
							<td id = "content_td"><label id = "content_title" class = "title1">내용</label></td>
							<td>
								<label id = "content"><%= t.getContent() %></label>
								<input type="hidden" value="<%= t.getContent() %>" name = "content">
							</td>
						</tr>
					</table>
				</div>
			
				
					<% if(loginUser != null && loginUser.getNickName().equals(t.getNickname())){ %>
						<input id = "revise" type="submit" value="수정"> 
						<input id = "delete" type="submit" value="삭제" onclick="deleteGy();" >
					<% } %>
				
				<script>
					$(function(){
						$('#revise').click(function(){
							if(check=='Y'){
								alert("경매가 마감된 게시글은 수정하실 수 없습니다.");
								return false;
							}
						})
					});
				</script>
			</form>
			
			
			
				<div class="sold_txt">
				<!-- 경매종료 안내문구 넣을 div -->
				</div>
			

	 		
	 		
	 	
		<% if(loginUser != null && !(loginUser.getNickName().equals(t.getNickname()))){ %>	
		  <button id="onebu">입찰하기</button>
          <% } %>
          <script>
          
             $('#onebu').click(function(){
                if(check == 'N') {
                   location.href = "views/d_trade/gyulBid.jsp?postNo=<%= request.getParameter("postNo") %>&min=<%= t.getMinPoint() %>&point=<%= t.getPoint() %>&max=<%= t.getMaxPoint() %>&writer=<%= t.getNickname() %>&title=<%= t.getPostTitle() %>"
                } else {
                   alert("경매가 종료된 상품입니다!");
                }
             });
          </script>
				
				<button id="twobu" onclick="location.href='<%= request.getContextPath() %>/list.gy'">목록으로</button>
		
		
	</div>
	
	
	
	<script>
		function deleteGy(){
			var del = confirm('정말로 삭제하시겠습니까?');
			if(del){
				$('#detailForm').attr('action','delete.gy');
				$('#detailForm').submit();
			}
		}
	</script>
</body>
</html>