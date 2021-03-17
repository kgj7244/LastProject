package com.ch.ch.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.ch.model.Member;
import com.ch.ch.model.Movie;
import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Screen;
import com.ch.ch.model.Theater;
import com.ch.ch.model.Ticket;
import com.ch.ch.service.MemberService;
import com.ch.ch.service.MovieService;
import com.ch.ch.service.ScreenService;
import com.ch.ch.service.PagingBean;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired
	private MovieService mvs;
	@Autowired
	private ScreenService ss; // 상영
	

	// 메인 폼 이동
	@RequestMapping("mainForm")
	public String mainForm(Model model, Movie movie) { // 다혜씨 조금 수정합니다~ 나중에 주석만 지워주세요 
		List<Movie> movieList = mvs.movieMainList(); // 메인 홈페이지 영화부분 평점 기준으로 순서대로 출력
		
		model.addAttribute("movieList", movieList);
		return "mainForm";
	}

	// 마이페이지
	@RequestMapping("mypage")
	public String main(Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id"); // session에 저장된 id를 가져오기
		Member member = null;
		if (member_id != null && !member_id.equals(""))
			member = ms.select(member_id);
		model.addAttribute("member", member);
		return "/member/mypage";
	}

	/* 깃 */
	// 회원가입 폼 이동
	@RequestMapping("memberJoinForm")
	public String memberJoinForm() {
		return "/member/memberJoinForm";
	}

	// 아이디 중복 체크
	@RequestMapping(value = "idChk", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String idChk(String member_id) {
		String msg = "";
		Member member = ms.select(member_id);
		if (member == null) {
			msg = "사용 가능한 아이디 입니다.";
		} else {
			msg = "이미 사용중이니 다른 아이디를 사용하세요";
		}
		return msg;
	}

	// 회원가입 확인
	@RequestMapping("memberJoin")
	public String memberJoin(Member member, Model model, HttpSession session) {
		int result = 0;
		Member mem = ms.select(member.getMember_id());
		if (mem == null) {
			result = ms.insert(member);
		} else {
			result = -1;
		}
		model.addAttribute("result", result);
		// model.addAttribute("member", member);
		return "/member/memberJoin";
	}

	// 로그인 폼 이동
	@RequestMapping("memberLoginForm")
	public String memberLoginForm() {
		return "/member/memberLoginForm";
	}

	// 로그인
	@RequestMapping("memberLogin")
	public String memberLogin(Member member, Model model, HttpSession session) {
		int result = 0;
		// Member member는 화면에서 입력받은 데이터고, mem은 태이블에서 id로 읽어온 데이터
		Member mem = ms.select(member.getMember_id());
		if (mem == null || mem.getMember_del().equals("y")) {
			result = -1; // db에 없는 아이디거나 탈퇴한 아이디
			// db에 저장된 pw와 화면에 입력한 pw가 같은지 확인
		} else if (mem.getMember_password().equals(member.getMember_password())) {
			result = 1; // 로그인 성공
			session.setAttribute("member_id", member.getMember_id());
		}
		model.addAttribute("result", result);
		return "/member/memberLogin";
	}

	// 로그아웃
	@RequestMapping("memberLogout")
	public String memberLogout(HttpSession session) {
		session.invalidate();
		return "/member/memberLogout";
	}

	// 회원정보 조회
	@RequestMapping("memberView")
	public String memberView(Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		Member member = ms.select(member_id);
		model.addAttribute("member", member);
		return "/member/memberView";
	}

	// 회원정보 수정폼
	@RequestMapping("memberUpdateForm")
	public String memberUpdateForm(Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		Member member = ms.select(member_id);
		model.addAttribute("member", member);
		return "/member/memberUpdateForm";
	}

	// 회원정보 수정
	@RequestMapping("memberUpdate")
	public String memberUpdate(Member member, Model model, HttpSession session) {
		int result = 0;
		result = ms.update(member);
		model.addAttribute("result", result);
		return "/member/memberUpdate";
	}

	// 회원탈퇴
	@RequestMapping("memberDelete")
	public String memberDelete(Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		int result = ms.delete(member_id);
		if (result > 0)
			session.invalidate();
		model.addAttribute("result", result);
		return "/member/memberDelete";
	}

	@RequestMapping("masterMemberList")
	public String masterMemberList(String pageNum, Model model, Member member, HttpSession session) {
		// if (pageNum == null || pageNum.equals("")) pageNum = "1";
		// int currentPage = Integer.parseInt(pageNum);
		// int total = ms.getTotal(member);
		// int rowPerPage= 10;
		// int startRow = (currentPage - 1) * rowPerPage + 1;
		// int endRow = startRow + rowPerPage - 1;
		// member.setStartRow(startRow);
		// member.setEndRow(endRow);
		List<Member> list = ms.list(member);
		// int no = total - startRow + 1;
		// PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] tit = { "아이디", "이름" };
		model.addAttribute("tit", tit);
		// model.addAttribute("pb", pb);
		// model.addAttribute("no", no);
		// model.addAttribute("total", total);
		model.addAttribute("list", list);
		return "/member/masterMemberList";
	}

	@RequestMapping("masterMemberUpdateForm")
	public String masterMemberUpdateForm(String member_id, Model model, HttpSession session) {
		Member member = new Member();
		member = ms.select(member_id);
		model.addAttribute("member", member);
		return "/member/masterMemberUpdateForm";
	}
	
	@RequestMapping("masterMemberUpdate")
	public String masterMemberUpdate(Member member, Model model, HttpSession session) {
		int result = 0;
		result = ms.update(member);
		model.addAttribute("result", result);
		return "/member/masterMemberUpdate";
	}

	@RequestMapping("masterMemberDelete")
	public String masterMemberDelete(String member_id, String member_del, Member member, Model model, HttpSession session) {
		int result = ms.delete(member_id);
		if (result > 0)
			session.invalidate();
		model.addAttribute("result", result);
		return "/member/masterMemberDelete";
	}
}
