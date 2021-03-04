package com.icia.TravelMaker.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.TravelMaker.dao.MemberDAO;
import com.icia.TravelMaker.dto.BoardListDTO;
import com.icia.TravelMaker.dto.CartListDTO;
import com.icia.TravelMaker.dto.CategoryDTO;
import com.icia.TravelMaker.dto.CommentsListDTO;
import com.icia.TravelMaker.dto.LikeListDTO;
import com.icia.TravelMaker.dto.MemberDTO;
import com.icia.TravelMaker.dto.MemberInfoDTO;
import com.icia.TravelMaker.dto.MemberPreferenceDTO;
import com.icia.TravelMaker.dto.OrdersDTO;
import com.icia.TravelMaker.dto.PageDTO;
import com.icia.TravelMaker.dto.PointDTO;
import com.icia.TravelMaker.dto.ReviewListDTO;
import com.icia.TravelMaker.dto.ShoppingListDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;
	
	public MemberDTO login(MemberDTO dto) {
		MemberDTO result = dao.login(dto);
		if(result != null) {
			dao.accessInsert(dto);
		}
		return result;
	}

	public MemberInfoDTO myPage(MemberDTO dto) {
		return dao.myPage(dto);
	}

	public String idCheck(MemberDTO dto) {
		return dao.idCheck(dto);
	}

	public String nickCheck(MemberDTO dto) {
		return dao.nickCheck(dto);
	}

	public int memberJoin(MemberDTO dto) {
		return dao.memberJoin(dto);
	}

	public List<CategoryDTO> preferenceList(MemberDTO dto) {
		return dao.preferenceList(dto);
	}

	public List<CartListDTO> cartList(MemberDTO dto, PageDTO pdto) {
		Map<String, Object> map = new HashMap<String, Object>();
		pdto.calcPage(dao.cartCount(dto), 5, 10);
		map.put("member", dto);
		map.put("page", pdto);
		return dao.cartList(map);
	}

	public List<LikeListDTO> likeList(MemberDTO dto, PageDTO pdto) {
		Map<String, Object> map = new HashMap<String, Object>();
		pdto.calcPage(dao.likeCount(dto), 5, 9);
		map.put("member", dto);
		map.put("page", pdto);
		return dao.likeList(map);
	}

	public List<PointDTO> pointHistory(MemberDTO dto, PageDTO pdto) {
		Map<String, Object> map = new HashMap<String, Object>();
		pdto.calcPage(dao.pointHistoryCount(dto), 5, 10);
		map.put("member", dto);
		map.put("page", pdto);
		return dao.pointHistory(map);
	}

	public List<ShoppingListDTO> shoppingList(OrdersDTO dto, PageDTO pdto) {
		Map<String, Object> map = new HashMap<String, Object>();
		pdto.calcPage(dao.shoppingListCount(dto), 5, 10);
		map.put("orders", dto);
		map.put("page", pdto);
		return dao.shoppingList(map);
	}

	public String passwordCheck(MemberDTO dto) {
		return dao.passwordCheck(dto);
	}

	public void passwordUpdate(MemberDTO dto) {
		dao.passwordUpdate(dto);
	}

	public MemberDTO memberInfo(MemberDTO dto) {
		return dao.memberInfo(dto);
	}

	public void memberUpdate(MemberDTO dto) {
		dao.memberUpdate(dto);
	}

	public List<CommentsListDTO> myCommentsList(MemberDTO dto, PageDTO pdto) {
		Map<String, Object> map = new HashMap<String, Object>();
		pdto.calcPage(dao.myCommentsListCount(dto), 5, 10);
		map.put("member", dto);
		map.put("page", pdto);
		return dao.myCommentsList(map);
	}

	public List<ReviewListDTO> myReviewList(MemberDTO dto) {
		return dao.myReviewList(dto);
	}

	public void authKeyUpdate(MemberDTO dto) {
		dao.authKeyUpdate(dto);
	}

	public void joinConefirm(MemberDTO dto) {
		dao.joinConfirm(dto);
		dto.setAUTHKEY(null);
		dto.setMSTATE(0);
	}

	public String idSearch(MemberDTO dto) {
		String result = dao.idSearch(dto);
		String temp = "";
		if(result != null) {
			if(result.indexOf("@")%2 == 0) {
				temp += result.substring(0, result.indexOf("@")/2);
				for (int i = 0; i < result.substring(result.indexOf("@")/2, result.indexOf("@")).length(); i++) {
					temp += "*";
				}
				temp += result.substring(result.indexOf("@"));
			}else {
				temp += result.substring(0, (result.indexOf("@")/2-1));
				for (int i = 0; i < result.substring((result.indexOf("@")/2-1), result.indexOf("@")).length(); i++) {
					temp += "*";
				}
				temp += result.substring(result.indexOf("@"));
			}
			result = temp;
		}
		return result;
	}

	public List<CategoryDTO> categoryList() {
		return dao.categoryList();
	}

	public void preferenceInsert(int[] CNUMBER, String MID) {
		for (int i : CNUMBER) {
			MemberPreferenceDTO dto = new MemberPreferenceDTO();
			dto.setMID(MID);
			dto.setCNUMBER(i);
			dao.preferenceInsert(dto);
		}
	}

	public List<CategoryDTO> otherCategoryList(MemberDTO dto) {
		return dao.otherCategoryList(dto);
	}

	public void preferenceDelete(int[] CNUMBER, String MID) {
		for (int i : CNUMBER) {
			MemberPreferenceDTO dto = new MemberPreferenceDTO();
			dto.setMID(MID);
			dto.setCNUMBER(i);
			dao.preferenceDelete(dto);
		}
	}

	public void memberDelete(MemberDTO dto) {
		dao.memberDelete(dto);
	}

}
