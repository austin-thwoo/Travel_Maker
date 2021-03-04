package com.icia.TravelMaker.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icia.TravelMaker.dao.SalesDAO;
import com.icia.TravelMaker.dto.CartListDTO;
import com.icia.TravelMaker.dto.LikeListDTO;
import com.icia.TravelMaker.dto.MemberDTO;
import com.icia.TravelMaker.dto.MultiRowDTO;
import com.icia.TravelMaker.dto.OrdersDTO;
import com.icia.TravelMaker.dto.PackageDTO;
import com.icia.TravelMaker.dto.PackageDetailDTO;
import com.icia.TravelMaker.dto.PackageLocationDTO;
import com.icia.TravelMaker.dto.PackageScheduleDTO;
import com.icia.TravelMaker.dto.PageDTO;
import com.icia.TravelMaker.dto.PointDTO;
import com.icia.TravelMaker.dto.ReviewDTO;
import com.icia.TravelMaker.dto.ReviewListDTO;
import com.icia.TravelMaker.dto.SearchDTO;
import com.icia.TravelMaker.dto.TravelerDTO;

@Service
public class SalesService {

	@Autowired
	private SalesDAO dao;

	public List<PackageDTO> packageList(PageDTO pdto) {
		pdto.calcPage(dao.packageListCount(), 5, 9);
		return dao.packageList(pdto);
	}

	public List<PackageDTO> packageList(PageDTO pdto, SearchDTO sdto) {
		Map<String, Object> map = new HashMap<String, Object>();
		pdto.calcPage(dao.packageListCount(sdto), 5, 9);
		map.put("page", pdto);
		map.put("search", sdto);
		return dao.packageList(map);
	}

	public PackageDetailDTO packageDetail(PackageDTO dto) {
		return dao.packageDetail(dto);
	}

	public List<PackageScheduleDTO> packageSchedule(PackageDTO dto) {
		return dao.packageSchedule(dto);
	}

	public List<ReviewListDTO> reviewList(PackageDTO dto) {
		return dao.reviewList(dto);
	}

	public PointDTO pointInfo(MemberDTO dto) {
		return dao.pointInfo(dto);
	}

	public void reviewInsert(ReviewDTO dto) {
		dto.setODATE(dao.ordersDate(dto).substring(0, 19));
		dao.reviewInsert(dto);
	}

	public int likeInsert(LikeListDTO dto) {
		return dao.likeInsert(dto);
	}

	public int likeDelete(LikeListDTO dto) {
		return dao.likeDelete(dto);
	}

	public int cartInsert(CartListDTO dto) {
		dto.setPSSTART(dto.getPSSTART().substring(0, 19));
		return dao.cartInsert(dto);
	}

	public int cartDelete(CartListDTO dto) {
		dto.setPSSTART(dto.getPSSTART().substring(0, 19));
		return dao.cartDelete(dto);
	}

	public void ordersInsert(OrdersDTO dto) {
		dto.setPSSTART(dto.getPSSTART().substring(0, 19));
		dao.ordersInsert(dto);
		if(dto.getOSTATE() == 1) {
			PackageDTO pdto = new PackageDTO();
			pdto.setPNUMBER(dto.getPNUMBER());
			PackageDetailDTO pddto = dao.packageDetail(pdto);
			if(dao.countOrders(dto) > (pddto.getPMIN()+(pddto.getPMAX()-pddto.getPMIN())/2)) {
				List<OrdersDTO> buyerList = dao.buyerList(dto);
				MailSendService msService = new MailSendService();
				for (OrdersDTO i : buyerList) {
					msService.sendAlarm(i);
				}
			}
		}
	}

	public void travelerInsert(OrdersDTO dto, MultiRowDTO traveler) {
		dto.setODATE(dto.getODATE().substring(0, 19));
		for (TravelerDTO i : traveler.getTravelers()) {
			i.setOMID(dto.getMID());
			i.setODATE(dto.getODATE());
			i.setOPNUMBER(dto.getPNUMBER());
			dao.travelerInsert(i);
		}
	}

	public void pointInsert(PointDTO dto) {
		dto.setODATE(dto.getODATE().substring(0, 19));
		dao.pointInsert(dto);
	}

	public void balanceUpdate(OrdersDTO dto) {
		dto.setODATE(dto.getODATE().substring(0, 19));
		dao.balanceUpdate(dto);
	}

	public List<PackageLocationDTO> packageLocation(PackageDTO dto) {
		return dao.packageLocation(dto);
	}

	public int reviewCheck(PackageDTO dto, MemberDTO mdto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member", mdto);
		map.put("package", dto);
		return dao.reviewCheck(map);
	}

	public int likeCheck(PackageDTO dto, MemberDTO mdto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member", mdto);
		map.put("package", dto);
		return dao.likeCheck(map);
	}

}
