package com.icia.TravelMaker.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.TravelMaker.dao.HomeDAO;
import com.icia.TravelMaker.dto.MemberDTO;
import com.icia.TravelMaker.dto.PackageDTO;
import com.icia.TravelMaker.dto.ReviewPostDTO;

@Service
public class HomeService {

	@Autowired
	private HomeDAO dao;
	
	public List<PackageDTO> bestOrderList() {
		return dao.bestOrderList();
	}

	public List<PackageDTO> preferOrderList(MemberDTO dto) {
		return dao.preferOrderList(dto);
	}

	public List<PackageDTO> likeOrderList(MemberDTO dto) {
		return dao.likeOrderList(dto);
	}

	public List<PackageDTO> sameLikeOrderList(MemberDTO dto) {
		return dao.sameLikeOrderList(dto);
	}

	public List<PackageDTO> sameOrderList(MemberDTO dto) {
		return dao.sameOrderList(dto);
	}

	public List<PackageDTO> bestLikeList() {
		return dao.bestLikeList();
	}

	public List<ReviewPostDTO> ReviewPost() {
		return dao.ReviewPost();
	}

}
