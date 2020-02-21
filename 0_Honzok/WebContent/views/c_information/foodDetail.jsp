<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="c_information.model.vo.*, java.util.ArrayList"%>
<%
	FoodBoard board = (FoodBoard)request.getAttribute("board");
	ArrayList<Image> imgList = (ArrayList<Image>)request.getAttribute("imgList");
	ArrayList<Reply> replyList = (ArrayList<Reply>)request.getAttribute("replyList");
	
	// 댓글 구현해야되고 추천이랑 조회수 작성자 어디에 나타낼지 로그인된 유저에 따라 수정삭제, 추천기능
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
	#soulFood{
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
	#btnList{
		width: 100%;
		height: 50px;
		margin-top: 10px;
		padding-bottom: 10px;
	}
	#btnList div{
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
		width : 60px;
		height : 60px;
		background-color: white;
		display : inline-table;
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
						photoSrc.push("<%= request.getContextPath() %>/images/food_board/<%= img.getChange_name() %>");
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
					if(temp == 1){
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
					if(temp == photoSrc.length-2){
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
			<div class="left">가게이름</div>
			<div class="right"><b><%= board.getTitle() %></b></div>
		</div>
		
		<div id="score">
			<div class="left">음식점에 대한 평가</div>
			<div class="right">
				<% for(int i = 0; i < 5; i++) {
						if(i > board.getStar()) {%>
						<img src="<%= request.getContextPath() %>/images/empty_star.png" class="star">
						<% } else { %>
						<img src="<%= request.getContextPath() %>/images/star.PNG" class="star">
						<% } %>
					<% } %>
			</div>
		</div>
		
		
		<div id="review">
			<div class="left">리뷰내용</div>
			<div class="right" id="reviewContent"><%= board.getContent() %></div>
		</div>
		
		<div id="soulFood">
			<div class="left">추천하는 음식</div>
			<div class="right"><%= (board.getRc_food() == null) ? "" : board.getRc_food() %></div>
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
		
		<div id="btnList">
			<div style="background-color: rgb(224, 224, 224);">목록으로</div>
			<div style="background-color: rgb(224, 224, 224);">삭제</div>
			
			<form action="<%= request.getContextPath() %>/views/c_information/foodUpdate.jsp" id="updateForm" method="post">
				<input type="hidden" name="no" value="<%= board.getNo() %>">
				<input type="hidden" name="title" value="<%= board.getTitle() %>">
				<input type="hidden" name="star" value="<%= board.getStar() %>">
				<input type="hidden" name="category" value="<%= board.getCategory() %>">
				<input type="hidden" name="content" value="<%= board.getContent() %>">
				<input type="hidden" name="rc_food" value="<%= (board.getRc_food() == null) ? "" : board.getRc_food() %>">
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
				
				<div id="update" style="background-color: rgb(241, 131, 50); color: white;">수정</div>
			</form>
			
			<div style="background-color: rgb(241, 131, 50); color: white;">추천</div>
			<!-- 접근 유저에 따라 보여지는 버튼 및 이벤트 다르게 구현 -->
		</div>
		
		<script>
			$('#update').click(function(){
			 	if(confirm("글을 수정하시겠습니까?")) {
					$('#updateForm').submit();
				}
			})
		</script>
		
		<p style="float: left; color: rgb(51, 51, 51)">댓글 <%= replyList.size() %></p>
		
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
					<tr><td><%= replyList.get(i).getContent() %></td></tr>
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
					} else {
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
			</script>
			
		</div>
	</div>

</body>
</html>