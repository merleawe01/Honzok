<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="c_information.model.vo.*, java.util.ArrayList"%>
<%
	TravelBoard board = (TravelBoard)request.getAttribute("board");
	ArrayList<Image> imgList = (ArrayList<Image>)request.getAttribute("imgList");
	ArrayList<Reply> replyList = (ArrayList<Reply>)request.getAttribute("replyList");
	String recCheck = (String)request.getAttribute("recCheck");
	String area = (String)request.getParameter("area");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#photo{
		width: 100%;
		min-height: 100px;
		border-bottom: 1px solid gray;
		padding-bottom: 40px;
	}
	#mainPhoto{
		width: 600px;
		height: auto;
		line-height: 100%;
	}
	#leftPhoto{
		float: left;
		width: 80px;
		height: 10px;
		display: inline-table;
	}
	#leftPhoto img{
		width: 80px;
		height: 80px;
		vertical-align: middle;
	}
	#rightPhoto{
		float: right;
		width: 80px;
		height: 10px;
		display: inline-table;
	}
	#rightPhoto img{
		width: 80px;
		height: 80px;
		vertical-align: middle;
	}
	.left{
		display: inline-table;
		width: 200px;
		height: 100%;
		text-align: left;
		float: left;
		padding-left: 5px;
		line-height:150%;
	}
	.right{
		display: inline-table;
		width: 650px;
		height: 100%;
		text-align: left;
	}
	#name{
		width: 100%;
		height: 30px;
		margin-top: 10px;
		padding-bottom: 10px;
		border-bottom: 1px solid gray;
	}
	#score{
		width: 100%;
		height: 30px;
		margin-top: 10px;
		padding-bottom: 10px;
		border-bottom: 1px solid gray;
	}
	.star{
		width: 30px;
		height: 30px;
	}
	#review{
		width: 100%;
		min-height: 30px;
		margin-top: 10px;
		padding-bottom: 10px;
		border-bottom: 1px solid gray;
	}
	#reviewContent{
		border-radius: 5px;
		padding: 10px;
		background-color: rgb(224, 224, 224);
	}
	#time{
		width: 100%;
		min-height: 30px;
		margin-top: 10px;
		padding-bottom: 10px;
		border-bottom: 1px solid gray;
	}
	#notice{
		width: 100%;
		min-height: 30px;
		margin-top: 10px;
		padding-bottom: 10px;
		border-bottom: 1px solid gray;
	}
	#address{
		width: 100%;
		height: auto;
		margin-top: 10px;
		padding-bottom: 10px;
		border-bottom: 1px solid gray;
	}
	#map{
		width: 100%;
		height: 300px;
		margin-top: 10px;
		padding-bottom: 10px;
	}
	.btnList{
		width: 100%;
		height: 50px;
		margin-top: 10px;
		padding-bottom: 10px;
	}
	.btnList div{
		width : 100px;
		height : 40px;
		border-radius: 5px;
		margin: 10px;
		line-height: 40px;
		font-weight: bold;
		display: inline-table;
		float: right;
		cursor: pointer;
	}
	.button {
		background-color: rgb(224, 224, 224);
	}
	.button:hover{
		background-color: rgb(241, 131, 50);
		color: white;
	}
	#thumbsImg{
		width: 40px;
		height: 40px;
		vertical-align: middle;
		margin-right: 10px;
	}
	#commentMain{
		width : 100%;
		min-height : 130px;
		background-color: rgb(224, 224, 224);
		overflow:hidden;
		height:auto;
		padding-left: 30px;
		padding-right: 30px;
		padding-top: 15px;
		padding-bottom: 15px;
		font-size: 16px;
	}
	#commentLeft{
		resize : none;
		float : left;
	}
	#commentRight{
		width : 80px;
		height : 60px;
		background-color: #A0CEDE;
		color:white;
		font-size:17px;
		font-weight:bold;
		display : inline-table;
		border:0px;
		border-radius:5px;
	}
	.replyUpdate{cursor: pointer;}
	.replyDelete{cursor: pointer;}
	
</style>

</head>
<body>
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('욜로홀로솔로');
		
		<% if(loginUser == null){
			loginUser = new Member();
			loginUser.setNickName("");
			loginUser.setUserId("");
		} %>
	</script>
	
	<div id="main">
		<div id="photo">
			<div id="leftPhoto"><img src="<%= request.getContextPath() %>/images/leftarrow.PNG" width="80px" height="80px"></div>
			<img id="mainPhoto" src="">
			<div id="rightPhoto"><img src="<%= request.getContextPath() %>/images/rightarrow.PNG" width="80px" height="80px"></div>
			
			<script>
				var photoSrc = new Array();
				<% for(int i = 0; i <= 5; i++){
					for(Image img : imgList){ 
						if(img.getFileLevel() == i) {%>
						photoSrc.push("<%= request.getContextPath() %>/images/travel_board/<%= img.getChange_name() %>");
						<% }
					}
				} %>
	
				var temp = 0;
				
				$(function(){
					$('#leftPhoto').children().hide();
					$('#mainPhoto').attr('src', photoSrc[0]);
					if(photoSrc.length <= 1) {
						$('#rightPhoto').children().hide();
					}
					lineSet();
				});
				
				$('#leftPhoto img').click(function(){
					if(photoSrc.length == 2) {
						temp--;
						$('#leftPhoto').children().hide();
						$('#rightPhoto').children().show();
						$('#mainPhoto').attr('src', photoSrc[temp]);
					} else if(temp == 1){
						temp--;
						$('#leftPhoto').children().hide();
						$('#mainPhoto').attr('src', photoSrc[temp]);
					} else {
						if(temp == photoSrc.length-1) {
							$('#rightPhoto').children().show();
						}
						temp--;
						$('#mainPhoto').attr('src', photoSrc[temp]);
					}
					lineSet();
				});
				
				$('#rightPhoto img').click(function(){
					if(photoSrc.length == 2) {
						temp++;
						$('#rightPhoto').children().hide();
						$('#leftPhoto').children().show();
						$('#mainPhoto').attr('src', photoSrc[temp]);
					} else if(temp == photoSrc.length-2){
						temp++;
						$('#rightPhoto').children().hide();
						$('#mainPhoto').attr('src', photoSrc[temp]);
					} else {
						if(temp == 0) {
							$('#leftPhoto').children().show();
						}
						temp++;
						$('#mainPhoto').attr('src', photoSrc[temp]);
					}
					lineSet();
				});
				
				function lineSet(){
					setTimeout(function() {
						$('#leftPhoto').css('line-height', $('#mainPhoto').height()+'px');
						$('#rightPhoto').css('line-height', $('#mainPhoto').height()+'px');
					}, 10);
				}
			</script>
		</div>
		
		<div id="name">
			<div class="left">여행지이름</div>
			<div class="right"><b><%= board.getTitle() %></b></div>
		</div>
		
		<div id="score">
			<div class="left">여행지에 대한 평가</div>
			<div class="right">
				<% for(int i = 0; i < 5; i++) {
						if(i > board.getStar()) {%>
						<img src="<%= request.getContextPath() %>/images/empty_star_new.png" class="star">
						<% } else { %>
						<img src="<%= request.getContextPath() %>/images/star_new.PNG" class="star">
						<% } %>
					<% } %>
			</div>
		</div>
		
		<div id="review">
			<div class="left">리뷰내용</div>
			<div class="right" id="reviewContent"><%= board.getContent() %></div>
		</div>
		
		<div id="notice">
			<div class="left">권장 방문시간</div>
			<div class="right"><%= board.getBest_time() %></div>
		</div>
		
		<div id="time">
			<div class="left">주의사항</div>
			<div class="right"><%= (board.getCaution() == null) ? "" : board.getCaution() %></div>
		</div>
		
		<div id="address">
			<div class="left">주소</div>
			<div class="right">
				<b><%= board.getAddress() %></b>
				
				<div id="map"></div>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
					        center: new kakao.maps.LatLng(<%= board.getArea_x() %>, <%= board.getArea_y() %>), // 지도의 중심좌표
					        level: 2 // 지도의 확대 레벨
					    };
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
					var markerPosition = new kakao.maps.LatLng(<%= board.getArea_x() %>, <%= board.getArea_y() %>); 
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});
					marker.setMap(map);
					
					var iwContent = '<div style="width:150px; text-align: center; padding:5px;"><%= board.getTitle() %></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwPosition = new kakao.maps.LatLng(<%= board.getArea_x() %>, <%= board.getArea_y() %>); //인포윈도우 표시 위치입니다

					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent 
					});
					  
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow.open(map, marker);
				</script>
				
				
			</div>
		</div>
		
		<div class="btnList">
			<% if(loginUser.getNickName().equals(board.getWriter())) { %>
				<div id="delete" class="button">삭제</div>
				
				<form action="<%= request.getContextPath() %>/views/c_information/travelUpdate.jsp" id="updateForm" method="post">
					<input type="hidden" name="no" value="<%= board.getNo() %>">
					<input type="hidden" name="title" value="<%= board.getTitle() %>">
					<input type="hidden" name="star" value="<%= board.getStar() %>">
					<input type="hidden" name="content" value="<%= board.getContent() %>">
					<input type="hidden" name="caution" value="<%= (board.getCaution() == null) ? "" : board.getCaution() %>">
					<input type="hidden" name="best_time" value="<%= board.getBest_time() %>">
					<input type="hidden" name="address" value="<%= board.getAddress() %>">
					<input type="hidden" name="local_name" value="<%= board.getLocal_name() %>">
					<input type="hidden" name="area_x" value="<%= board.getArea_x() %>">
					<input type="hidden" name="area_y" value="<%= board.getArea_y() %>">
					<input type="hidden" name="imgSize" value="<%= imgList.size() %>">
					
					<% for(Image img : imgList){ %>
						<input type="hidden" value="<%= img.getImg_id() %>" name="imgId<%= img.getFileLevel() %>">
						<input type="hidden" value="<%= img.getOrigin_name() %>" name="imgOrigin<%= img.getFileLevel() %>">
						<input type="hidden" value="<%= img.getChange_name() %>" name="imgChange<%= img.getFileLevel() %>">
						<input type="hidden" value="<%= img.getFileLevel() %>" name="imgLevel<%= img.getFileLevel() %>">
					<% } %>
					
					<div id="update" class="button">수정</div>
				</form>
			<% } else { %>
				<div id="recommend" class="button">추천</div>
				<div>
					<img id= "thumbsImg" src= "<%= request.getContextPath() %>/images/thumbsdown.png"> 
					<span id = recNum><%= board.getReco_count() %></span>
				</div>
			<% } %>
		</div>
		
		<script>
			$('#delete').click(function(){
			 	if(confirm("글을 삭제하시겠습니까?")) {
			 		location.href='<%= request.getContextPath() %>/delete.travel?no=<%= board.getNo() %>&writer=<%= loginUser.getUserId() %>'
				}
			})
			
			$('#update').click(function(){
			 	if(confirm("글을 수정하시겠습니까?")) {
					$('#updateForm').submit();
				}
			})
			
			$(function(){
				<% if(recCheck.equals("Y")) {%>
					$('#thumbsImg').attr('src', "<%= request.getContextPath() %>/images/thumbsuup.png")
					$('#recommend').css('background-color', 'rgb(241, 131, 50)');
					$('#recommend').css('color', 'white');
				<% } else { %>
				$('#thumbsImg').attr('src', "<%= request.getContextPath() %>/images/thumbsdown.png")
					$('#recommend').css('background-color', 'rgb(224, 224, 224)');
					$('#recommend').css('color', 'black');
				<% }%>
			})
			
			var recCheck = '<%= recCheck %>';
			
			$('#recommend').click(function(){
				if('<%= loginUser.getUserId() %>' == "") {
					alert('로그인한 유저만 추천을 할 수 있습니다.');
				} else {
					var writer = '<%= loginUser.getUserId() %>';
					var bid = <%= board.getNo() %>;
					$.ajax({
						url: '<%= request.getContextPath() %>/check.recommend',
						type: 'post',
						data: {recCheck: recCheck, writer: writer, bid: bid},
						success: function(data){
							if(data[0] == "Y") {
								$('#recommend').css('background-color', 'rgb(241, 131, 50)');
								$('#recommend').css('color', 'white');
								$('#thumbsImg').attr('src', "<%= request.getContextPath() %>/images/thumbsuup.png")
								recCheck="Y";
							} else {
								$('#recommend').css('background-color', 'rgb(224, 224, 224)');
								$('#recommend').css('color', 'black');
								$('#thumbsImg').attr('src', "<%= request.getContextPath() %>/images/thumbsdown.png")
								recCheck="N";
							}
							$('#recNum').text(data[1]);
						}
					});
				}
			})
		</script>
		
		<p style="float: left; color: rgb(51, 51, 51)">댓글 <span id="replyCount"><%= replyList.size() %></span></p>
		
		<div id = "commentMain">
			<div id= "replyTable" style="width:auto; height:auto;">
			<% if(replyList.isEmpty()){ %>
				<br><span style="margin-right: 200px;">등록된 댓글이 없습니다.</span><br><br><br>
			<% } else {
				for(int i = 0; i < replyList.size(); i++) { %>
				<table style="text-align: left;">
					<tr>
						<td rowspan="2"><img alt="댓글" src="<%= request.getContextPath() %>/images/blanket.png" style="width:auto; height: 50px;"></td>
						<td>
							<span style="font-weight: bold;"><%= replyList.get(i).getWriter() %></span>&nbsp; &nbsp; 
							<span style="font-weight: bold; color: rgb(190, 190, 190);"><%= replyList.get(i).getWrite_date() %></span>&nbsp; &nbsp; 
							<% if(loginUser.getNickName().equals(replyList.get(i).getWriter())) { %>
								<span><input type="hidden" value='<%= replyList.get(i).getCno() %>'><span class="replyUpdate">수정</span> | <span class="replyDelete">삭제</span></span>
							<% } %>
						</td>
					</tr>
					<tr>
						<td><%= replyList.get(i).getContent() %></td>
					</tr>
				</table>
				<br>
			<% 	}
			}%>
			</div>
			
			<textarea id="commentLeft" rows="4" cols="100"></textarea>
			<button id="commentRight">등록</button>
			
			<script>
				$('#commentRight').click(function(){
					if($('#commentLeft').val() == ""){
						alert('작성된 내용이 없습니다.');
					} else if('<%= loginUser.getUserId() %>' == "") {
						alert('로그인한 유저만 댓글을 작성할 수 있습니다.');
					} else{
						var writer = '<%= loginUser.getUserId() %>';
						var bid = <%= board.getNo() %>;
						var content = $('#commentLeft').val();
						
						$.ajax({
							url: '<%= request.getContextPath() %>/insert.reply',
							type: 'post',
							data: {writer: writer, content: content, bid: bid},
							success: function(data){
								$replyTable = $('#replyTable');
								$replyTable.html("");
								
								$('#replyCount').text(data.length);
								
								for(var key in data){
									var $table = $('<table>').css('text-align', 'left');
									
									var $tr1 = $('<tr>');
									var $tr2 = $('<tr>');
									
									var $td1 = $('<td>').attr('rowspan', 2);
									var $td2 = $('<td>');
									var $td3 = $('<td>').text(data[key].content);
									
									var $span1 = $('<span>').html(data[key].writer + '&nbsp; &nbsp; ').css('font-weight', 'bold');
									var $span2 = $('<span>').html(data[key].write_date + '&nbsp; &nbsp; ').css('font-weight', 'bold').css('color', 'rgb(190, 190, 190)');
									var $span3 = $('<span>').html('<input type="hidden" value=' + data[key].cno + '><span class="replyUpdate">수정</span> | <span class="replyDelete">삭제</span>');
									
									var $img = $('<img>').attr('src', "<%= request.getContextPath() %>/images/blanket.png").css('width', 'auto').css('height', '50px');
									
									$td1.append($img);
									$td2.append($span1);
									$td2.append($span2);
									if(data[key].writer == '<%= loginUser.getNickName() %>') {
										$td2.append($span3);	
									}
									
									$tr1.append($td1);
									$tr1.append($td2);
									$tr2.append($td3);
									$table.append($tr1);
									$table.append($tr2);
									
									$replyTable.append($table);
									$replyTable.append('<br>');
								}
								
								$('#commentLeft').val('');
							}
						});
					}
				})
				
				$(document).on('click', '.replyDelete', function(){
					if(confirm('댓글을 삭제하시겠습니까?')) {
						var bid = <%= board.getNo() %>;
						var rid = $(this).parent().children().eq(0).val();
						$.ajax({
							url: '<%= request.getContextPath() %>/delete.reply',
							type: 'post',
							data: {bid: bid, rid: rid},
							success: function(data){
								$replyTable = $('#replyTable');
								$replyTable.html("");
								
								$('#replyCount').text(data.length);
								
								if(data.length == 0) {
									var $span = $('<span>').text('등록된 댓글이 없습니다.').css('margin-right', '200px');
									
									$replyTable.append('<br>');
									$replyTable.append($span);
									$replyTable.append('<br>');
									$replyTable.append('<br>');
									$replyTable.append('<br>');
									
								} else {
									for(var key in data){
										var $table = $('<table>').css('text-align', 'left');
										
										var $tr1 = $('<tr>');
										var $tr2 = $('<tr>');
										
										var $td1 = $('<td>').attr('rowspan', 2);
										var $td2 = $('<td>');
										var $td3 = $('<td>').text(data[key].content);
										
										var $span1 = $('<span>').html(data[key].writer + '&nbsp; &nbsp; ').css('font-weight', 'bold');
										var $span2 = $('<span>').html(data[key].write_date + '&nbsp; &nbsp; ').css('font-weight', 'bold').css('color', 'rgb(190, 190, 190)');
										var $span3 = $('<span>').html('<input type="hidden" value=' + data[key].cno + '><span class="replyUpdate">수정</span> | <span class="replyDelete">삭제</span>');
										
										var $img = $('<img>').attr('src', "<%= request.getContextPath() %>/images/blanket.png").css('width', 'auto').css('height', '50px');
										
										$td1.append($img);
										$td2.append($span1);
										$td2.append($span2);
										if(data[key].writer == '<%= loginUser.getNickName() %>') {
											$td2.append($span3);	
										}
										
										$tr1.append($td1);
										$tr1.append($td2);
										$tr2.append($td3);
										$table.append($tr1);
										$table.append($tr2);
										
										$replyTable.append($table);
										$replyTable.append('<br>');
									}
								}
								
								$('#commentLeft').val('');
							}
						});
					}
				})
				
				$(document).on('click', '.replyUpdate', function(){
					if(($(this).parent().parent().parent().next().children().children()[0]) == undefined) {
						var content = $(this).parent().parent().parent().next().children().text();
						$(this).css("color","rgb(1, 87, 155)")
						$(this).css("font-weight","bold")
						$(this).parent().parent().parent().next().children().html("<textarea style='resize:none; border:0;' cols=80>" + content + "</textarea>");
					} else {
						var cno = $(this).parent().children()[0].value;
						var content = $(this).parent().parent().parent().next().children().children()[0].value;
						var bid = <%= board.getNo() %>;
						
						$.ajax({
							url: '<%= request.getContextPath() %>/update.reply',
							type: 'post',
							data: {cno: cno, content: content, bid: bid},
							success: function(data){
								$replyTable = $('#replyTable');
								$replyTable.html("");
								
								$('#replyCount').text(data.length);
								
								if(data.length == 0) {
									var $span = $('<span>').text('등록된 댓글이 없습니다.').css('margin-right', '200px');
									
									$replyTable.append('<br>');
									$replyTable.append($span);
									$replyTable.append('<br>');
									$replyTable.append('<br>');
									$replyTable.append('<br>');
									
								} else {
									for(var key in data){
										var $table = $('<table>').css('text-align', 'left');
										
										var $tr1 = $('<tr>');
										var $tr2 = $('<tr>');
										
										var $td1 = $('<td>').attr('rowspan', 2);
										var $td2 = $('<td>');
										var $td3 = $('<td>').text(data[key].content);
										
										var $span1 = $('<span>').html(data[key].writer + '&nbsp; &nbsp; ').css('font-weight', 'bold');
										var $span2 = $('<span>').html(data[key].write_date + '&nbsp; &nbsp; ').css('font-weight', 'bold').css('color', 'rgb(190, 190, 190)');
										var $span3 = $('<span>').html('<input type="hidden" value=' + data[key].cno + '><span class="replyUpdate">수정</span> | <span class="replyDelete">삭제</span>');
										
										var $img = $('<img>').attr('src', "<%= request.getContextPath() %>/images/blanket.png").css('width', 'auto').css('height', '50px');
										
										$td1.append($img);
										$td2.append($span1);
										$td2.append($span2);
										if(data[key].writer == '<%= loginUser.getNickName() %>') {
											$td2.append($span3);	
										}
										
										$tr1.append($td1);
										$tr1.append($td2);
										$tr2.append($td3);
										$table.append($tr1);
										$table.append($tr2);
										
										$replyTable.append($table);
										$replyTable.append('<br>');
									}
								}
								
								$('#commentLeft').val('');
							}
						});
					}
				})
			</script>
		</div>
		
		<div class="btnList">
			<div class="button" id="goback">목록으로</div>
			
			<script>
				$('#goback').click(function(){
					location.href='<%= request.getContextPath() %>/list.travel?area=<%= area %>';
				})
			</script>
		</div>
		
	</div>
</body>
</html>