<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		
		
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
		#content{ height : 400px; }
		
		#input_contents{ width : 750px;}
		
		.content_title{
			font-weight : bold;
		}
		#text-length{
			text-align : center;
		}
		.must{
			color : gray;
			font-size : 12px;
		}
		
		#input_pic{ width:75px; height:30px; border-radius : 5px; border : 1px gray solid; }
		#input_title{ width:400px; height:30px; border-radius : 5px; border : 1px gray solid; }
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
		<form action="<%= request.getContextPath() %>/insert.bo" method="post">
	
			
			
				
					
					<table id = "content_table" style="margin-left: auto; margin-right: auto;">
						<tr>
							<td class = "content_title" id = "title">제목<label class = "must">(필수)</label></td>
							<td id = "input_contents"><input type = "text" id = "input_title" placeholder = "제목 입력해주세요." name = "postTitle"></td>
						</tr>
						
						<tr>
							<td class = "content_title" id = "content">내용<label class = "must">(필수)</label></td>
							<td><textarea  id = "input_content" placeholder = "내용을 입력해주세요." name = "content"></textarea>
							<span ><span id="text-length">0</span>/780</span></td>
						</td>

       							
						</tr>
					
					</table>
				 
				
				<div id = "btn">
					<input id = "onebu" type="submit" value="작성하기"> 
					<input type="button" id="twobu" value="목록으로" onclick="location.href='<%= request.getContextPath() %>/list.bo'">
				</div>
				
				
				
				
			</form>
		</div>
			<script>
	$(document).ready(function() {


	    $('#input_content').on('keyup', function() {
	    	 var inputLength=$(this).val().length;
			  var remain=780-inputLength;
			  
			  $('#text-length').html(remain);


	        if($(this).val().length > 780) {
	        	 $('#text-length').css('color','red');
	            $(this).val($(this).val().substring(0, 780));
	        }else{
				   $('#text-length').css('color','black');
			  }


	    });


	});
	
	
</script>
	

</body>
</html>