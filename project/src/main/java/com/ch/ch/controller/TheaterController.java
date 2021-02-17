package com.ch.ch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
// 극장
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch.service.TheaterService;
@Controller
public class TheaterController {
	@Autowired
	private TheaterService ts;
	@RequestMapping("theaterMainForm")
	public String theaterMainForm() {
		return "theater/theaterMainForm";
	}
}
