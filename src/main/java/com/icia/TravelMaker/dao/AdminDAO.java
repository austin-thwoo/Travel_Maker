package com.icia.TravelMaker.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
import com.icia.TravelMaker.dto.MemberInfoDTO;
import com.icia.TravelMaker.dto.MemberListDTO;
import com.icia.TravelMaker.dto.OrdersDTO;
import com.icia.TravelMaker.dto.PackageCategoryDTO;
import com.icia.TravelMaker.dto.PackageDTO;
import com.icia.TravelMaker.dto.PackageLocationDTO;
import com.icia.TravelMaker.dto.PackageScheduleDTO;
import com.icia.TravelMaker.dto.PageDTO;
import com.icia.TravelMaker.dto.PointDTO;
import com.icia.TravelMaker.dto.ReviewPostDTO;
import com.icia.TravelMaker.dto.ShoppingListDTO;
import com.icia.TravelMaker.dto.TravelerListDTO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public void boardCategoryInsert(BoardCategoryDTO dto) {
		sql.insert("Admin.boardCategoryInsert", dto);
	}

	public List<BoardCategoryDTO> boardCategoryList() {
		return sql.selectList("Admin.boardCategoryList");
	}
	
	public void packageInsert(PackageDTO dto) {
		sql.selectOne("Admin.packageInsert", dto);
	}

	public List<AdminJobListDTO> jobList(MemberDTO dto) {
		return sql.selectList("Admin.adminJobList", dto);
	}

	public List<CategoryDTO> categoryList() {
		return sql.selectList("Admin.categoryList");
	}

	public void categoryInsert(CategoryDTO dto) {
		sql.insert("Admin.categoryInsert", dto);
	}

	public void jobListInsert(AdminJobListDTO dto) {
		sql.insert("Admin.jobListInsert", dto);
	}

	public List<BoardListDTO> complaintBoardList(Map<String, Object> map) {
		return sql.selectList("Admin.complaintBoardList", map);
	}

	public int travelerCount() {
		return sql.selectOne("Admin.travelerCount");
	}

	public List<TravelerListDTO> travelerList(PageDTO pdto) {
		return sql.selectList("Admin.travelerList", pdto);
	}

	public List<CommentsListDTO> complaintCommentsList(Map<String, Object> map) {
		return sql.selectList("Admin.complaintCommentsList", map);
	}

	public List<MemberListDTO> memberList(Map<String, Object> map) {
		return sql.selectList("Admin.memberList", map);
	}

	public int memberStateUpdate(MemberDTO dto) {
		return sql.update("Admin.memberStateUpdate", dto);
	}

	public int commentsLock(CommentsDTO dto) {
		return sql.update("Admin.commentsLock", dto);
	}

	public int boardLock(BoardDTO dto) {
		return sql.update("Admin.boardLock", dto);
	}

	public int reviewPostLock(ReviewPostDTO dto) {
		return sql.update("Admin.reviewPostLock", dto);
	}

	public int boardCategorylock(BoardCategoryDTO dto) {
		return sql.update("Admin.boardCategorylock", dto);
	}

	public PackageDTO packageDetail(PackageDTO dto) {
		return sql.selectOne("Admin.packageDetail", dto);
	}

	public void packageUpdate(PackageDTO dto) {
		sql.update("Admin.packageUpdate", dto);
	}

	public void accountBanInsert(MemberDTO dto) {
		sql.insert("Admin.accountBanInsert", dto);
	}

	public List<BoardComplaintDetailDTO> complaintBoardDetail(BoardDTO dto) {
		return sql.selectList("Admin.complaintBoardDetail", dto);
	}

	public List<CommentsComplaintDetailDTO> complaintCommentsDetail(CommentsDTO dto) {
		return sql.selectList("Admin.complaintCommentsDetail", dto);
	}

	public String boardCategoryCheck(BoardCategoryDTO dto) {
		return sql.selectOne("Admin.boardCategoryCheck", dto);
	}

	public void boardCategoryUpdate(BoardCategoryDTO dto) {
		sql.update("Admin.boardCategoryUpdate", dto);
	}

	public void categoryUpdate(CategoryDTO dto) {
		sql.update("Admin.categoryUpdate", dto);
	}

	public String categoryCheck(CategoryDTO dto) {
		return sql.selectOne("Admin.categoryCheck", dto);
	}

	public MemberInfoDTO memberInfo(MemberDTO dto) {
		return sql.selectOne("Admin.memberInfo", dto);
	}

	public void pointInsert(PointDTO dto) {
		sql.insert("Admin.pointInsert", dto);
	}

	public List<OrdersDTO> refundList() {
		return sql.selectList("Admin.refundList");
	}

	public OrdersDTO refundDetail(OrdersDTO dto) {
		return sql.selectOne("Admin.refundDetail", dto);
	}

	public void refundUpdate(OrdersDTO dto) {
		sql.update("Admin.refundUpdate", dto);
	}

	public List<ShoppingListDTO> monthlySalesList(OrdersDTO dto) {
		return sql.selectList("Admin.monthlySalesList", dto);
	}

	public List<ShoppingListDTO> yearlySalesList(OrdersDTO dto) {
		return sql.selectList("Admin.yearlySalesList", dto);
	}

	public List<ShoppingListDTO> packageSalesList(OrdersDTO dto) {
		return sql.selectList("Admin.packageSalesList", dto);
	}

	public List<ShoppingListDTO> categorySales(OrdersDTO dto) {
		return sql.selectList("Admin.categorySales", dto);
	}

	public List<OrdersDTO> yearList() {
		return sql.selectList("Admin.yearList");
	}

	public void packageLocationInsert(PackageLocationDTO dto) {
		sql.insert("Admin.packageLocationInsert", dto);
	}

	public void packageScheduleInsert(PackageScheduleDTO dto) {
		sql.insert("Admin.packageScheduleInsert", dto);
	}

	public void packageCategoryInsert(PackageCategoryDTO dto) {
		sql.insert("Admin.packageCategoryInsert", dto);
	}

	public int complaintBoardCount(MemberDTO dto) {
		return sql.selectOne("Admin.complaintBoardCount", dto);
	}

	public int complaintCommentsCount(MemberDTO dto) {
		return sql.selectOne("Admin.complaintCommentsCount", dto);
	}

	public int memberCount(MemberDTO dto) {
		return sql.selectOne("Admin.memberCount", dto);
	}

}
