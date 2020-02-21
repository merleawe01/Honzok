<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="b_member.model.vo.Member, e_market.model.vo.Market, java.util.ArrayList"%>  
<%
	int postNo = Integer.parseInt(request.getAttribute("postNo").toString());
	Market m = (Market)request.getAttribute("market");
	Member member = (Member)request.getAttribute("m");

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
	<input type="hidden" name="postNo" value="postNo">
	<script>
		var IMP = window.IMP; // 생략가능
		IMP.init('imp05073510'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		IMP.request_pay({
		    pg : 'kakao', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : <%= m.getPostTitle()%>,
		    amount : <%= m.getItemPrice()%>,
		    buyer_email : <%= member.getEmail()%>,
		    buyer_name : <%= member.getUserName()%>,
		    buyer_tel : <%= member.getPhone()%>,
		    buyer_addr : <%= member.getbAddr()%>,
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    location.href="<%= request.getContextPath()%>/list.m";
		    alert(msg);
		});
		
		
	</script>
		
	
</body>
</html>