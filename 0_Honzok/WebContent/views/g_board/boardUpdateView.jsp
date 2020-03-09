<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		#insert { 
			width : 1170px;
		}

		#contentImgArea2{
			margin-left : 100px;
		}
		
		
		#contentImgArea1:hover, #contentImgArea2:hover{cursor:pointer;}
		
		#content_table{
			border-collapse: collapse;
			border-spacing: 0;
			text-align : left;
		}

		#content_table td{
			border-bottom : 3px solid gray;
		}

		#title{
			width : 150px;
			height : 60px;
		}		
		#start{ height : 60px; }
		#buy{ height : 60px; }
		#time{ height : 60px; }
		#content{ height : 400px; }
		
		#input_contents{ width : 750px;}
		
		.content_title{
			font-weight : bold;
		}
		
		.must{
			color : gray;
			font-size : 12px;
		}
		
		
		#input_title{ width:400px; height:30px; border-radius : 5px; border : 1px gray solid; }
		#input_start{ width:200px; height:30px; border-radius : 5px; border : 1px gray solid; }
		#input_buy{ width:200px; height:30px; border-radius : 5px; border : 1px gray solid; }
		#input_time{ font-weight : bold; font-size : 25px; }
		#input_content{ width:750px; height:350px; border-radius : 5px; border : 1px gray solid; }

				
		#btn{ margin-top : 50px;}
		
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
		}
</style>
</head>
<body>
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('자유게시판');
	</script>
	
	<div id = "main">
		
		<div>
			<form action="<%= request.getContextPath() %>/update.bo" method="post">
			
				<div id = "insert">
				
	
					<table id = "content_table" style="margin-left: auto; margin-right: auto;">
						<tr>
							<td class = "content_title" id = "title">제목<label class = "must">(필수)</label></td>
							
							<td id = "input_contents">
							<input type = "text"  id="input_title" name="post_Title" value="<%= request.getParameter("post_Title")%>">
							<input type="hidden" name="postNo" value="<%= request.getParameter("postNo") %>">
							</td>
						</tr>
						<tr>
							<td class = "content_title" id = "content">내용<label class = "must">(필수)</label></td>
							<td><textarea  id = "input_content"  name = "content" ><%= request.getParameter("content") %></textarea>
							<span ><span id="text-length">0</span>/780</span></td>
						</tr>
					</table>
				</div>
				
				<div id = "btn">
					<button type="submit" id="onebu">수정완료</button>
					<input type="button" id="twobu" value="돌아가기" onclick="location.href='<%= request.getContextPath() %>/detail.bo?postNo=<%= request.getParameter("postNo") %>'">
				</div>
				
				
			</form>
		</div>
	</div>
</body>
</html>