<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="b_member.model.vo.Member, e_market.model.vo.Market, java.util.ArrayList"%>  
<%
	Market m = (Market)request.getAttribute("market");
%>    
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<%@ include file="../a_common/boardCommon.jsp" %>
	<input type="hidden" name="sellYN" id="sellYN" value="<%= m.getSellYn()%>">
	<input type="hidden" name="postNo" id="postNo" value="<%= m.getPostNo()%>">

	<script>
		var sell = null;
		var IMP = window.IMP; 
		IMP.init('imp05073510');
		
		IMP.request_pay({
		    pg : 'kakao', 
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '<%= m.getPostTitle()%>',
		    amount : <%= m.getItemPrice()%>,
		    buyer_email : '<%= loginUser.getEmail() %>',
		    buyer_name : '<%= loginUser.getUserName() %>',
		    buyer_tel : '<%= loginUser.getPhone()%>',
		    buyer_addr : '<%= loginUser.getbAddr()%>',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '<%= loginUser.getUserName() %> 님 \n';
		        msg += '결제 금액 ' + rsp.paid_amount + '원이 결제 되었습니다.';
		        sell = 'Y';
		        $('#sellYN').val(sell);
		    } else {
		        var msg = '결제에 실패하였습니다.\n';
		        msg += '에러내용 : ' + rsp.error_msg;
		        sell = 'N';
		        $('#sellYN').val(sell);
		    }
		  
		    location.href="<%= request.getContextPath()%>/buy2.m?postNo=" + <%= m.getPostNo()%> + "&sellYN=" + $('#sellYN').val();
		    alert(msg);
		});
	</script>	
		
	
		
	
</body>
</html>