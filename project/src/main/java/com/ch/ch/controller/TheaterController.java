package com.ch.ch.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
// 극장
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.ch.model.Movie;
import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Theater;
import com.ch.ch.service.MovieService;
import com.ch.ch.service.ScreenService;
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
	public String theaterMainForm(Model model) {
		List<Theater> showLocList =tts.listT_loc();
		model.addAttribute("showLocList",showLocList);
		
		return "theater/theaterMainForm";
	}
	@RequestMapping("theaterLoc")
	public String selectMovieTheater(String t_loc, Model model) {
		List<Theater> showLocList = tts.locList(t_loc);
		model.addAttribute("showLocList",showLocList);
		return "theater/theaterLoc";
	}
	//영화별 선택
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
	
	//극장 입력 폼
	@RequestMapping("theaterInsertForm")
	public String theaterInsertForm(Model model) {
		List<String> titleList = tts.titleList();
		
		model.addAttribute("titleList", titleList);
		return "theater/theaterInsertForm";
	}
	//극장 입력
	@RequestMapping("theaterInsert")
	public String theaterInsert(Theater theater, Model model) {
		int result = tts.insert(theater);
		model.addAttribute("result", result);
		
		return "theater/theaterInsert";
	}
	//상영관 입력 폼
	@RequestMapping("movieTheaterInsertForm")
	public String movieTheaterInsertForm(Model model) {
		List<MovieTheater> movieTheaterList = tts.movieTheaterList();
		List<Theater> list = tts.List();
		model.addAttribute("list", list);
		model.addAttribute("movieTheaterList",movieTheaterList);
		return "theater/movieTheaterInsertForm";
	}
	//상영관 입력
	@RequestMapping("movieTheaterInsert")
	public String movieTheaterInsert(int t_num, String mt_name, Model model) {
		int mt_count = 0;
		if(mt_name == "1관") {
			mt_count=50;
		} else if (mt_name == "2관") {
			mt_count=70;
		} else if (mt_name == "3관") {
			mt_count=80;
		} else if (mt_name == "4관") {
			mt_count=90;
		} else {
			mt_count=100;
		}
		int result = tts.numInsert(mt_name,mt_count,t_num);
				
		/* int result = tts.insert(theater); */
		model.addAttribute("result", result);
		return "theater/movieTheaterInsert";
	}
	//중복체크
	 @RequestMapping(value = "TLocChk", produces = "text/html;charset=utf-8")
	 @ResponseBody public String TLocChk(String t_loc, String t_title) { 
		 String data=""; 
		/* Theater theater = tts.select(t_loc); */ 
		 List<Theater> theater = tts.select(t_loc, t_title);
		 if(theater.size()==0) data = "입력 가능합니다.";
		 else data = "이미 사용 중입니다. 다시 입력해주세요.";
		 return data; 
	 }
	 @RequestMapping("seoul1")
	 public String seoul1(){
		 return "theater/seoul1";
	 }
	 @RequestMapping("seoul2")
	 public String seoul2(){
		 return "theater/seoul2";
	 }
	 @RequestMapping("seoul3")
	 public String seoul3(){
		 return "theater/seoul3";
	 }
	 @RequestMapping("seoul4")
	 public String seoul4(){
		 return "theater/seoul4";
	 }
	 @RequestMapping("theaterView")
	 public String theaterView(Model model, int t_num) {
		 Theater theaterView = tts.theaterView(t_num); // 극장번호 클릭시 t_num값을 받아와서 극장에 대한 모든 정보를 담아서 뿌려줌
		 model.addAttribute("theaterView", theaterView);
		 return "theater/theaterView";
	 }
}