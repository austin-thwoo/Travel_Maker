package com.icia.TravelMaker.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {

	private int BNUMBER;
	private String MID;
	private String BDATE;
	private String BTITLE;
	private int BSTATE;
	private String BCONTENT;
	private String BIMG;
	private MultipartFile BIMGFILE;
	private int BCNUMBER;
}
