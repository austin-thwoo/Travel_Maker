package com.icia.TravelMaker.dto;

import lombok.Data;

@Data
public class BoardListDTO {

	private int BNUMBER;
	private String BTITLE;
	private String BDATE;
	private String BIMG;
	private int BSTATE;
	private String BCNAME;
	private String MNICK;
	private int MSTATE;
	private int BOARDVIEWS;
	private int BOARDLIKE;
	private int BOARDCOMPLAINT;
}
