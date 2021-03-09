package com.ch.ch.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch.model.Board;
import com.ch.ch.model.Member;
import com.ch.ch.model.ReBoard;
import com.ch.ch.service.BoardService;
import com.ch.ch.service.MemberService;
import com.ch.ch.service.ReBoardService;

@Controller
public class ReBoardController {
	@Autowired
	private ReBoardService rbs;
	@Autowired
	private BoardService bs;
	
	@RequestMapping("reBoardList")
	public String reBoardList(int b_num, Model model, HttpSession session, String pageNum ) {
		String member_id = (String)session.getAttribute("member_id");
		Board board = bs.select(b_num);
		List<ReBoard> rbList = rbs.list(b_num);
		model.addAttribute("board", board);
		model.addAttribute("rbList", rbList);
		model.addAttribute("member_id", member_id);
		model.addAttribute("pageNum", pageNum);
		return "/board/reBoardList";
	}
	
	@RequestMapping("reInsert")
	public String reInsert(ReBoard reBoard, String pageNum) {
		// System.out.println("b_num="+reBoard.getB_num());
		rbs.insert(reBoard);
		return "redirect:/reBoardList.do?b_num="+reBoard.getB_num()+"&pageNum="+pageNum;
	}
	
	@RequestMapping("reUpdate")
	public String reUpdate(ReBoard reBoard) {
		rbs.update(reBoard);
		return "redirect:/reBoardList.do?b_num="+reBoard.getB_num();
	}
	
	@RequestMapping("reDelete")
	public String reDelete(ReBoard reBoard) {
		rbs.delete(reBoard.getR_num());
		return "redirect:/reBoardList.do?b_num="+reBoard.getB_num();
	}
}
