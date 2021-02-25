package com.ch.ch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
// 극장
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch.model.Movie;
import com.ch.ch.service.MovieService;
import com.ch.ch.service.TheaterService;
@Controller
public class TheaterController {
	@Autowired
	private TheaterService ts; //예매
	@Autowired
	private MovieService ms; // 영화
	@RequestMapping("theaterMainForm")
	public String theaterMainForm() {
		return "theater/theaterMainForm";
	}
	@RequestMapping("choiceMovie")
	public String choiceMovie(Model model) {
		List<Movie> movieList = ms.list();
		model.addAttribute("movieList",movieList);
		return "theater/choiceMovie";
	}
}
