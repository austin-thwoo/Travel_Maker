package com.icia.TravelMaker.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.icia.TravelMaker.dto.CKEditorDTO;
import com.icia.TravelMaker.dto.MemberDTO;
import com.icia.TravelMaker.dto.MultiRowDTO;
import com.icia.TravelMaker.dto.PageDTO;
import com.icia.TravelMaker.service.HomeService;
import com.icia.TravelMaker.util.ExportExcelUtil;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private HomeService service;
	private ModelAndView mav;
	
	private void mav() {
		if(mav == null) {
			mav = new ModelAndView();
		}
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	private ModelAndView home(@ModelAttribute MemberDTO dto) {
		mav();
		mav.addObject("bestOrderList", service.bestOrderList());
		if(dto.getMID() != null) {
			mav.addObject("preferOrderList", service.preferOrderList(dto));
			mav.addObject("likeOrderList", service.likeOrderList(dto));
			mav.addObject("sameLikeOrderList", service.sameLikeOrderList(dto));
			mav.addObject("sameOrderList", service.sameOrderList(dto));
		}
		mav.addObject("bestLikeList", service.bestLikeList());
		mav.addObject("ReviewPost", service.ReviewPost());
		mav.setViewName("Main");
		return mav;
	}
	
	@RequestMapping(value = "/fileUpload")
	private void fileUpload(HttpServletRequest request, HttpServletResponse response, CKEditorDTO dto, Model model) throws Exception {
		  String oriFileName = dto.getUpload().getOriginalFilename();
		  String fileName = "";
		  String CKEditorFuncNum = "";
		  String root_path = request.getServletContext().getRealPath("/resources/upload/"); //저장경로
		  String file_path = "resources/upload/"; //url경로
		  
		  if(dto.getUpload() != null) {
			  fileName = UUID.randomUUID().toString() + oriFileName.substring(oriFileName.lastIndexOf("."));
			  dto.setFilename(fileName);
			  CKEditorFuncNum = dto.getCKEditorFuncNum();
			  try {
				  File file = new File(root_path + fileName);
				  dto.getUpload().transferTo(file);
			  } catch (Exception e) {
				  e.printStackTrace();
			  }
		  }
		  response.setContentType("text/html; charset=UTF-8");
		  PrintWriter out = response.getWriter();
		  out.println("<script>");
		  out.println("window.parent.CKEDITOR.tools.callFunction('"+CKEditorFuncNum+"', '"+file_path + fileName+"', '파일 전송 완료.');");
		  out.println("</script>");
		  out.flush();
		  out.close();
	}
	
	@RequestMapping(value = "/exportExcel")
	private ModelAndView exportExcel(@ModelAttribute MultiRowDTO dto, @ModelAttribute PageDTO pdto) throws Exception {
		mav();
		Date now =new Date();
		SimpleDateFormat simpledate = new SimpleDateFormat("yyMMdd_hhmmss");
		ExportExcelUtil.writeNoticeListToFile(simpledate.format(now)+ "travelerList.xlsx", dto.getTravelerList());
		mav.addObject("nowPage", pdto.getNowPage());
		mav.setViewName("redirect:/goTravelerList");
	return mav;
	}

}
