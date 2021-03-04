package com.icia.TravelMaker.dto;

import lombok.Data;

@Data
public class OrdersDTO {

	private String MID;
	private String MNICK;
	private String MNAME;
	private int PNUMBER;
	private String PNAME;
	private String ODATE;
	private int OADULT;
	private int OCHILD;
	private int OINFANT;
	private int OAMOUNT;
	private int OSTATE;
	private String PSSTART;
	private String PSEND;
	
	private String imp_uid;	//고유아이디
	private String merchant_uid;	//상점 거래아이디
	private String paid_amount;	//결제 금액
	private String apply_num;	//카드 승인번호
	private String status;	//결제상태
	private String name;	//주문 명
}
