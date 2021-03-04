package com.icia.TravelMaker.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.TravelMaker.dto.CartListDTO;
import com.icia.TravelMaker.dto.CategoryDTO;
import com.icia.TravelMaker.dto.CommentsListDTO;
import com.icia.TravelMaker.dto.LikeListDTO;
import com.icia.TravelMaker.dto.MemberDTO;
import com.icia.TravelMaker.dto.MemberInfoDTO;
import com.icia.TravelMaker.dto.MemberPreferenceDTO;
import com.icia.TravelMaker.dto.OrdersDTO;
import com.icia.TravelMaker.dto.PointDTO;
import com.icia.TravelMaker.dto.ReviewListDTO;
import com.icia.TravelMaker.dto.ReviewPostDTO;
import com.icia.TravelMaker.dto.ShoppingListDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public MemberDTO login(MemberDTO dto) {
		return sql.selectOne("Member.login", dto);
	}

	public void accessInsert(MemberDTO dto) {
		sql.insert("Member.accessInsert", dto);
	}

	public MemberInfoDTO myPage(MemberDTO dto) {
		return sql.selectOne("Member.myPage", dto);
	}

	public String idCheck(MemberDTO dto) {
		return sql.selectOne("Member.idCheck", dto);
	}

	public String nickCheck(MemberDTO dto) {
		return sql.selectOne("Member.nickCheck", dto);
	}

	public int memberJoin(MemberDTO dto) {
		return sql.insert("Member.memberJoin", dto);
	}

	public List<CategoryDTO> preferenceList(MemberDTO dto) {
		return sql.selectList("Member.preferenceList", dto);
	}

	public int cartCount(MemberDTO dto) {
		return sql.selectOne("Member.cartCount", dto);
	}

	public List<CartListDTO> cartList(Map<String, Object> map) {
		return sql.selectList("Member.cartList", map);
	}

	public int likeCount(MemberDTO dto) {
		return sql.selectOne("Member.likeCount", dto);
	}

	public List<LikeListDTO> likeList(Map<String, Object> map) {
		return sql.selectList("Member.likeList", map);
	}

	public List<PointDTO> pointHistory(Map<String, Object> map) {
		return sql.selectList("Member.pointHistory", map);
	}

	public List<ShoppingListDTO> shoppingList(Map<String, Object> map) {
		return sql.selectList("Member.shoppingList", map);
	}

	public String passwordCheck(MemberDTO dto) {
		return sql.selectOne("Member.passwordCheck", dto);
	}

	public void passwordUpdate(MemberDTO dto) {
		sql.update("Member.passwordUpdate", dto);
	}

	public MemberDTO memberInfo(MemberDTO dto) {
		return sql.selectOne("Member.memberInfo", dto);
	}

	public void memberUpdate(MemberDTO dto) {
		sql.update("Member.memberUpdate", dto);
	}

	public List<CommentsListDTO> myCommentsList(Map<String, Object> map) {
		return sql.selectList("Member.myCommentsList", map);
	}

	public List<ReviewListDTO> myReviewList(MemberDTO dto) {
		return sql.selectList("Member.myReviewList", dto);
	}

	public void authKeyUpdate(MemberDTO dto) {
		sql.update("Member.authKeyUpdate", dto);
	}

	public void joinConfirm(MemberDTO dto) {
		sql.selectOne("Member.joinConfirm", dto);
	}

	public String idSearch(MemberDTO dto) {
		return sql.selectOne("Member.idSearch", dto);
	}

	public List<CategoryDTO> categoryList() {
		return sql.selectList("Admin.categoryList");
	}

	public void preferenceInsert(MemberPreferenceDTO dto) {
		sql.insert("Member.preferenceInsert", dto);
	}

	public List<CategoryDTO> otherCategoryList(MemberDTO dto) {
		return sql.selectList("Member.otherCategoryList", dto);
	}

	public void preferenceDelete(MemberPreferenceDTO dto) {
		sql.delete("Member.preferenceDelete", dto);
	}

	public List<ReviewPostDTO> reviewPostList(Map<String, Object> map) {
		return sql.selectList("Board.reviewPostList", map);
	}

	public void memberDelete(MemberDTO dto) {
		sql.selectOne("Member.memberDelete", dto);
	}

	public int pointHistoryCount(MemberDTO dto) {
		return sql.selectOne("Member.pointHistoryCount", dto);
	}

	public int myCommentsListCount(MemberDTO dto) {
		return sql.selectOne("Member.myCommentsListCount", dto);
	}

	public int shoppingListCount(OrdersDTO dto) {
		return sql.selectOne("Member.shoppingListCount", dto);
	}

}
