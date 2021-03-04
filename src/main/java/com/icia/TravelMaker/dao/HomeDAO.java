package com.icia.TravelMaker.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.TravelMaker.dto.MemberDTO;
import com.icia.TravelMaker.dto.PackageDTO;
import com.icia.TravelMaker.dto.ReviewPostDTO;

@Repository
public class HomeDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public List<PackageDTO> bestOrderList() {
		return sql.selectList("Home.bestOrderList");
	}

	public List<PackageDTO> preferOrderList(MemberDTO dto) {
		return sql.selectList("Home.preferOrderList", dto);
	}

	public List<PackageDTO> likeOrderList(MemberDTO dto) {
		return sql.selectList("Home.likeOrderList", dto);
	}

	public List<PackageDTO> sameLikeOrderList(MemberDTO dto) {
		return sql.selectList("Home.sameLikeOrderList", dto);
	}

	public List<PackageDTO> sameOrderList(MemberDTO dto) {
		return sql.selectList("Home.sameOrderList", dto);
	}

	public List<PackageDTO> bestLikeList() {
		return sql.selectList("Home.bestLikeList");
	}

	public List<ReviewPostDTO> ReviewPost() {
		return sql.selectList("Home.ReviewPost");
	}

}
