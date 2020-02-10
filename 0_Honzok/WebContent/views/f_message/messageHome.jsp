<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  page import = "java.util.ArrayList, b_member.model.vo.Member, f_message.model.vo.Message" %>
<%
	//String nickName = ((Member)session.getAttribute("loginUser")).getNickName();
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지함</title>

<style>
	body {border:1px solid balck;}
	#userMessage {text-align:center; width:480px; height:40px; background:powderblue; color:white;
					font-weight:bold; margin:0 auto;}
	.wrap{background: white; width: 100%; height: 40px; align:center;}
	.menu{background: #e0e0e0; color: black; text-align: center; font-weight: bold;
         vertical-align: middle; width: 160px; height: 40px; display: table-cell; margin:5px auto;}
    #recieve{background: #A0CEDE; }
    nav{width: 480px; margin-left: auto; margin-right: auto;}
    .menu:hover {background: #A0CEDE; color:white; font-weight:bold; cursor:pointer;}
    .tableArea{width:480px;	height:350px; margin-left:auto; margin-right:auto; border:1px solid black;}
	#list{text-align:center;}
	th{color:gray; border-bottom:1px solid gray;}

</style>
</head>
<body onresize="parent.resizeTo(480,600)" onload="parent.resizeTo(480,600)">
	<div class="outer">
		<div id="userMessage">
			<%--=nickName --%>님의 쪽지함
			<img alt="쪽지" src="../../images/receive_letter.png" style="width:30px; height:30px; vertical-align:bottom;">
		</div>
		<div class="wrap">
			<nav>
				<div class="menu" id="recieve" onclick="goRecieve();">받은쪽지함</div>
				<div class="menu" onclick="goSend();">보낸쪽지함</div>
				<div class="menu" onclick="goBox();">쪽지보관함</div>
			</nav>
		</div>
		<div class="tableArea">
			<table id="list">
				<tr>
					<th width=30px><input type="checkbox" name="selectAll"></th>
					<th width=150px>보낸 사람</th>
					<th width=250px>제목</th>
					<th width=100px>받은 날짜</th>
				</tr>
				
				<%-- <% if(list.isEmpty()){ %>
				<tr>
					<td colspan="4">조회된 리스트가 없습니다.</td>
				</tr>
				<% } else{ 
						for(Message m : list){
				
				%>
				<tr>
					<td></td>
					<td><%= m.getFrom()%></td>
				<% if(m.getView() == 0) {%>
					<td style="color:#f18332"><%= m.getmTitle()%></td>
				<% } else { %>
					<td style="color:#f18332"><%= m.getmTitle()%></td>
				<% } %>	
					<td><%= m.getDate()%></td>
				</tr>
				<% 		} 
					}				
				%> --%>
			</table>
		
		</div>
	
	</div>
	<script>
		function goRecieve(){
			location.href="<%= request.getContextPath()%>/list.re";
		}
		function goSend(){
			location.href="<%= request.getContextPath()%>/list.se";
		}
		function goBox(){
			location.href="<%= request.getContextPath()%>/list.box"
		}
	</script>
</body>
</html>