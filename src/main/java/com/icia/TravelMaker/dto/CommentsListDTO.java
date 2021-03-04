package com.icia.TravelMaker.dto;

import lombok.Data;

@Data
public class CommentsListDTO {

	private int BNUMBER;
	private String BTITLE;
	private int BSTATE;
	private String MID;
	private String MNICK;
	private String CMDATE;
	private String CMCONTENT;
	private String CMSTATE;
	private int COMMENTSCOMPLAINT;
	private int COMMENTSLIKE;
}
