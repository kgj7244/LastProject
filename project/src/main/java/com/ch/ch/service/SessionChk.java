package com.ch.ch.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 용도 : 입력/수정/삭제 /조회를 로그인 한 사람만 가능하게 하려는 것
public class SessionChk extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		// 세션이 널이거나 session의 id가 null이거나 값이 없으면 loginForm.do로 보내
		if (session == null || session.getAttribute("member_id") == null || session.getAttribute("member_id").equals("")) {
			response.sendRedirect("member/memberLoginForm.do");
			return false;
		} return true;
	}
}
