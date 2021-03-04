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

import com.icia.TravelMaker.dao.BoardDAO;
import com.icia.TravelMaker.dto.BoardCategoryDTO;
import com.icia.TravelMaker.dto.BoardComplaintDTO;
import com.icia.TravelMaker.dto.BoardDTO;
import com.icia.TravelMaker.dto.BoardDetailDTO;
import com.icia.TravelMaker.dto.BoardLikeDTO;
import com.icia.TravelMaker.dto.BoardListDTO;
import com.icia.TravelMaker.dto.CommentsComplaintDTO;
import com.icia.TravelMaker.dto.CommentsDTO;
import com.icia.TravelMaker.dto.CommentsLikeDTO;
import com.icia.TravelMaker.dto.CommentsListDTO;
import com.icia.TravelMaker.dto.MemberDTO;
import com.icia.TravelMaker.dto.PageDTO;
import com.icia.TravelMaker.dto.ReviewPostDTO;
import com.icia.TravelMaker.dto.ReviewPostDetailDTO;
import com.icia.TravelMaker.dto.SearchDTO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO dao;
	
	public int boardInsert(BoardDTO dto){
		return dao.boardInsert(dto);
	}

	public List<BoardListDTO> boardList(BoardDTO dto, PageDTO pdto, String order) {
		Map<String, Object> map = new HashMap<String, Object>();
		pdto.calcPage(dao.boardListCount(dto), 5, 10);
		map.put("board", dto);
		map.put("page", pdto);
		map.put("order", order);
		return dao.boardList(map);
	}

	public List<BoardListDTO> boardList(BoardDTO dto, PageDTO pdto, SearchDTO sdto, String order) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board", dto);
		map.put("search", sdto);
		pdto.calcPage(dao.boardListCount(map), 5, 10);
		map.put("page", pdto);
		map.put("order", order);
		return dao.searchBoardList(map);
	}

	public List<BoardListDTO> myBoardList(BoardDTO dto, PageDTO pdto, String order) {
		Map<String, Object> map = new HashMap<String, Object>();
		pdto.calcPage(dao.myBoardListCount(dto), 5, 10);
		map.put("page", pdto);
		map.put("board", dto);
		map.put("order", order);
		return dao.myBoardList(map);
	}

	public List<BoardListDTO> myBoardList(BoardDTO dto, PageDTO pdto, SearchDTO sdto, String order) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board", dto);
		map.put("search", sdto);
		pdto.calcPage(dao.myBoardListCount(map), 5, 10);
		map.put("page", pdto);
		map.put("order", order);
		return dao.searchMyBoardList(map);
	}

	public BoardCategoryDTO boardCategory(BoardDTO dto) {
		return dao.boardCategory(dto);
	}

	public BoardDetailDTO boardDetail(BoardDTO dto) {
		return dao.boardDetail(dto);
	}

	public List<CommentsListDTO> commentsList(BoardDTO dto) {
		return dao.commentsList(dto);
	}

	public void commentsInsert(CommentsDTO dto) {
		dao.commentsInsert(dto);
	}

	public List<BoardCategoryDTO> boardCategoryList() {
		return dao.boardCategoryList();
	}

	public int boardUpdate(BoardDTO dto) {
		return dao.boardUpdate(dto);
	}

	public void boardComplaintInsert(BoardComplaintDTO dto) {
		dao.boardComplaintInsert(dto);
	}

	public void commentsComplaintInsert(CommentsComplaintDTO dto) {
		dto.setCMDATE(dto.getCMDATE().substring(0, 19));
		dao.commentsComplaintInsert(dto);
	}

	public int boardLike(BoardDTO dto) {
		return dao.boardLike(dto);
	}

	public List<CommentsLikeDTO> commentsLike(BoardDTO dto) {
		return dao.commentsLike(dto);
	}

	public int boardLikeInsert(BoardLikeDTO dto) {
		dao.boardLikeInsert(dto);
		BoardDTO bdto = new BoardDTO();
		bdto.setBNUMBER(dto.getBNUMBER());
		return dao.boardDetail(bdto).getBOARDLIKE();
	}

	public int boardLikeDelete(BoardLikeDTO dto) {
		dao.boardLikeDelete(dto);
		BoardDTO bdto = new BoardDTO();
		bdto.setBNUMBER(dto.getBNUMBER());
		return dao.boardDetail(bdto).getBOARDLIKE();
	}

	public void boardViewsInsert(BoardDTO dto) {
		dao.boardViewsInsert(dto);
	}

	public int commentsLikeInsert(CommentsLikeDTO dto) {
		dto.setCMDATE(dto.getCMDATE().substring(0, 19));
		dao.commentsLikeInsert(dto);
		return dao.commentsLikeResult(dto);
	}

	public int commentsLikeDelete(CommentsLikeDTO dto) {
		dto.setCMDATE(dto.getCMDATE().substring(0, 19));
		dao.commentsLikeDelete(dto);
		return dao.commentsLikeResult(dto);
	}

	public int reviewPostInsert(ReviewPostDTO dto, HttpServletRequest request) throws IllegalStateException, IOException {
		dto.setODATE(dto.getODATE().substring(0, 19));
		if(!dto.getRPIMGFILE().isEmpty()) {
			String oriFileName = dto.getRPIMGFILE().getOriginalFilename();
			dto.setRPIMG(UUID.randomUUID().toString() + oriFileName.substring(oriFileName.lastIndexOf(".")));
			dto.getRPIMGFILE().transferTo(new File(request.getServletContext().getRealPath("/resources/upload/")+dto.getRPIMG()));
		}else {
			dto.setRPIMG("");
		}

		return dao.reviewPostInsert(dto);
	}

	public int reviewPostUpdate(ReviewPostDTO dto) {
		dto.setODATE(dto.getODATE().substring(0, 19));
		return dao.reviewPostUpdate(dto);
	}

	public List<ReviewPostDTO> reviewPostList(PageDTO pdto) {
		Map<String, Object> map = new HashMap<String, Object>();
		pdto.calcPage(dao.reviewPostCount(), 5, 9);
		map.put("page", pdto);
		return dao.reviewPostList(map);
	}

	public List<ReviewPostDTO> reviewPostList(MemberDTO dto, PageDTO pdto) {
		Map<String, Object> map = new HashMap<String, Object>();
		pdto.calcPage(dao.reviewPostCount(dto), 5, 9);
		map.put("page", pdto);
		map.put("member", dto);
		return dao.reviewPostList(map);
	}

	public List<ReviewPostDTO> reviewPostList(PageDTO pdto, SearchDTO sdto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", sdto);
		pdto.calcPage(dao.searchReviewPostCount(map), 5, 9);
		map.put("page", pdto);
		return dao.searchReviewPostList(map);
	}

	public List<ReviewPostDTO> reviewPostList(MemberDTO dto, PageDTO pdto, SearchDTO sdto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", sdto);
		map.put("member", dto);
		pdto.calcPage(dao.searchReviewPostCount(map), 5, 9);
		map.put("page", pdto);
		return dao.searchReviewPostList(map);
	}

	public ReviewPostDetailDTO reviewPostDetail(ReviewPostDTO dto) {
		dto.setODATE(dto.getODATE().substring(0, 19));
		return dao.reviewPostDetail(dto);
	}

	public int nextBoardDetail(BoardDTO dto, int next) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board", dto);
		map.put("next", next);
		return dao.nextBoardDetail(map);
	}

}
