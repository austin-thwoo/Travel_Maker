<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	var IMP = window.IMP; // 생략가능
	IMP.init('imp52261380');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드

	IMP.request_pay({
		pg : 'inicis',
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '${orders.getPNAME()}',
		amount : '${orders.getOAMOUNT()}',
		buyer_email : '${orders.getMID()}',
		buyer_name : '${orders.getMNAME()}'
		/* buyer_tel : '010-1234-5678',
		buyer_addr : '서울특별시 강남구 삼성동',
		buyer_postcode : '123-456' */
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        /* msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num; */
	        if('${pay}' == 1){
		        opener.saleForm.submit();	
	        }else if('${pay}' == 2){
	        	opener.location.href = "balanceUpdate?MID=${orders.getMID()}&OAMOUNT=${orders.getOAMOUNT()}&ODATE=${orders.getODATE()}&PNUMBER=${orders.getPNUMBER()}&OSTATE=2";
	        }
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	    window.close();
	});
</script>
</head>
<body>


</body>
</html>
