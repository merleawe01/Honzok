<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="d_trade.model.vo.*, java.util.*, b_member.model.vo.* "%>
<%
	int myPoint = ((Member)request.getSession().getAttribute("loginUser")).getPoint();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		
		.input{
			width : 100%;
			height : 30px;
			border-bottom: 2px solid gray;
			text-align: left;
			padding-bottom: 10px;
			padding-top: 10px;
		}
		.left{
			width : 180px;
			display: inline-table;
			font-size: 13pt;
			font-weight : bold;
		}
		.must{
			font-size: 11pt;
			color: gray;
		}
		.right{
			height: 20px; 
			font-size: 12pt;
			border-radius : 5px;
    		border : 1px solid lightgray;
		}
		input[type=number]::-webkit-inner-spin-button,
    	input[type=number]::-webkit-outer-spin-button {
	        -webkit-appearance: none;             
        	margin: 0;         
    	} 
    	#notice{
    		width : 100%;
    		text-align: left;
    		height: 150px;
    		background-color: rgba(224, 224, 224, 0.45);
    		font-size: 11pt;
    		
    	}
    	
    	.check{
    		width : 20px;
    		height: 20px;
    	}
    	
    	.price{
    		margin-left : 10px;
    		width : 100px;
    		border-radius : 5px;
    		border : 1px solid lightgray;
    	}
    	
    	#buy_now{
    		margin-left : 40px;
    	}
    	
    	#ok{
			width : 100px;
			height : 40px;
			background-color : rgb(241, 131, 50);
			color : white;
			border-radius: 5px;
			margin: 10px;
			line-height: 40px;
			font-weight: bold;
			display: inline-table;
			text-align: center;
			cursor: pointer;
			border : 0px;
			font-size : 15px;
		}
		#cancel{
			width : 100px;
			height : 40px;
			background-color : rgb(224, 224, 224);
			color : rgb(64, 64, 64);
			border-radius: 5px;
			margin: 10px;
			line-height: 40px;
			font-weight: bold;
			display: inline-table;
			text-align: center;
			cursor: pointer;
			border : 0px;
			font-size : 15px;
		}
		
		#input_address{
			height : 90px;
		}
		
		.address1{
			margin-left : 185px;
			margin-top : 8px;
		}
		
		.address2{
         font-size: 9pt;
         color : gray; 
         margin-left : 8px;
      }
</style>
</head>
<body>
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('물귤교환');
	</script>
	
	<div id = "main">
			<form action = "<%= request.getContextPath() %>/bid.gy" method="post" id="bidInform">
				<div class="input">
					<div class="left">이름 <span class="must">(필수)</span></div>
					<input type="text" maxlength="8" name = "userName" class="right" value="<%= loginUser.getUserName() %>" style="width: 120px;">
					<input type="hidden" name="pno" value="<%= request.getParameter("postNo") %>">
				</div>
				<div class="input">
					<div class="left">전화번호 <span class="must">(필수)</span></div>
					<select class="right" style="height: 30px;" name="phone1" id="phone1">
  						<option value="010">010</option>
  						<option value="011">011</option>
  						<option value="016">016</option>
  						<option value="017">017</option>
  						<option value="018">018</option>
  						<option value="019">019</option>
					</select> - 
					<input type="number" class="right" name="phone2" value="<%=loginUser.getPhone().substring(3, 7)%>" style="width: 80px;"> - 
					<input type="number" class="right" name="phone3" value="<%=loginUser.getPhone().substring(7, 11)%>" style="width: 80px;"> 
					

					
				</div>
				<div class="input">
					<div class="left">이메일 <span class="must">(필수)</span></div>
					<input type="text" maxlength="16" class="right" id="email01" name = "email1" value="<%= loginUser.getEmail().substring(0, loginUser.getEmail().indexOf("@")) %>" style="width: 200px;"> @ 
					<input type="text" maxlength="16" class="right" id="email02" name = "email2" value="<%= loginUser.getEmail().substring(loginUser.getEmail().indexOf("@")+1) %>" style="width: 150px;">
					<select name = "selectEmail" id="selectEmail" class="right" style="height: 30px;">
  						<option value="1">직접입력</option>
                 		<option value="daum.net">daum.net</option>
                 		<option value="empal.com">empal.com</option>
                 		<option value="gmail.com">gmail.com</option>
                 		<option value="hanmail.net">hanmail.net</option>
                 		<option value="msn.com">msn.com</option>
                 		<option value="naver.com">naver.com</option>
                 		<option value="nate.com">nate.com</option>
					</select>
				</div>
				
				<script>
		           $('#selectEmail').change(function(){
		              $("#selectEmail option:selected").each(function () {
		                 if($(this).val()== '1'){ //직접입력일 경우
		                    $("#email02").val(''); //값 초기화 
		                    $("#email02").attr("disabled",false); //활성화
		                    }else{ //직접입력이 아닐경우 
		                       $("#email02").val($(this).text()); //선택값 입력
		                       $("#email02").attr("disabled",true); //비활성화 
		                       } 
		                 }); 
		              });
	           </script>
				
				<div class="input" id = "input_address">
					<div class="left">주소</div>
					
					<input type = "number" class = "right" id="postalCode" name="postalCode" value = "<%= loginUser.getPostalCode() %>" style = "width : 120px;"/>
                    <input type="button" onclick="goPopup()" class="mini_bt" style="margin-left:5px;" value="우편번호"/><br>
                     
                    <input type = "text" class = "right address1" id="bAddr" name="bAddr" value = "<%= loginUser.getbAddr() %>" style = "width : 400px;"><label class = address2> 기본 주소</label> <br>
                    <input type = "text" class = "right address1" id="lAddr" name="lAddr" value = "<%= loginUser.getlAddr() %>" style = "width : 400px;"><label class = address2> 나머지 주소</label>
					
				</div>
				
				<script>
                  function goPopup(){
                    
                     var pop = window.open("../../popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
                  }
                  function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
                     document.getElementById("bAddr").value = roadAddrPart1;
                     document.getElementById("lAddr").value = addrDetail;
                     document.getElementById("postalCode").value = zipNo;
                  }
               </script>
				
				<div class="input">
					<div class="left">사용 귤<span class="must">(필수)</span></div>
					<label>입찰</label><input type ="radio" class = "check" name="check1" id = "bid"><input type = "number" name ="point" class = "price" id = "bid2" value="<%= request.getParameter("point") %>" disabled><label>귤</label>
					<label id = "buy_now">즉시구매</label><input type ="radio" class = "check" name="check1" id = "nowbuy"><input type = "number" name ="point" class = "price" id = "nowbuy2" value="<%= request.getParameter("max") %>" disabled readonly><label>귤</label>
				</div>
				
				<script>
					
				 	$('.check').click(function(){
						 if($('#bid').is(":checked")){
						    	$('#bid2').attr("disabled", false);
					        	$('#nowbuy2').attr("disabled", true);
					        } else{
					        	$('#nowbuy2').attr("disabled", false);
					        	$('#bid2').attr('disabled', true);
					        }
						}); 
					
				</script>
				
				<br><br>
				
				<div id="notice">
					* 거래전 필독! 주의하세요! <br> 
					* 물귤교환의 모든 거래 물품은 착불로 접수됩니다.
				</div>
				
				<br>
				
				<input id = "ok" value="신청완료"> 
				<input id="cancel" value="취소">
		</form>
	</div>

	<script>
		$(function(){
			var opLength = $("option").length;
			for(var i = 0; i < opLength; i++){
				if($("option")[i].text == "<%=loginUser.getPhone().substring(0, 3)%>") {
					$("option")[i].selected = true;
				} else {
					$("option")[i].selected = false;
				}
			}
		});
	</script>
	
	<script>
		$(function(){
			$('#ok').click(function(){
				var input_point = $('#bid2').val();
				if($('#bid').is(":checked")){
					if(Number(input_point) <= <%= request.getParameter("min") %>){
						alert("시작 입찰귤 보다 높은 귤을 입력해주세요.\n시작 입찰귤은 <%= request.getParameter("min") %>귤 입니다.");
						return false;
					}else if(Number(input_point) > <%= request.getParameter("max") %>){
						alert("즉시 구매귤 보다 높은 귤을 입력할 수 없습니다.");
						return false;
					}else if(Number(input_point) <= <%= request.getParameter("point") %>){
						alert("기존 입찰귤 보다 높은 귤을 입력해주세요.\n현재 입찰귤은 <%= request.getParameter("point") %>귤 입니다.");
						return false;
					}else if(<%= myPoint %> < Number(input_point)){
						alert("보유하신 포인트가 부족합니다!");
						return false;
					}else{
						$("#bidInform").submit();
					}
				}else if($('#nowbuy').is(":checked")){
					var result = confirm("정말 구매하시겠습니까?");
					
					if(result){
						if(<%= myPoint %> >= <%= request.getParameter("max") %>){
							$("#bidInform").attr("action", "<%= request.getContextPath()%>/update.point?postNo="+<%= request.getParameter("postNo") %>+"&writer=<%= request.getParameter("writer") %>");
							$("#bidInform").submit();
						}else{
							alert("포인트가 부족합니다!!!\n보유 포인트 : <%= myPoint %>");
							return false;
						}
					}else{
						return false;
					}
				}
			});
		});
		
		
		
		$(function(){
			$('#cancel').click(function(){
				var result = confirm("정말로 신청작성을 취소하시겠습니까?");
				if(result){
					location.href="<%= request.getContextPath()%>/detail.gy?postNo="+<%= request.getParameter("postNo") %>;
				}else{
					return false;
				}
			})
		})
	</script>
</body>
</html>