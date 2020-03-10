<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="b_member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>
<style>
	.outer{margin-left: auto; margin-right: auto;}
	h3{margin:8px;}
	#writerForm{background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 50px;}
	table{ align:center;}
	th{text-align:left; width:100px; margin-bottom:5px;}
	td{padding-left:5px;}
	th, td{cellpadding:5px; margin-bottom:5px;}
	#to_th{width:200px;}
	.Btn{align:center; background: #AEBF2A; color:white; display:inline-block; padding:5px;}
	button:hover{cursor: pointer;}
	#countDiv{text-align:right;}
</style>
</head>
<body onresize="parent.resizeTo(530,600)" onload="parent.resizeTo(530,600)">
	<%@ include file="messageMenuBar.jsp"%>
	<div class="outer">
		<h3 align="center">쪽지 보내기</h3>
		<form id="sendMsgForm" action="<%= request.getContextPath()%>/send.msg" method="post">
		<div id="writeForm">
			<table>
				<tr>
					<th>제목</th>
					<td colspan="2"><input type="text" name="mtitle" id="mtitle" required ></td>
				</tr>
				<tr>
					<th id="to_th">받는사람</th>
					<td width=50px><input type="text" name="mto" id="mto" size="15" required ></td>
					<td style="margin-left:5px;"><label id="checkMember"></label></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="2">
						<textarea rows="13" cols="60" name="mcontent" id="mcontent" style="resize:none;" required></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="3"><div id="countDiv"><span id="count">0</span>/1000</div></td>
				</tr>
			</table>
		</div>
			<div align="center">
				<button type="button" class="Btn" id="sendBtn" onclick="validate();">보내기</button>
				<button type="button" class="Btn" id="cancleBtn"
					onclick="location.href='<%= request.getContextPath()%>/list.re'">취소</button>
			</div>
		</form>
	
	</div>
	
	<script>
	
		var isTitleChecked = false;
		var title = $('#mtitle');
		
		$('#mtitle').change(function(){
			if(title.val().trim().length< 1){
				alert('제목을 입력해주세요.');
				title.focus();
				isTitleChecked = false;
			} else{
				isTitleChecked = true;
			}
			
		});
		
		// 닉네임 유효성 검사
		var isExisst = false;
		var isToChecked = false;
	
		$('#mto').on('change paste keyup', function(){
			isToChecked = false;
		});
		
		$('#mto').change(function(){
			var toMember = $('#mto');
			
			if(toMember.val().trim().length < 1){
				alert('보낼 사람의 닉네임을 작성해주세요.');
				toMember.focus();
			} else{
				$.ajax({
					url: "<%= request.getContextPath()%>/toCheck.me",
					data: {toMember: toMember.val()},
					success: function(data){
						if(data == 'success'){
							$('#checkMember').text("닉네임이 존재합니다.");
							$('#checkMember').css({'color':'#768149','float':'left', 'diplay':'inline-block'});
							isExisst = true;
							isToChecked = true;
						} else {
							$('#checkMember').text('해당 닉네임이 존재하지 않습니다.');
							$('#checkMember').css({'color':'#f18332','float':'left', 'diplay':'inline-block'});
							isExisst = false;
							isToChecked = false;
							toMember.focus();
						}
					}
				});
			}
		});
		
		function validate(){
			var inputLength = $('#mcontent').val().length;
			if(inputLength > 1000) {
				alert('내용은 1000자 이상 보낼 수 없습니다.');
			} else if(isExisst && isToChecked){
				$('#sendMsgForm').submit();
			} else {
				alert('받을 사람의 닉네임을 확인해주세요');
				return false;
			}
		}
		
		$(function(){
			$('#mcontent').keyup(function(){
				var inputLength = $(this).val().length;
				$('#count').html('<b>'+inputLength+'<b>');
				
				
				if(inputLength > 1000){
					$('#count').css('color', 'red');
					$('#endBtn').attr('disabled', 'true');
				} else if (inputLength < 10){
					$('#endBtn').click(function(){
						alert("최소 10자 이상 입력해주세요.");	
						$('#content').focus();
					});
				} else{
					$('#count').css('color', 'black');
					$('#endBtn').attr('disabled', 'false');
				};
			});
		});
		
		var isContentChecked = false;
		var content = $('#mcontent');
		
		$('#mcontnet').change(function(){
			if(content.val().trim().length < 10){
				alert('최소 10자 이상 입력해주세요.');
				content.focus();
				isContentChecked = false;
			} else{
				isContentChecked = true;
			}
			
		});
	
	</script>
</body>
</html>