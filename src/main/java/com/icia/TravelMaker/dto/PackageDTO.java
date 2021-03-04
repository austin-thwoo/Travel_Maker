package com.icia.TravelMaker.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PackageDTO {

	private int PNUMBER;
	private String PNAME;
	private String PIMG;
	private MultipartFile PIMGFILE;
	private int PADULT;
	private int PCHILD;
	private int PINFANT;
	private int PPERIOD;
	private int PMIN;
	private int PMAX;
	private String PUPLOADDATE;
	private String PINFO;
	private String PINFO_1;
	private String PINFO_2;
	private String PINFO_3;
	private String PINFO_4;
	private String PINFO_5;
	private String PINFO_6;
	private String PINFO_7;
	private String PINFO_8;
	private String PINFO_9;
	private String PINFO_10;
}
