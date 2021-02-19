package com.ch.ch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch.service.MoiveService;

@Controller
public class MoiveController {
	@Autowired
	private MoiveService ms;
	
	@RequestMapping("moiveMainForm")
	public String moiveMainForm(){
		return "moive/moiveMainForm";
	}
}
