package com.ch.ch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.ch.ch.model.Moive;
import com.ch.ch.service.MoiveService;
import com.ch.ch.service.TicketService;

@Controller
public class TicketController {
	@Autowired
	private TicketService ts; // 예매
	@Autowired
	private MoiveService ms; // 영화
	@RequestMapping("ticketMainForm")
	public String ticketMainForm(Model model) {
		List<Moive> movie = ms.select();
		model.addAttribute("movie", movie);
		return "ticket/ticketMainForm";
	}
	@RequestMapping("selectMovie")
	public String selectMovie(Model model, int m_num) {
		Moive movie1 = ms.selectMovie(m_num);
		model.addAttribute("movie1", movie1);
		return "ticket/ticketMainForm";
	}
}
