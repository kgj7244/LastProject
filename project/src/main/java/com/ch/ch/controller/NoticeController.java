package com.ch.ch.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch.model.Notice;
import com.ch.ch.service.NoticeService;
import com.ch.ch.service.PagingBean;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService ns;
	
	// 공지 목록
	@RequestMapping("noticeList")
	public String noticeList(String pageNum, Notice notice, Model model) {
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = ns.getNtotal(notice);
		int rowPerPage= 10;
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		notice.setStartRow(startRow);
		notice.setEndRow(endRow);
		List<Notice> list = ns.list(notice);
		int no = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] tit = {"지점", "제목", "내용", "제목+내용"};
		model.addAttribute("tit", tit);
		model.addAttribute("pb", pb);
		model.addAttribute("no", no);
		model.addAttribute("total", total);
		model.addAttribute("list", list);
		return "/board/noticeList";
	}
	
	// 공지 입력 폼
	@RequestMapping("noticeInsertForm")
	public String noticeInsertForm(int n_num, String pageNum, Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		Notice notice = ns.select(n_num);
		model.addAttribute("n_num", n_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("notice", notice);
		if(member_id != null) {
			model.addAttribute("member_id", member_id);
		}
		return "/board/noticeInsertForm";
	}
	
	// 공지 입력
	@RequestMapping("noticeInsert")
	public String noitceInsert(Notice notice, String pageNum, Model model) {
		int result = ns.insert(notice);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/board/noticeInsert";
	}
	
	// 공지글 보기
	@RequestMapping("noticeView")
	public String noticeView(int n_num, String pageNum, Model model,HttpSession session) {
		Notice notice = ns.select(n_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("notice", notice);
		return "/board/noticeView";
	}
	
	// 공지 수정 폼
	@RequestMapping("noticeUpdateForm")
	public String noticeUpdateForm(int n_num, String pageNum, Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		Notice notice = ns.select(n_num);
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
		if(member_id != null) {
			model.addAttribute("member_id", member_id);
		}
		return "/board/noticeUpdateForm";
	}
	
	// 공지 수정
	@RequestMapping("noticeUpdate")
	public String noticeUpdate(Notice notice, String pageNum, Model model) {
		int result = ns.update(notice);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/board/noticeUpdate";
	}
	
	// 공지 삭제
	@RequestMapping("noticeDelete") 
	public String noticeDelete(int n_num, String pageNum, Model model) {
		int result = ns.delete(n_num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum); 
		return "/board/noticeDelete";
	}
}
