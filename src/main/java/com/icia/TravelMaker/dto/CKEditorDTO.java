package com.icia.TravelMaker.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CKEditorDTO {
	
	private String attach_path;
	private MultipartFile upload;
	private String filename;
	private String CKEditorFuncNum;

}
