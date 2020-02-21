<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="f_message.model.vo.*"%>
<%
	Message m = (Message)request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<style>
	.tableArea{width:430px;}
	#writerForm{background: rgba(255, 255, 255, 0.4); border: 5px solid white;}
	th{flex:1; text-align:left; padding:5px; width:100px;}
	td{width:430px}
	.td{padding:5px;}
	button:hover{cursor: pointer;}
	#center{text-align:center;}
	#menuBtn{background: #AEBF2A; color:white; display:inline-block;
			 padding:5px; margin:5px; align:center;}
	#store{background: powderblue;}
</style>
</head>
<body onresize="parent.resizeTo(530,600)" onload="parent.resizeTo(530,600)">
	<%@ include file="messageMenuBar.jsp"%>
		<div class="tableArea">
			<%-- request.getContextPath() %>/detail.bo --%>
			<form action="list.box" id="detaiForm" method="post">
				<table>
					<tr>
						<th>제목</th>
						<td colspan="" class="td"><input type="hidden" value="<%=m.getmNo()%>" name="bId"> 
						<input type="hidden" name="title" value="<%= m.getmTitle()%>"><%= m.getmTitle() %></td>
					</tr>
					<tr>
						<th>보낸 사람</th>
						<td class="td"><input type="hidden" name="from"
							value="<%= m.getFrom() %>"><%= m.getFrom() %></td>
					</tr>
					<tr>
						<th>받은 날짜</th>
						<td class="td"><input type="hidden" name="date"
							value="<%= m.getDate()%>"><%= m.getDate()%></td>
					</tr>
					<tr>
						<th>내용</th>
						<td></td>
					</tr>
					<tr>
						<td colspan="2" name="content" id="writerForm" cols="50" rows="20"
								style="resize: none; width:430px; font-size:15px;">
							<%= m.getContent() %>
							<%-- <textarea name="content" id="writerForm" cols="60" rows="20"
								style="resize: none; width:450px; font-size:15px;" readonly><%= m.getContent() %></textarea> --%>
								
						</td>
					</tr>
				</table>
			</form>

			<div id="center">
				<button type="button" id="menuBtn" onclick="location.href='<%= request.getContextPath() %>/list.box'">목록으로</button>
			</div>
		</div>
		<script>
		
		$('.menu').mouseout(function() {
			$('#send').css('background', 'powderblue');
			$('#store').css('background', '#e0e0e0');
			$('#recieve').css('background', '#e0e0e0');
		});

	</script>
</body>
</html>