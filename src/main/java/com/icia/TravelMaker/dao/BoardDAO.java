package com.icia.TravelMaker.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
import com.icia.TravelMaker.dto.ReviewPostDTO;
import com.icia.TravelMaker.dto.ReviewPostDetailDTO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public int boardInsert(BoardDTO dto) {
		return sql.insert("Board.boardInsert", dto);
	}

	public int boardListCount(BoardDTO dto) {
		return sql.selectOne("Board.boardListCount", dto);
	}

	public int boardListCount(Map<String, Object> map) {
		return sql.selectOne("Board.searchBoardListCount", map);
	}

	public int myBoardListCount(BoardDTO dto) {
		return sql.selectOne("Member.myBoardListCount", dto);
	}

	public int myBoardListCount(Map<String, Object> map) {
		return sql.selectOne("Member.searchMyBoardListCount", map);
	}

	public List<BoardListDTO> boardList(Map<String, Object> map) {
		return sql.selectList("Board.boardList", map);
	}

	public List<BoardListDTO> searchBoardList(Map<String, Object> map) {
		return sql.selectList("Board.searchBoardList", map);
	}

	public List<BoardListDTO> myBoardList(Map<String, Object> map) {
		return sql.selectList("Member.myBoardList", map);
	}

	public List<BoardListDTO> searchMyBoardList(Map<String, Object> map) {
		return sql.selectList("Member.searchMyBoardList", map);
	}

	public BoardCategoryDTO boardCategory(BoardDTO dto) {
		return sql.selectOne("Board.boardCategory", dto);
	}

	public BoardDetailDTO boardDetail(BoardDTO dto) {
		return sql.selectOne("Board.boardDetail", dto);
	}

	public List<CommentsListDTO> commentsList(BoardDTO dto) {
		return sql.selectList("Board.commentsList", dto);
	}

	public void commentsInsert(CommentsDTO dto) {
		sql.insert("Board.commentsInsert", dto);
	}

	public String boardCategoryCheck(BoardCategoryDTO dto) {
		return sql.selectOne("Board.boardCategoryCheck", dto);
	}

	public List<BoardCategoryDTO> boardCategoryList() {
		return sql.selectList("Admin.boardCategoryList");
	}

	public int boardUpdate(BoardDTO dto) {
		return sql.update("Board.boardUpdate", dto);
	}

	public void boardComplaintInsert(BoardComplaintDTO dto) {
		sql.insert("Board.boardComplaintInsert", dto);
	}

	public void commentsComplaintInsert(CommentsComplaintDTO dto) {
		sql.insert("Board.commentsComplaintInsert", dto);
	}

	public int boardLike(BoardDTO dto) {
		return sql.selectOne("Board.boardLike", dto);
	}

	public void boardLikeInsert(BoardLikeDTO dto) {
		sql.insert("Board.boardLikeInsert", dto);
	}

	public void boardLikeDelete(BoardLikeDTO dto) {
		sql.delete("Board.boardLikeDelete", dto);
	}

	public void boardViewsInsert(BoardDTO dto) {
		sql.insert("Board.boardViewsInsert", dto);
	}

	public List<CommentsLikeDTO> commentsLike(BoardDTO dto) {
		return sql.selectList("Board.commentsLike", dto);
	}

	public void commentsLikeInsert(CommentsLikeDTO dto) {
		sql.insert("Board.commentsLikeInsert", dto);
	}

	public void commentsLikeDelete(CommentsLikeDTO dto) {
		sql.delete("Board.commentsLikeDelete", dto);
	}

	public int commentsLikeResult(CommentsLikeDTO dto) {
		return sql.selectOne("Board.commentsLikeResult", dto);
	}

	public int reviewPostInsert(ReviewPostDTO dto) {
		return sql.insert("Board.reviewPostInsert", dto);
	}

	public int reviewPostUpdate(ReviewPostDTO dto) {
		return sql.update("Board.reviewPostUpdate", dto);
	}

	public int reviewPostCount() {
		return sql.selectOne("Board.reviewPostCount");
	}

	public int reviewPostCount(MemberDTO dto) {
		return sql.selectOne("Board.reviewPostCount", dto);
	}

	public int searchReviewPostCount(Map<String, Object> map) {
		return sql.selectOne("Board.searchReviewPostCount", map);
	}

	public List<ReviewPostDTO> reviewPostList(Map<String, Object> map) {
		return sql.selectList("Board.reviewPostList", map);
	}

	public List<ReviewPostDTO> searchReviewPostList(Map<String, Object> map) {
		return sql.selectList("Board.searchReviewPostList", map);
	}

	public ReviewPostDetailDTO reviewPostDetail(ReviewPostDTO dto) {
		return sql.selectOne("Board.reviewPostDetail", dto);
	}	

	public int nextBoardDetail(Map<String, Object> map) {
		return sql.selectOne("Board.nextBoardDetail", map);
	}

}
