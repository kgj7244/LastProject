package com.ch.ch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.ch.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
}
