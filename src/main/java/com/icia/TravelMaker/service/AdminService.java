package com.icia.TravelMaker.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.TravelMaker.dao.AdminDAO;
import com.icia.TravelMaker.dto.AdminJobListDTO;
import com.icia.TravelMaker.dto.BoardCategoryDTO;
import com.icia.TravelMaker.dto.BoardComplaintDetailDTO;
import com.icia.TravelMaker.dto.BoardDTO;
import com.icia.TravelMaker.dto.BoardListDTO;
import com.icia.TravelMaker.dto.CategoryDTO;
import com.icia.TravelMaker.dto.CommentsComplaintDetailDTO;
import com.icia.TravelMaker.dto.CommentsDTO;
import com.icia.TravelMaker.dto.CommentsListDTO;
import com.icia.TravelMaker.dto.MemberDTO;
import com.icia.TravelMaker.dto.MemberListDTO;
import com.icia.TravelMaker.dto.MultiRowDTO;
import com.icia.TravelMaker.dto.OrdersDTO;
import com.icia.TravelMaker.dto.PackageCategoryDTO;
import com.icia.TravelMaker.dto.MemberInfoDTO;
import com.icia.TravelMaker.dto.PackageDTO;
import com.icia.TravelMaker.dto.PackageLocationDTO;
import com.icia.TravelMaker.dto.PackageScheduleDTO;
import com.icia.TravelMaker.dto.PageDTO;
import com.icia.TravelMaker.dto.PointDTO;
import com.icia.TravelMaker.dto.ReviewPostDTO;
import com.icia.TravelMaker.dto.ShoppingListDTO;
import com.icia.TravelMaker.dto.TravelerListDTO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO dao;
	
	public void boardCategoryInsert(BoardCategoryDTO dto) {
		dao.boardCategoryInsert(dto);
	}

	public List<BoardCategoryDTO> boardCategoryList() {
		return dao.boardCategoryList();
	}
	
	public void packageInsert(PackageDTO dto, HttpServletRequest request) throws IllegalStateException, IOException {
		if(!dto.getPIMGFILE().isEmpty()) {
			String oriFileName = dto.getPIMGFILE().getOriginalFilename();
			dto.setPIMG(UUID.randomUUID().toString() + oriFileName.substring(oriFileName.lastIndexOf(".")));
			dto.getPIMGFILE().transferTo(new File(request.getServletContext().getRealPath("/resources/upload/")+dto.getPIMG()));
		}else {
			dto.setPIMG("");
		}
		String temp = dto.getPINFO();
		String[] PINFO = new String[10];
		boolean flag = true;
		for(int i = 0; i<PINFO.length; i++) {
			if(flag) {
				if(temp.length() > 2000){
					PINFO[i] = temp.substring(0, 2000);
					temp = temp.substring(2000);
				}else {
					PINFO[i] = temp;
					flag = false;
				}
			}else {
				PINFO[i] = "";
			}
		}
		dto.setPINFO_1(PINFO[0]);
		dto.setPINFO_2(PINFO[1]);
		dto.setPINFO_3(PINFO[2]);
		dto.setPINFO_4(PINFO[3]);
		dto.setPINFO_5(PINFO[4]);
		dto.setPINFO_6(PINFO[5]);
		dto.setPINFO_7(PINFO[6]);
		dto.setPINFO_8(PINFO[7]);
		dto.setPINFO_9(PINFO[8]);
		dto.setPINFO_10(PINFO[9]);
		dao.packageInsert(dto); 
	}

	public void packageUpdate(PackageDTO dto) {
		String temp = dto.getPINFO();
		String[] PINFO = new String[10];
		boolean flag = true;
		for(int i = 0; i<PINFO.length; i++) {
			if(flag) {
				if(temp.length() > 2000){
					PINFO[i] = temp.substring(0, 2000);
					temp = temp.substring(2000);
				}else {
					PINFO[i] = temp;
					flag = false;
				}
			}else {
				PINFO[i] = "";
			}
		}
		dto.setPINFO_1(PINFO[0]);
		dto.setPINFO_2(PINFO[1]);
		dto.setPINFO_3(PINFO[2]);
		dto.setPINFO_4(PINFO[3]);
		dto.setPINFO_5(PINFO[4]);
		dto.setPINFO_6(PINFO[5]);
		dto.setPINFO_7(PINFO[6]);
		dto.setPINFO_8(PINFO[7]);
		dto.setPINFO_9(PINFO[8]);
		dto.setPINFO_10(PINFO[9]);
		dao.packageUpdate(dto);
	}

	public List<AdminJobListDTO> jobList(MemberDTO dto) {
		return dao.jobList(dto);
	}

	public List<CategoryDTO> categoryList() {
		return dao.categoryList();
	}

	public void categoryInsert(CategoryDTO dto) {
		dao.categoryInsert(dto);
	}

	public void jobListInsert(AdminJobListDTO dto) {
		dao.jobListInsert(dto);
	}

	public List<BoardListDTO> complaintBoardList(MemberDTO dto, PageDTO pdto) {
		pdto.calcPage(dao.complaintBoardCount(dto), 5, 10);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", pdto);
		map.put("member", dto);
		return dao.complaintBoardList(map);
	}

	public List<TravelerListDTO> travelerList(PageDTO pdto) {
		pdto.calcPage(dao.travelerCount(), 5, 10);
		return dao.travelerList(pdto);
	}

	public List<CommentsListDTO> complaintCommentsList(MemberDTO dto, PageDTO pdto) {
		pdto.calcPage(dao.complaintCommentsCount(dto), 5, 10);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", pdto);
		map.put("member", dto);
		return dao.complaintCommentsList(map);
	}

	public List<MemberListDTO> memberList(MemberDTO dto, PageDTO pdto) {
		pdto.calcPage(dao.memberCount(dto), 5, 20);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", pdto);
		map.put("member", dto);
		return dao.memberList(map);
	}

	public void memberStateUpdate(MemberDTO dto) {
		if(dao.memberStateUpdate(dto) == 1 && dto.getMSTATE() == -1) {
			dao.accountBanInsert(dto);
		}
	}

	public int commentsLock(CommentsDTO dto) {
		dto.setCMDATE(dto.getCMDATE().substring(0, 19));
		return dao.commentsLock(dto); 
	}

	public int boardLock(BoardDTO dto) {
		return dao.boardLock(dto);
	}

	public int reviewPostLock(ReviewPostDTO dto) {
		dto.setODATE(dto.getODATE().substring(0, 19));
		return dao.reviewPostLock(dto);
	}

	public int boardCategorylock(BoardCategoryDTO dto) {
		return dao.boardCategorylock(dto);
	}

	public PackageDTO packageDetail(PackageDTO dto) {
		return dao.packageDetail(dto);
	}

	public List<BoardComplaintDetailDTO> complaintBoardDetail(BoardDTO dto) {
		return dao.complaintBoardDetail(dto);
	}

	public List<CommentsComplaintDetailDTO> complaintCommentsDetail(CommentsDTO dto) {
		dto.setCMDATE(dto.getCMDATE().substring(0, 19));
		return dao.complaintCommentsDetail(dto);
	}

	public String boardCategoryCheck(BoardCategoryDTO dto) {
		return dao.boardCategoryCheck(dto);
	}

	public void boardCategoryUpdate(BoardCategoryDTO dto) {
		dao.boardCategoryUpdate(dto);
	}

	public void categoryUpdate(CategoryDTO dto) {
		dao.categoryUpdate(dto);
	}

	public String categoryCheck(CategoryDTO dto) {
		return dao.categoryCheck(dto);
	}

	public MemberInfoDTO memberInfo(MemberDTO dto) {
		return dao.memberInfo(dto);
	}

	public void pointInsert(PointDTO dto) {
		dao.pointInsert(dto);
	}

	public List<OrdersDTO> refundList() {
		return dao.refundList();
	}

	public OrdersDTO refundDetail(OrdersDTO dto) {
		dto.setODATE(dto.getODATE().substring(0, 19));
		return dao.refundDetail(dto);
	}

	public void refundUpdate(OrdersDTO dto) {
		dto.setODATE(dto.getODATE().substring(0, 19));
		dao.refundUpdate(dto);
	}

	public List<ShoppingListDTO> monthlySalesList(OrdersDTO dto) {
		return dao.monthlySalesList(dto);
	}

	public List<ShoppingListDTO> yearlySalesList(OrdersDTO dto) {
		return dao.yearlySalesList(dto);
	}

	public List<ShoppingListDTO> packageSalesList(OrdersDTO dto) {
		return dao.packageSalesList(dto);
	}

	public List<ShoppingListDTO> categorySales(OrdersDTO dto) {
		return dao.categorySales(dto);
	}

	public List<OrdersDTO> yearList() {
		return dao.yearList();
	}

	public void packageLocationInsert(PackageDTO dto, MultiRowDTO mrdto) {
		for (PackageLocationDTO i : mrdto.getPackageLocation()) {
			i.setPNUMBER(dto.getPNUMBER());
			dao.packageLocationInsert(i);
		}
	}

	public void packageScheduleInsert(PackageDTO dto, MultiRowDTO mrdto) {
		boolean flag = true;
		int idx = 0;
		for (PackageScheduleDTO i : mrdto.getPackageSchedule()) {
			for (int j = 0; j < idx; j++) {
				if(flag) {
					if(i.getPSSTART().equals(mrdto.getPackageSchedule().get(j).getPSSTART())) {
						flag = false;
						continue;
					}
				}
			}
			if(flag) {
				i.setPNUMBER(dto.getPNUMBER());
				dao.packageScheduleInsert(i);
			}
			flag = true;
			idx++;
		}
	}

	public void packageCategoryInsert(int[] CNUMBER, int PNUMBER) {
		for (int i : CNUMBER) {
			PackageCategoryDTO dto = new PackageCategoryDTO();
			dto.setCNUMBER(i);
			dto.setPNUMBER(PNUMBER);
			dao.packageCategoryInsert(dto);
		}
	}

}
