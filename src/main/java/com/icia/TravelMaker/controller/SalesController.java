package com.icia.TravelMaker.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.TravelMaker.dto.CartListDTO;
import com.icia.TravelMaker.dto.LikeListDTO;
import com.icia.TravelMaker.dto.MemberDTO;
import com.icia.TravelMaker.dto.MultiRowDTO;
import com.icia.TravelMaker.dto.OrdersDTO;
import com.icia.TravelMaker.dto.PackageDTO;
import com.icia.TravelMaker.dto.PackageLocationDTO;
import com.icia.TravelMaker.dto.PackageScheduleDTO;
import com.icia.TravelMaker.dto.PageDTO;
import com.icia.TravelMaker.dto.PointDTO;
import com.icia.TravelMaker.dto.ReviewDTO;
import com.icia.TravelMaker.dto.SearchDTO;
import com.icia.TravelMaker.service.SalesService;

@Controller
public class SalesController {

	@Autowired
	private SalesService service;
	private ModelAndView mav;
	
	private void mav() {
		if(mav == null) {
			mav = new ModelAndView();
		}
	}

	@RequestMapping(value = "/goPackageList")
	private ModelAndView goPackageList(@RequestParam("to") String to, @ModelAttribute PageDTO pdto, @ModelAttribute SearchDTO sdto) {
		mav();
		if(to.equals("search")) {
			mav.addObject("packageList", service.packageList(pdto, sdto));
			mav.setViewName("sales/PackageList");
		}else {
			mav.addObject("packageList", service.packageList(pdto));
			mav.setViewName(to + "/PackageList");	
		}
		mav.addObject("to", to);
		mav.addObject("search", sdto);
		mav.addObject("page", pdto);
		return mav;
	}

	@RequestMapping(value = "/goPackageDetail")
	private ModelAndView goPackageDetail(@ModelAttribute PackageDTO dto, @ModelAttribute MemberDTO mdto) {
		mav();
		mav.addObject("packageDetail", service.packageDetail(dto));
		mav.addObject("packageSchedule", service.packageSchedule(dto));
		mav.addObject("reviewList", service.reviewList(dto));
		if(!mdto.getMID().equals("")) {
			mav.addObject("likeCheck", service.likeCheck(dto, mdto));
			mav.addObject("reviewCheck", service.reviewCheck(dto, mdto));
		}else {
			mav.addObject("reviewCheck", 0);
		}
		List<PackageLocationDTO> packageLocation = service.packageLocation(dto);
		mav.addObject("packageLocation", packageLocation);
		int i = 1;
		String center = null;
		String locations = "[";
		for (PackageLocationDTO j : packageLocation) {
			if(i == 1) {
				center = "{ lat: "+j.getPLOLAT()+", lng: "+j.getPLOLNG()+" }";
			}
			locations += "[\""+j.getPLONAME()+"\", "+j.getPLOLAT()+", "+j.getPLOLNG()+", "+i+"],";
			i++;
		}
		locations += "]";
		mav.addObject("locations", locations);
		mav.addObject("center", center);
		mav.setViewName("sales/PackageDetail");
		return mav;
	}
	
	@RequestMapping(value = "/goSaleForm")
	private ModelAndView goSaleForm(@ModelAttribute OrdersDTO dto) {
		mav();
		mav.addObject("ordersInfo", dto);
		PackageDTO pdto = new PackageDTO();
		pdto.setPNUMBER(dto.getPNUMBER());
		mav.addObject("packageDetail", service.packageDetail(pdto));
		for(PackageScheduleDTO i : service.packageSchedule(pdto)) {
			if(i.getPNUMBER() == dto.getPNUMBER() && i.getPSSTART().equals(dto.getPSSTART())) {
				mav.addObject("packageSchedule", i);
			}
		}
		MemberDTO mdto = new MemberDTO();
		mdto.setMID(dto.getMID());
		mav.addObject("pointInfo", service.pointInfo(mdto));
		mav.setViewName("sales/SaleForm");
		return mav;
	}
	
	@RequestMapping(value="reviewInsert")
	private ModelAndView reviewInsert(@ModelAttribute ReviewDTO dto){
		mav();
		service.reviewInsert(dto);
		mav.addObject("PNUMBER", dto.getOPNUMBER());
		mav.addObject("MID", dto.getOMID());
		mav.setViewName("redirect:/goPackageDetail");
		return mav;
	}
	
	@RequestMapping(value = "/likeInsert")
	private @ResponseBody int likeInsert(@ModelAttribute LikeListDTO dto) {
		mav();
		return service.likeInsert(dto);
	}
	
	@RequestMapping(value = "/likeDelete")
	private @ResponseBody int likeDelete(@ModelAttribute LikeListDTO dto) {
		mav();
		return service.likeDelete(dto);
	}
	
	@RequestMapping(value = "/cartInsert")
	private @ResponseBody int cartInsert(@ModelAttribute CartListDTO dto) {
		mav();
		return service.cartInsert(dto);
	}
	
	@RequestMapping(value = "/cartDelete")
	private @ResponseBody int cartDelete(@ModelAttribute CartListDTO dto) {
		mav();
		return service.cartDelete(dto);
	}

	@RequestMapping(value = "/goPayApi")
	public ModelAndView goPayApi(@ModelAttribute OrdersDTO dto, @RequestParam("pay") int pay) {
		mav();
		mav.addObject("orders", dto);
		mav.addObject("pay", pay);
		mav.setViewName("sales/PayApi");
		return mav;
	}
	
	@RequestMapping(value="ordersInsert")
	private ModelAndView ordersInsert(@ModelAttribute OrdersDTO dto, @ModelAttribute MultiRowDTO traveler, @RequestParam(value = "POAMOUNT", required = false, defaultValue = "0") int POAMOUNT){
		mav();
		service.ordersInsert(dto);
		service.travelerInsert(dto, traveler);
		PointDTO pdto = new PointDTO();
		pdto.setMID(dto.getMID());
		pdto.setOPNUMBER(dto.getPNUMBER());
		pdto.setODATE(dto.getODATE());
		if(POAMOUNT > 0) {
			pdto.setPOAMOUNT(POAMOUNT);
			pdto.setPOSTATE(-1);
			if(dto.getOSTATE() == 1) {
				pdto.setPOINFO(dto.getPNAME()+"계약금 결재 사용");	
			}else {
				pdto.setPOINFO(dto.getPNAME()+"전액 결재 사용");
			}
			service.pointInsert(pdto);
		}else {
			if(dto.getOSTATE() == 2) {
			pdto.setPOAMOUNT((int)((double)dto.getOAMOUNT()*0.01));
			pdto.setPOSTATE(1);
			pdto.setPOINFO(dto.getPNAME()+"전액 결재 적립");
			service.pointInsert(pdto);
			}
		}
		mav.addObject("MID", dto.getMID());
		mav.addObject("nowPage", 1);
		if(dto.getOSTATE() == 1) {
			mav.addObject("OSTATE", dto.getOSTATE());
			mav.setViewName("redirect:/goShoppingList");	
		}else {
			mav.addObject("OSTATE", 0);
			mav.setViewName("redirect:/goShoppingList");
		}
		return mav;
	}

	@RequestMapping(value = "balanceUpdate")
	private ModelAndView balanceUpdate(@ModelAttribute OrdersDTO dto) {
		mav();
		service.balanceUpdate(dto);
		mav.setViewName("redirect:/goShoppingList?MID="+dto.getMID()+"&OSTATE=0");
		return mav;
	}
}
