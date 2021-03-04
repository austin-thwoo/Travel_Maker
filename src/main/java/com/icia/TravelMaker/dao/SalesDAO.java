package com.icia.TravelMaker.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.TravelMaker.dto.CartListDTO;
import com.icia.TravelMaker.dto.LikeListDTO;
import com.icia.TravelMaker.dto.MemberDTO;
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

@Repository
public class SalesDAO {

	@Autowired
	private SqlSessionTemplate sql;

	public int packageListCount() {
		return sql.selectOne("Sales.packageListCount");
	}

	public List<PackageDTO> packageList(PageDTO pdto) {
		return sql.selectList("Sales.packageList", pdto);
	}

	public int packageListCount(SearchDTO sdto) {
		return sql.selectOne("Sales.searchPackageListCount", sdto);
	}

	public List<PackageDTO> packageList(Map<String, Object> map) {
		return sql.selectList("Sales.searchPackageList", map);
	}

	public PackageDetailDTO packageDetail(PackageDTO dto) {
		return sql.selectOne("Sales.packageDetail", dto);
	}

	public List<PackageScheduleDTO> packageSchedule(PackageDTO dto) {
		return sql.selectList("Sales.packageSchedule", dto);
	}

	public List<ReviewListDTO> reviewList(PackageDTO dto) {
		return sql.selectList("Sales.reviewList", dto);
	}

	public PointDTO pointInfo(MemberDTO dto) {
		return sql.selectOne("Sales.pointInfo", dto);
	}

	public void reviewInsert(ReviewDTO dto) {
		sql.insert("Sales.reviewInsert", dto);
	}

	public int likeInsert(LikeListDTO dto) {
		return sql.insert("Sales.likeInsert", dto);
	}

	public int likeDelete(LikeListDTO dto) {
		return sql.delete("Sales.likeDelete", dto);
	}

	public int cartInsert(CartListDTO dto) {
		return sql.insert("Sales.cartInsert", dto);
	}

	public int cartDelete(CartListDTO dto) {
		return sql.delete("Sales.cartDelete", dto);
	}

	public void ordersInsert(OrdersDTO dto) {
		sql.selectOne("Sales.ordersInsert", dto);
	}

	public void travelerInsert(TravelerDTO i) {
		sql.insert("Sales.travelerInsert", i);
	}

	public void pointInsert(PointDTO dto) {
		sql.insert("Sales.pointInsert", dto);
	}

	public int countOrders(OrdersDTO dto) {
		return sql.selectOne("Sales.countOrders", dto);
	}

	public List<OrdersDTO> buyerList(OrdersDTO dto) {
		return sql.selectList("Sales.buyerList", dto);
	}

	public void balanceUpdate(OrdersDTO dto) {
		sql.update("Sales.balanceUpdate", dto);
	}

	public List<PackageLocationDTO> packageLocation(PackageDTO dto) {
		return sql.selectList("Sales.packageLocation", dto);
	}

	public int reviewCheck(Map<String, Object> map) {
		return sql.selectOne("Sales.reviewCheck", map);
	}

	public int likeCheck(Map<String, Object> map) {
		return sql.selectOne("Sales.likeCheck", map);
	}

	public String ordersDate(ReviewDTO dto) {
		return sql.selectOne("Sales.ordersDate", dto);
	}

}
