package com.ch.ch.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch.service.BoardService;
import com.ch.ch.model.Board;
import com.ch.ch.model.Member;
import com.ch.ch.service.PagingBean;

@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	
	// 게시판 목록
	@RequestMapping("boardList")
	public String boardList(String pageNum, Board board, Model model) {
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = bs.getTotal(board);
		int rowPerPage= 10;
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		List<Board> list = bs.list(board);
		int no = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] tit = {"아이디", "제목", "내용", "제목+내용"};
		model.addAttribute("tit", tit);
		model.addAttribute("pb", pb);
		model.addAttribute("no", no);
		model.addAttribute("total", total);
		model.addAttribute("list", list);
		return "/board/boardList"; 
	}
	
	// 게시판 카테고리
	@RequestMapping("boardlistByb_code")
	public String boardlistByb_code(String pageNum, Board board, Model model ) {
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = bs.getTotalBcode(board);
		int rowPerPage= 10;
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		List<Board> list = bs.listCode(board);
		int no = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] tit = {"아이디", "제목", "내용", "제목+내용"};
		model.addAttribute("tit", tit);
		model.addAttribute("pb", pb);
		model.addAttribute("no", no);
		model.addAttribute("total", total);
		model.addAttribute("list", list);
		return "/board/boardList";
	}
	
	// 게시글입력 폼
	@RequestMapping("boardInsertForm")
	public String boardInsertForm(int b_num, String pageNum, Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		Board board = bs.select(b_num);
		model.addAttribute("b_num", b_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board", board);
		if(member_id != null) {
			model.addAttribute("member_id", member_id);
		}
		return "/board/boardInsertForm";
	}
	
	// 게시글입력
	@RequestMapping("boardInsert")
	public String boardInsert(Board board, String pageNum, Model model) {
		int result = bs.insert(board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/board/boardInsert";
	}
	
	// 암호있는 게시글 선택시 암호입력 폼
	@RequestMapping("boardViewForm")
	public String boardView(Board board, String pageNum, Model model) {
		/*
		 * Board board = bs.select(b_num); model.addAttribute("b_num", b_num);
		 */
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "/board/boradViewForm";
	}
	
	// 게시글 보기
	@RequestMapping("boardView")
	public String boardView(int b_num, String pageNum, Model model) {
		bs.updateReadCount(b_num);
		Board board = bs.select(b_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board", board);
		return "/board/boardView";
	}
	
	// 게시글 수정 폼
	@RequestMapping("boardUpdateForm")
	public String boardUpdateForm(int b_num, String pageNum, Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		Board board = bs.select(b_num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		if(member_id != null) {
			model.addAttribute("member_id", member_id);
		}
		return "/board/boardUpdateForm";
	}
	
	@RequestMapping("boardUpdate")
	public String boardUpdate(Board board, String pageNum, Model model) {
		int result = bs.update(board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/board/boardUpdate";
	}
}