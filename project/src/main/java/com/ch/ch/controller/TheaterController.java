package com.ch.ch.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
// 극장
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	//상영관 입력 폼
	@RequestMapping("theaterInsertForm")
	public String theaterInsertForm(Model model) {
		List<Theater> titleList = tts.titleList();
		
		model.addAttribute("titleList", titleList);
		return "theater/theaterInsertForm";
	}
	//상영관 입력
	@RequestMapping("theaterInsert")
	public String theaterInsert(Theater theater, Model model) {		
		int result = tts.insert(theater);
		model.addAttribute("result", result);
		
		return "theater/theaterInsert";
	}
	//상영관 번호 중복체크
	@RequestMapping(value = "TnumChk", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String TnumChk(int t_num) {
		String data="";
		Theater theater = tts.select(t_num);
		if(theater == null) data = "사용 가능한 상영관 번호입니다.";
		else data = "이미 사용 중인 상영관 번호입니다. 다른 번호를 입력해주세요.";
		return data;
	}
}