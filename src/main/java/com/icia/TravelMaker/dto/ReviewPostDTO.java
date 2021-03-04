package com.icia.TravelMaker.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewPostDTO {

	private int OPNUMBER;
	private String OMID;
	private String ODATE;
	private String RPDATE;
	private String RPTITLE;
	private int RPSTATE;
	private String RPCONTENT;
	private String RPIMG;
	private MultipartFile RPIMGFILE;
}
