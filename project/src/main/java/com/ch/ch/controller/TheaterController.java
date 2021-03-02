package com.ch.ch.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
// 극장
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch.model.Movie;
import com.ch.ch.model.Theater;
import com.ch.ch.service.MovieService;
import com.ch.ch.service.TheaterService;
@Controller
public class TheaterController {
	@Autowired
	private TheaterService ts; //예매
	@Autowired
	private MovieService ms; // 영화
	@Autowired
	private TheaterService tts; // 극장
	@RequestMapping("theaterMainForm")
	public String theaterMainForm() {
		return "theater/theaterMainForm";
	}
	//영화 선택
	@RequestMapping("choiceMovie")
	public String choiceMovie(Model model) {
		List<Movie> movieList = ms.list(); //영화 제목 나열
		model.addAttribute("movieList",movieList);
		return "theater/choiceMovie";
	}
	//극장 선택
	@RequestMapping("choiceTheater")
	public String choiceTheater(Model model) {
		List<Theater> list = tts.List(); // 극장 이름 나열
		model.addAttribute("list", list);
		return "theater/choiceTheater";
	}
	//모든 영화 선택
	@RequestMapping("choiceAllMovie")
	public String choiceAllMovie(Model model) {
		List<Movie> movieList = ms.list(); //영화 제목 나열
		model.addAttribute("movieList",movieList);
		return "theater/choiceAllMovie";
	}
	
}
