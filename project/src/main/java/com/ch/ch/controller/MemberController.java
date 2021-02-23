package com.ch.ch.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.ch.model.Member;
import com.ch.ch.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	// 메인 폼 이동
	@RequestMapping("mainForm")
	public String mainForm() {
		return "mainForm";
	}
	
	// 마이페이지
	@RequestMapping("mypage")
	public String main(Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id"); // session에 저장된 id를 가져오기
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
	@RequestMapping(value="idChk", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String idChk(String member_id) {
		String msg = "";
		Member member = ms.select(member_id);
		if(member ==null) {
			msg="사용 가능한 아이디 입니다.";
		}else {
			msg="이미 사용중이니 다른 아이디를 사용하세요";
		}
		return msg;
	}
	
	// 회원가입 확인
	@RequestMapping("memberJoin")
	public String memberJoin(Model model, Member member, HttpSession session) {
		int result = 0;
		Member mem = ms.select(member.getMember_id());
		if(mem==null) {
			result=ms.insert(member);
		}else {
			result =-1;
		}
		model.addAttribute("result", result);
		model.addAttribute("member", member);
		return "/member/memberJoin";
	}
	
	// 로그인 폼 이동
	@RequestMapping("memberLoginForm")
	public String memberLoginForm() {
		return "/member/memberLoginForm";
	}
	
	// 로그인 확인
	@RequestMapping("memberLogin")
	public String memberLogin(Model model, String member_id,String member_password, HttpSession session) {
		int result =0;
		Member mem = new Member();
		mem = ms.select(member_id);
		if(mem == null || mem.getMember_del().equals("y")) {
			result = -1; // 없는 아이디 이거나 삭제 됐음
		}else if(member_password.equals(mem.getMember_password())) {
			result = 1; // 성공
			session.setAttribute("mem", mem);
		}else {
			result =0; // 비밀번호가 다름
		}
		model.addAttribute("result",result);
		model.addAttribute("member_id",member_id);
		return "/member/memberLogin";
	}
	
	//로그아웃
	@RequestMapping("memberLogout")
	public String memberLogout(HttpSession session) {
		session.invalidate();
		return "/member/memberLogout";
	}
	
	// 회원정보 조회
	@RequestMapping("memberView")
	public String memberView(Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		Member member = null;
		if (member_id != null && member_id.equals(""))
			member = ms.select(member_id);
		model.addAttribute("member", member);
		return "/member/memberView";
	}
	
	//회원정보 수정
	@RequestMapping("memberUpdateForm")
	public String memberUpdateForm() {
		return "/member/memberUpdateForm";
	}
}
