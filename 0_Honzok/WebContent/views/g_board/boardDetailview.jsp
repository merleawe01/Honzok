<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="g_board.model.vo.*, java.util.*, b_member.model.vo.*"%>
<%
	Board b = (Board)request.getAttribute("board");
ArrayList<Reply> replyList = (ArrayList<Reply>)request.getAttribute("replyList");
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
			margin-top:-10px;
		}
		#postNo{
		display : inline-block;
			font-size: 13pt;
			float: left;
			font-weight: bold;
		
		}
		#boardWriter {
			width : 100%;
			height : 40px;
			font-family: 'Nanum Gothic', sans-serif;
			font-size: 10pt;
			text-align: right;
			margin-top: 10px;
		}
		


		#detail_content{ border-bottom : 1px solid gray; margin-bottom : 20px; margin-top : 30px;width : 100%;}

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
		
		#content{
			padding : 10px;
			float: left;
			width : 600px;
			height : 330px;
			text-align: left;
			margin-left : 150px;
			margin-top : -90px;
			
		}
		
		#revise{
				  font-size : 10pt;
				  width : 80px;
				  height : 30px;
				   background-color: #f18332;
				    color: white; 
			      border-radius: 5px;
			      border:0;
			      font-weight: bold;
			      cursor:pointer;
			  margin-top:10px;
			margin-left :650px;
			     
		}
		#delete{
				  font-size : 10pt;
				  width : 80px;
				  height : 30px;
			      background-color : lightgray;
			      color : black;
			      border-radius: 5px;
			      border:0;
			      font-weight: bold;
			      margin-left:10px;
			      cursor:pointer;
		}
		
		#onebu{text-align : center;
				  font-size : 15pt;
				  width : 100px;
				  height : 40px;
			      background-color : rgb(241, 131, 50);
			      color : white;
			      border-radius: 5px;
			      border:0;
			      font-weight: bold;
			      line-height: 40px;
			      cursor:pointer;
		}
		#twobu{text-align : center;
				  font-size : 15pt;
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
			      margin-top:20px;
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
		$('#boardName').text('자유게시판');
	</script>
	
	<div id = "main">
	<form action="<%= request.getContextPath() %>/views/g_board/boardUpdateView.jsp" id="detailForm" method="post">
		<div id="boardTitle">
		
	
					<div id="titleTitle">
						<%= b.getPostTitle() %>
						<input type="hidden" value="<%= b.getPostTitle() %>" name = "post_Title">
						<input type = "hidden"   value="<%= b.getPostNo() %>" name="postNo">
						</div>
					
					<div id="titleRight">
						<%= b.getWriteDate() %>
					</div>
				</div>
				
				<div id="boardWriter">
					<%= b.getNickname() %> | 조회 : <%= b.getViewCount() %>
				</div>
				
				<table style="margin-left: auto; margin-right: auto;">
					<tr>
						
					
					</tr>
				</table>
			
				<div>
					<table id = "detail_content">
						<tr>
							<td id = "content_td"></td>
							<td>
								<textarea cols=60 rows=15 id = "content"><%= b.getContent() %></textarea>
								<input type="hidden" value="<%= b.getContent() %>" name = "content">
							</td>
						</tr>
					</table>
				</div>
		
				<div id = "btn1">
					<% if(loginUser != null && loginUser.getUserId().equals(b.getWriter())){ %>
					<input id = "revise" type="submit" value="수정"> 
					<input id = "delete" type="submit" value="삭제" onclick="deleteBo();" >
					<% } %>
							</div>
						</form>
					
				
				
	
		
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
					} else{
						var writer = '<%= loginUser.getUserId() %>';
						var bid = <%= b.getPostNo() %>;
						var content = $('#commentLeft').val();
						
						$.ajax({
							url: '<%= request.getContextPath() %>/insertReply.bo',
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
						var bid = <%= b.getPostNo() %>;
						var rid = $(this).parent().children().eq(0).val();
						$.ajax({
							url: '<%= request.getContextPath() %>/deleteReply.bo',
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
					console.log($(this).parent().parent().parent().next().children()); // 댓글 보여주는 부분의 td까지 왔음
				})
			</script>
		
		</div>
		<div id = "btn2">
				<button id="twobu" onclick="location.href='<%= request.getContextPath() %>/list.bo'">목록으로</button>
	
				</div>
		</div>
	<script>
		function deleteBo(){
			var del = confirm('정말로 삭제하시겠습니까?');
			if(del){
				$('#detailForm').attr('action','delete.Bo');
				$('#detailForm').submit();
			}
		}
		
	</script>
	
	
</body>
</html>