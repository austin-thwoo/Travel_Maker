package com.icia.TravelMaker.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.TravelMaker.dto.BoardComplaintDTO;
import com.icia.TravelMaker.dto.BoardDTO;
import com.icia.TravelMaker.dto.BoardLikeDTO;
import com.icia.TravelMaker.dto.CommentsComplaintDTO;
import com.icia.TravelMaker.dto.CommentsDTO;
import com.icia.TravelMaker.dto.CommentsLikeDTO;
import com.icia.TravelMaker.dto.CommentsListDTO;
import com.icia.TravelMaker.dto.MemberDTO;
import com.icia.TravelMaker.dto.OrdersDTO;
import com.icia.TravelMaker.dto.PageDTO;
import com.icia.TravelMaker.dto.ReviewPostDTO;
import com.icia.TravelMaker.dto.SearchDTO;
import com.icia.TravelMaker.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	private ModelAndView mav;
	
	private void mav() {
		if(mav == null) {
			mav = new ModelAndView();
		}
	}
	
	@RequestMapping(value = "/boardList")
	private ModelAndView boardList(@ModelAttribute BoardDTO dto, @ModelAttribute PageDTO pdto, @ModelAttribute SearchDTO sdto, @RequestParam("to") String to, @RequestParam("order") String order) {
		mav();
		switch (to) {
		case "searchB":
			mav.addObject("boardList", service.boardList(dto, pdto, sdto, order));
			mav.addObject("boardCategory", service.boardCategory(dto));
			mav.setViewName("board/BoardList");
			break;
		case "searchM":
			mav.addObject("boardList", service.myBoardList(dto, pdto, sdto, order));
			mav.setViewName("member/BoardList");
			break;
		case "board":
			mav.addObject("boardList", service.boardList(dto, pdto, order));
			mav.addObject("boardCategory", service.boardCategory(dto));
			mav.setViewName(to+"/BoardList");
			break;
		case "member":
			mav.addObject("boardList", service.myBoardList(dto, pdto, order));
			mav.setViewName(to+"/BoardList");
			break;
		}
		mav.addObject("BCNUMBER", dto.getBCNUMBER());
		mav.addObject("to", to);
		mav.addObject("page", pdto);
		mav.addObject("searchBoard", sdto);
		mav.addObject("order", order);
		return mav;
	}
	
	@RequestMapping(value = "/goBoardInsertForm")
	private ModelAndView goBoardInsertForm() {
		mav();
		mav.addObject("boardCategoryList", service.boardCategoryList());
		mav.setViewName("board/BoardInsertForm");
		return mav;
	}
	
	@RequestMapping(value = "/boardInsert")
	private ModelAndView boardInsert(@ModelAttribute BoardDTO dto){
		mav();
		if(service.boardInsert(dto) == 1) {
			mav.setViewName("redirect:/boardList?NowPage=1&BCNUMBER=0");
		}else{
			mav.setViewName("redirect:/goBoardInsertForm");
		}
		return mav;
	}
	
	@RequestMapping(value = "/goBoardDetail")
	private ModelAndView goBoardDetail(@ModelAttribute BoardDTO dto, @ModelAttribute PageDTO pdto, @ModelAttribute SearchDTO sdto, @RequestParam("to") String to, @RequestParam("order") String order) {
		mav();
		service.boardViewsInsert(dto);
		mav.addObject("boardDetail", service.boardDetail(dto));
		mav.addObject("boardLike", service.boardLike(dto));
		mav.addObject("commentsList", service.commentsList(dto));
		mav.addObject("commentsLike", service.commentsLike(dto));
		mav.addObject("nowPage", pdto.getNowPage());
		mav.addObject("BCNUMBER", dto.getBCNUMBER());
		mav.addObject("to", to);
		mav.addObject("searchBoard", sdto);
		mav.addObject("order", order);
		mav.setViewName("board/BoardDetail");
		return mav;
	}
	
	@RequestMapping(value = "/nextBoardDetail")
	private ModelAndView nextBoardDetail(@ModelAttribute BoardDTO dto, @ModelAttribute PageDTO pdto, @ModelAttribute SearchDTO sdto, @RequestParam("to") String to, @RequestParam("order") String order, @RequestParam("next") int next, HttpServletResponse response) throws IOException {
		mav();
		int BNUMBER = service.nextBoardDetail(dto, next);
		if (BNUMBER!=0) {
			mav.addObject("nowPage", pdto.getNowPage());
			mav.addObject("BCNUMBER", dto.getBCNUMBER());
			mav.addObject("BNUMBER", BNUMBER);
			mav.addObject("MID", dto.getMID());
			mav.addObject("to", to);
			mav.addObject("searchType", sdto.getSearchType());
			mav.addObject("keyWord", sdto.getKeyWord());
			mav.addObject("order", order);
			mav.setViewName("redirect:/goBoardDetail");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('마지막 게시글 입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.flush();
			out.close();
		}
		return mav;
	}
	
	@RequestMapping(value="commentsInsert")
	private @ResponseBody List<CommentsListDTO> commentsInsert(@ModelAttribute CommentsDTO dto){
		service.commentsInsert(dto);
		BoardDTO bdto = new BoardDTO();
		bdto.setBNUMBER(dto.getBNUMBER());
		return service.commentsList(bdto);
	}

	@RequestMapping(value = "/goBoardUpdateForm")
	private ModelAndView goBoardUpdateForm(@ModelAttribute BoardDTO dto) {
		mav();
		mav.addObject("boardDetail", service.boardDetail(dto));
		mav.addObject("boardCategoryList", service.boardCategoryList());
		mav.setViewName("board/BoardUpdateForm");
		return mav;
	}
	
	@RequestMapping(value = "/boardUpdate")
	private ModelAndView boardUpdate(@ModelAttribute BoardDTO dto){
		mav();
		if(service.boardUpdate(dto) == 1) {
			mav.setViewName("redirect:/boardList");
		}else{
			mav.setViewName("redirect:/goBoardUpdateForm?BNUMBER="+dto.getBNUMBER());
		}
		return mav;
	}

	@RequestMapping(value = "/goBoardComplaint")
	public ModelAndView goBoardComplaint(@ModelAttribute BoardComplaintDTO dto) {
		mav();
		mav.addObject("complaint", dto);
		mav.setViewName("board/BoardComplaintForm");
		return mav;
	}
	
	@RequestMapping(value="/boardComplaintInsert")
	private void boardComplaintInsert(@ModelAttribute BoardComplaintDTO dto, HttpServletResponse response) throws IOException {
		service.boardComplaintInsert(dto);
		PrintWriter out = response.getWriter();
		out.append("<script>");
		out.append("window.close();");
		out.append("</script>");
		out.flush();
		out.close();
	}

	@RequestMapping(value = "/goCommentsComplaint")
	public ModelAndView goCommentsComplaint(@ModelAttribute CommentsComplaintDTO dto) {
		mav();
		mav.addObject("complaint", dto);
		mav.setViewName("board/CommentsComplaintForm");
		return mav;
	}

	@RequestMapping(value = "/commentsComplaintInsert") 
	private void commentsComplaintInsert(@ModelAttribute CommentsComplaintDTO dto, HttpServletResponse response) throws IOException {
		service.commentsComplaintInsert(dto);
		PrintWriter out = response.getWriter();
		out.append("<script>");
		out.append("window.close();");
		out.append("</script>");
		out.flush();
		out.close();
	}

	@RequestMapping(value = "/boardLikeInsert")
	private @ResponseBody int boardLikeInsert(@ModelAttribute BoardLikeDTO dto) {
		return service.boardLikeInsert(dto);
	}
	@RequestMapping(value = "/boardLikeDelete")
	private @ResponseBody int boardLikeDelete(@ModelAttribute BoardLikeDTO dto) {
		return service.boardLikeDelete(dto);
	}

	@RequestMapping(value = "/commentsLikeInsert")
	private @ResponseBody int commentsLikeInsert(@ModelAttribute CommentsLikeDTO dto) {
		return service.commentsLikeInsert(dto);
	}
	@RequestMapping(value = "/commentsLikeDelete")
	private @ResponseBody int commentsLikeDelete(@ModelAttribute CommentsLikeDTO dto) {
		return service.commentsLikeDelete(dto);
	}
	
	@RequestMapping(value = "/goReviewPostInsertForm")
	private ModelAndView goReviewPostInsertForm(@ModelAttribute OrdersDTO dto) {
		mav();
		mav.addObject("orders", dto);
		mav.setViewName("board/ReviewPostInsertForm");
		return mav;
	}
	
	@RequestMapping(value = "/goReviewPostUpdateForm")
	private ModelAndView goReviewPostUpdateForm(@ModelAttribute ReviewPostDTO dto, @RequestParam("to") String to) {
		mav();
		mav.addObject("reviewPostDetail", service.reviewPostDetail(dto));
		mav.addObject("to", to);
		mav.setViewName("board/ReviewPostUpdateForm");
		return mav;
	}
	
	@RequestMapping(value = "/reviewPostInsert")
	private ModelAndView reviewPostInsert(@ModelAttribute ReviewPostDTO dto, HttpServletResponse response, HttpServletRequest request) throws IllegalStateException, IOException{
		mav();
		if(service.reviewPostInsert(dto, request) == 1) {
			mav.addObject("MID", dto.getOMID());
			mav.addObject("nowPage", 1);
			mav.addObject("to", "member");
			mav.setViewName("redirect:/goReviewPostList");
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('게시글 작성에 실패 했습니다. 다시 시도해주십시오.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.flush();
			out.close();
		}
		return mav;
	}
	
	@RequestMapping(value = "/reviewPostUpdate")
	private ModelAndView reviewPostUpdate(@ModelAttribute ReviewPostDTO dto, HttpServletResponse response, @RequestParam("to") String to) throws IOException {
		mav();
		if(service.reviewPostUpdate(dto) == 1) {
			mav.addObject("MID", dto.getOMID());
			mav.addObject("nowPage", 1);
			mav.addObject("to", to);
			mav.setViewName("redirect:/goReviewPostList");
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('게시글 작성에 실패 했습니다. 다시 시도해주십시오.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.flush();
			out.close();
		}
		return mav;
	}
	
	@RequestMapping(value = "/goReviewPostList")
	private ModelAndView goReviewPostList(@RequestParam("to") String to, @ModelAttribute MemberDTO dto, @ModelAttribute SearchDTO sdto, @ModelAttribute PageDTO pdto) {
		mav();
		switch (to) {
		case "searchB":
			mav.addObject("reviewPostList", service.reviewPostList(pdto, sdto));
			mav.setViewName("board/ReviewPostList");
			break;
		case "searchM":
			mav.addObject("reviewPostList", service.reviewPostList(dto, pdto, sdto));
			mav.setViewName("member/ReviewPostList");
			break;
		case "board":
			mav.addObject("reviewPostList", service.reviewPostList(pdto));
			mav.setViewName(to + "/ReviewPostList");
			break;
		case "member":
			mav.addObject("reviewPostList", service.reviewPostList(dto, pdto));
			mav.setViewName(to + "/ReviewPostList");
			break;
		default:
			break;
		}
		mav.addObject("page", pdto);
		mav.addObject("searchReviewPost", sdto);
		mav.addObject("to", to);
		return mav;
	}
	
	@RequestMapping(value = "/goReviewPostDetail")
	private ModelAndView goReviewPostDetail(@ModelAttribute ReviewPostDTO dto, @ModelAttribute PageDTO pdto, @ModelAttribute SearchDTO sdto, @RequestParam("to") String to) {
		mav();
		mav.addObject("reviewPostDetail", service.reviewPostDetail(dto));
		mav.addObject("nowPage", pdto.getNowPage());
		mav.addObject("searchReviewPost", sdto);
		mav.addObject("to", to);
		mav.setViewName("board/ReviewPostDetail");
		return mav;
	}

}
