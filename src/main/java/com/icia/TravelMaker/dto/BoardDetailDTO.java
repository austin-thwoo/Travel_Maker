package com.icia.TravelMaker.dto;

import lombok.Data;

@Data
public class BoardDetailDTO {

	private int BNUMBER;
	private String MID;
	private String MNICK;
	private String BDATE;
	private String BTITLE;
	private String BCONTENT;
	private String BIMG;
	private int BSTATE;
	private int BCNUMBER;
	private int BOARDVIEWS;
	private int BOARDLIKE;
}
