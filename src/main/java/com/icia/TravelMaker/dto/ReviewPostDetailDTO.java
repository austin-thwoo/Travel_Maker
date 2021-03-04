package com.icia.TravelMaker.dto;

import lombok.Data;

@Data
public class ReviewPostDetailDTO {

	private int OPNUMBER;
	private String OMID;
	private String MNICK;
	private String ODATE;
	private String RPDATE;
	private String RPTITLE;
	private String RPCONTENT;
	private String RPIMG;
	private int RPSTATE;
}
