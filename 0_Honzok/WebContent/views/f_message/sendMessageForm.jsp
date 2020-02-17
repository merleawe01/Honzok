<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="b_member.model.vo.Member"%>
<% String nickName = ((Member)session.getAttribute("loginUser")).getNickName(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>
</head>
<body>
	<div class="outer">
		<h3 align="center">쪽지 보내기</h3>
		<form action="<%= request.getContextPath()%>/send.me" method="post">
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" id="title"></td>
				</tr>
				<tr>
					<th>받는 사람</th>
					<td><input type="text" id="to"></td>
					<td><label id="checkMember"></label></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						<textarea rows="15" cols="60" name="content" style="resize:none;"></textarea>
					</td>
				</tr>
			</table>
			<br>
			<div align="center">
				<button type="submit" id="sendBtn">보내기</button>
				<button type="button" id="cancleBtn"
					onclick="location.href='<%= request.getContextPath()%>/list.re'">취소</button>
			</div>
		</form>
	
	</div>
	
	<script>
		var isUsable = false;
		var isToChecked = false;
	
		$('#to').on('change paste keyup', function(){
			isToChecked = false;
		});
		
		$('#to').change(function(){
			var toMember = $('#to');
			
			if(toMember.val().trim().length < 1){
				alert('보낼 사람의 닉네임을 작성해주세요.');
				toMember.focus();
			} else{
				$.ajax({
					url: "<%= request.getContextPath()%>/toCheck.me",
					data: {toMember: toMember.val()},
					success: function(data){
						if(data == 'success'){
							isUsable = true;
							isToChecked = true;
						} else{
							$('#checkMember').text('해당 닉네임이 존재하지 않습니다.');
							$('#checkMember').css({'color':'#f18332','float':'left', 'diplay':'inline-block'});
							isUsable = false;
							isToChecked = false;
							toMember.focus();
						}
					}
				});
			}
		});
		
		function validate(){
			if(isUsable && isToChecked){
				return true;
			} else{
				alert('받을 사람의 닉네임을 확인해주세요');
				return false;
			}
		}
	
	</script>
</body>
</html>