package com.icia.TravelMaker.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.TravelMaker.dto.AdminJobListDTO;
import com.icia.TravelMaker.dto.BoardCategoryDTO;
import com.icia.TravelMaker.dto.BoardDTO;
import com.icia.TravelMaker.dto.CategoryDTO;
import com.icia.TravelMaker.dto.CommentsDTO;
import com.icia.TravelMaker.dto.MemberDTO;
import com.icia.TravelMaker.dto.MultiRowDTO;
import com.icia.TravelMaker.dto.OrdersDTO;
import com.icia.TravelMaker.dto.PackageDTO;
import com.icia.TravelMaker.dto.PageDTO;
import com.icia.TravelMaker.dto.PointDTO;
import com.icia.TravelMaker.dto.ReviewPostDTO;
import com.icia.TravelMaker.dto.ShoppingListDTO;
import com.icia.TravelMaker.service.AdminService;

@Controller
public class Admincontroller {
	
	@Autowired
	private AdminService service;
	private ModelAndView mav;
	
	private void mav() {
		if(mav == null) {
			mav = new ModelAndView();
		}
	}

	@RequestMapping(value = "/adminPage")
	private ModelAndView adminPage(@ModelAttribute MemberDTO dto) {
		mav();
		mav.addObject("jobList", service.jobList(dto));
		mav.setViewName("admin/AdminPage");
		return mav;
	}
	
	@RequestMapping(value = "/jobListInsert")
	private ModelAndView jobListInsert(@ModelAttribute AdminJobListDTO dto){
		mav();
		service.jobListInsert(dto);
		mav.setViewName("redirect:/jobList?MID=" + dto.getMID());
		return mav;
	}
	
	@RequestMapping(value = "/jobList")
	private @ResponseBody List<AdminJobListDTO> jobList(@ModelAttribute MemberDTO dto){
		return service.jobList(dto);
	}
	
	@RequestMapping(value = "/goAdminJoinForm")
	private ModelAndView goAdminJoinForm() {
		mav();
		mav.setViewName("admin/AdminJoinForm");
		return mav;
	}

	@RequestMapping(value = "/goPackageInsertForm")
	private ModelAndView goPackageInsertForm() {
		mav();
		mav.setViewName("sales/PackageInsertForm");
		return mav;
	}
	
	@RequestMapping(value = "/packageInsert")
	private ModelAndView packageInsert(@ModelAttribute PackageDTO dto, @ModelAttribute MultiRowDTO mrdto, HttpServletRequest request) throws IllegalStateException, IOException {
		mav();
		service.packageInsert(dto, request);
		service.packageLocationInsert(dto, mrdto);
		service.packageScheduleInsert(dto, mrdto);
		mav.setViewName("redirect:/goPackageCategoryForm?PNUMBER="+dto.getPNUMBER());
		return mav;
	}

	@RequestMapping(value = "/goPackageUpdateForm")
	private ModelAndView goPackageUpdateForm(@ModelAttribute PackageDTO dto) {
		mav();
		mav.addObject("packageDetail", service.packageDetail(dto));
		mav.setViewName("sales/PackageUpdateForm");
		return mav;
	}

	@RequestMapping(value = "/packageUpdate")
	private ModelAndView packageUpdate(@ModelAttribute PackageDTO dto) {
		mav();
		service.packageUpdate(dto);
		mav.setViewName("redirect:/goPackageList?to=admin&nowPage=1");
		return mav;
	}

	@RequestMapping(value = "/goPackageCategoryForm")
	private ModelAndView goPackageCategoryForm(@ModelAttribute PackageDTO dto) {
		mav();
		mav.addObject("PNUMBER", dto.getPNUMBER());
		mav.addObject("categoryList", service.categoryList());
		mav.setViewName("sales/PackageCategoryForm");
		return mav;
	}
	
	@RequestMapping(value = "/packageCategoryInsert")
	private ModelAndView packageCategoryInsert(@RequestParam(value="CNUMBER") int[] CNUMBER, @RequestParam("PNUMBER") int PNUMBER) {
		mav();
		service.packageCategoryInsert(CNUMBER, PNUMBER);
		mav.addObject("to", "admin");
		mav.addObject("nowPage", 1);
		mav.setViewName("redirect:/goPackageList");
		return mav;
	}

	@RequestMapping(value = "/goBoardCategoryList")
	private ModelAndView goBoardCategoryList() {
		mav();
		mav.addObject("boardCategoryList", service.boardCategoryList());
		mav.setViewName("admin/BoardCategoryList");
		return mav;
	}

	@RequestMapping(value = "/boardCategoryList")
	private @ResponseBody List<BoardCategoryDTO> boardCategoryList() {
		return service.boardCategoryList();
	}
	
	@RequestMapping(value = "/boardCategoryInsert")
	private ModelAndView boardCategoryInsert(@ModelAttribute BoardCategoryDTO dto) {
		service.boardCategoryInsert(dto);
		mav.setViewName("redirect:/goBoardCategoryList");
		return mav;
	}

	@RequestMapping(value = "/boardCategoryUpdate")
	private ModelAndView boardCategoryUpdate(@ModelAttribute BoardCategoryDTO dto) {
		mav();
		service.boardCategoryUpdate(dto);
		mav.setViewName("redirect:/goBoardCategoryList");
		return mav;
	}

	@RequestMapping(value = "/goCategoryList")
	private ModelAndView goCategoryList() {
		mav();
		mav.addObject("categoryList", service.categoryList());
		mav.setViewName("admin/CategoryList");
		return mav;
	}

	@RequestMapping(value = "/CategoryList")
	private @ResponseBody List<CategoryDTO> CategoryList() {
		return service.categoryList();
	}
	
	@RequestMapping(value="categoryInsert")
	private ModelAndView categoryInsert(@ModelAttribute CategoryDTO dto){
		mav();
		service.categoryInsert(dto);
		mav.setViewName("redirect:/goCategoryList");
		return mav;
	}
	
	@RequestMapping(value="categoryUpdate")
	private ModelAndView categoryUpdate(@ModelAttribute CategoryDTO dto ){
		mav();
		service.categoryUpdate(dto);
		mav.setViewName("redirect:/goCategoryList");
		return mav;
	}
	
	@RequestMapping(value = "/goComplaintBoardList")
	private ModelAndView goComplaintBoardList(@ModelAttribute PageDTO pdto, @ModelAttribute MemberDTO dto) {
		mav();
		mav.addObject("boardList", service.complaintBoardList(dto, pdto));
		mav.addObject("page", pdto);
		mav.addObject("MID", dto.getMID());
		mav.setViewName("admin/ComplaintBoardList");
		return mav;
	}

	@RequestMapping(value = "/goTravelerList")
	private ModelAndView goTravelerList(@ModelAttribute PageDTO pdto) {
		mav();
		mav.addObject("travelerList", service.travelerList(pdto));
		mav.addObject("page", pdto);
		mav.setViewName("admin/TravelerList");
		return mav;
	}
	
	@RequestMapping(value = "/goComplaintCommentsList")
	private ModelAndView goComplaintCommentsList(@ModelAttribute PageDTO pdto, @ModelAttribute MemberDTO dto) {
		mav();
		mav.addObject("commentsList", service.complaintCommentsList(dto, pdto));
		mav.addObject("page", pdto);
		mav.addObject("MID", dto.getMID());
		mav.setViewName("admin/ComplaintCommentsList");
		return mav;
	}

	@RequestMapping(value = "/goMemberList")
	private ModelAndView goMemberList(@ModelAttribute MemberDTO dto, @ModelAttribute PageDTO pdto) {
		mav();
		mav.addObject("memberList", service.memberList(dto, pdto));
		mav.addObject("MLEVEL", dto.getMLEVEL());
		mav.addObject("page", pdto);
		mav.setViewName("admin/MemberList");
		return mav;
	}
	
	@RequestMapping(value = "/memberStateUpdate")
	private ModelAndView memberStateUpdate(@ModelAttribute MemberDTO dto) {
		mav();
		service.memberStateUpdate(dto);
		mav.setViewName("redirect:/goMemberList?MLEVEL="+dto.getMLEVEL());
		return mav;
	}
	
	@RequestMapping(value = "/commentsLock")
	private @ResponseBody int commentsLock(@ModelAttribute CommentsDTO dto) {
		return service.commentsLock(dto);
	}
	
	@RequestMapping(value = "boardLock")
	private @ResponseBody int boardLock(@ModelAttribute BoardDTO dto) {
		return service.boardLock(dto);
	}
	
	@RequestMapping(value = "reviewPostLock")
	private @ResponseBody int reviewPostLock(@ModelAttribute ReviewPostDTO dto) {
		return service.reviewPostLock(dto);
	}
	
	@RequestMapping(value = "boardCategorylock")
	private @ResponseBody int boardCategorylock(@ModelAttribute BoardCategoryDTO dto) {
		return service.boardCategorylock(dto);
	}

	@RequestMapping(value = "/complaintBoardDetail")
	private ModelAndView complaintBoardDetail(@ModelAttribute BoardDTO dto) {
		mav();
		mav.addObject("complaintBoardDetail", service.complaintBoardDetail(dto));
		mav.setViewName("admin/ComplaintBoardDetail");
		return mav;
	}

	@RequestMapping(value = "/complaintCommentsDetail")
	private ModelAndView complaintCommentsDetail(@ModelAttribute CommentsDTO dto) {
		mav();
		mav.addObject("complaintCommentsDetail", service.complaintCommentsDetail(dto));
		mav.setViewName("admin/ComplaintCommentsDetail");
		return mav;
	}
	
	@RequestMapping(value = "/boardCategoryCheck")
	private @ResponseBody String boardCategoryCheck(@ModelAttribute BoardCategoryDTO dto) {
		return service.boardCategoryCheck(dto);
	}
	
	@RequestMapping(value = "/categoryCheck")
	private @ResponseBody String categoryCheck(@ModelAttribute CategoryDTO dto) {
		return service.categoryCheck(dto);
	}

	@RequestMapping(value = "/goPointInsertForm")
	private ModelAndView goPointInsertForm(@ModelAttribute MemberDTO dto, @ModelAttribute PageDTO pdto) {
		mav();
		mav.addObject("memberInfo", service.memberInfo(dto));
		mav.addObject("MLEVEL", dto.getMLEVEL());
		mav.addObject("nowPage", pdto.getNowPage());
		mav.setViewName("admin/PointInsertForm");
		return mav;
	}

	@RequestMapping(value = "/pointInsert")
	private ModelAndView pointInsert(@ModelAttribute PointDTO dto, @ModelAttribute PageDTO pdto, @RequestParam("MLEVEL") int MLEVEL){
		mav();
		service.pointInsert(dto);
		mav.addObject("MLEVEL", MLEVEL);
		mav.addObject("nowPage", pdto.getNowPage());
		mav.setViewName("redirect:/goMemberList?MLEVEL="+MLEVEL);
		return mav;
	}
	
	@RequestMapping(value = "/goRefundList")
	private ModelAndView goRefundList() {
		mav();
		mav.addObject("refundList", service.refundList());
		mav.setViewName("admin/RefundList");
		return mav;
	}
	
	@RequestMapping(value = "/refundDetail")
	private ModelAndView refundDetail(@ModelAttribute OrdersDTO dto) {
		mav();
		mav.addObject("refundDetail", service.refundDetail(dto));
		mav.setViewName("admin/RefundDetail");
		return mav;
	}
	
	@RequestMapping(value = "/refundUpdate")
	private ModelAndView refundUpdate(@ModelAttribute OrdersDTO dto) {
		mav();	
		service.refundUpdate(dto);
		switch (dto.getOSTATE()) {
		case -1:
			mav.setViewName("redirect:/goRefundList");	
			break;
		case -2:
			mav.setViewName("redirect:goShoppingList?MID="+dto.getMID()+"&OSTATE=0");
			break;
		}
		return mav;
	}

	@RequestMapping(value = "/goSalesManagement")
	private ModelAndView goSalesManagement(@RequestParam("to") int to, @ModelAttribute OrdersDTO dto) {
		mav();
		List<ShoppingListDTO> salesList;
		String title = null;
		String result = null;
		int idx = 0;
		switch (to) {
			case 0:
				mav.addObject("ODATE", dto.getODATE());
				mav.addObject("yearList", service.yearList());
				salesList = service.monthlySalesList(dto);
				result = "['Month', '매출액'], ";
				for (ShoppingListDTO i : salesList) {
					result += "['"+ i.getODATE() +"', "+ i.getOAMOUNT() +"]";
					if(idx < salesList.size()-1) {
						result += ", ";
					}
					idx++;
				}
				title = "월별 매출";
				break;
			case 1:
				mav.addObject("ODATE", dto.getODATE());
				mav.addObject("yearList", service.yearList());
				salesList = service.yearlySalesList(dto);
				result = "['year', '매출액'], ";
				for (ShoppingListDTO i : salesList) {
					result += "['"+ i.getODATE() +"', "+ i.getOAMOUNT() +"]";
					if(idx < salesList.size()-1) {
						result += ", ";
					}
					idx++;
				}
				title = "년도별  매출";
				break;
			case 2:
				mav.addObject("ODATE", dto.getODATE());
				mav.addObject("yearList", service.yearList());
				salesList = service.packageSalesList(dto);
				result = "['패키지명', '매출액'], ";
				for (ShoppingListDTO i : salesList) {
					result += "['"+ i.getPNAME() +"', "+ i.getOAMOUNT() +"]";
					if(idx < salesList.size()-1) {
						result += ", ";
					}
					idx++;
				}
				title = "패키지별  매출";
				break;
			case 3:
				mav.addObject("ODATE", dto.getODATE());
				mav.addObject("yearList", service.yearList());
				salesList = service.categorySales(dto);
				result = "['패키지명', '매출액'], ";
				for (ShoppingListDTO i : salesList) {
					result += "['"+ i.getCNAME() +"', "+ i.getOAMOUNT() +"]";
					if(idx < salesList.size()-1) {
						result += ", ";
					}
					idx++;
				}
				title = "카테고리별  매출";
				break;
		}
		mav.addObject("to", to);
		mav.addObject("result", result);
		mav.addObject("title", title);
		mav.setViewName("admin/SalesManagement");
		return mav;
	}
}
