package com.ch.ch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch.model.Movie;
import com.ch.ch.model.Theater;
import com.ch.ch.service.MovieService;
import com.ch.ch.service.TheaterService;
import com.ch.ch.service.TicketService;

@Controller
public class TicketController {
	@Autowired
	private TicketService ts; // 예매
	@Autowired
	private MovieService ms; // 영화
	@Autowired
	private TheaterService tts; // 극장
	@RequestMapping("ticketMainForm")
	public String ticketMainForm(Model model, Theater theater) {
		List<Movie> movie = ms.list(); // 영화 리스트
		List<Theater> theater1 = tts.locList(theater); // 극장 지역 리스트
		
		model.addAttribute("movie", movie);
		model.addAttribute("theater1", theater1);
		return "ticket/ticketMainForm";
	}
}
