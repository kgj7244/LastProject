package com.ch.ch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.ch.model.Movie;
import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Screen;
import com.ch.ch.model.Theater;
import com.ch.ch.service.MovieService;
import com.ch.ch.service.ScreenService;
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
	@Autowired
	private ScreenService ss; // 상영
	@RequestMapping("ticketMainForm")
	public String ticketMainForm(Model model, Theater theater) {
		List<Movie> movie = ms.list(); // 영화 리스트
		List<Theater> theater1 = tts.locList(theater); // 극장 지역 리스트
		model.addAttribute("movie", movie);
		model.addAttribute("theater1", theater1);
		return "ticket/ticketMainForm";
	}
	@RequestMapping(value = "selectTheater") // 극장주소을 클릭시 옆에 극장명 나오기
	public String selectTheater(String id, Model model) {
		List<Theater> selectTheater = tts.selectTheater(id);
		model.addAttribute("selectTheater", selectTheater);
		return "ticket/selectTheater";
	}
	@RequestMapping(value = "selectTime") 
	public String selectTime(String m_title, String t_title, String sc_date, Model model) {
		Movie movie = ms.selectTitle(m_title); // movie.getM_num() 영화 번호 가져옴
		int movie_num = movie.getM_num();
		Theater theater = tts.selectTitle(t_title); // theater.getT_num() 극장번호 가져옴
		int theater_num = theater.getT_num();
		List<Screen> screen = ss.selectTitleList(movie_num, theater_num, sc_date); // 영화번호, 극장번호, 날짜를 가지고와서 그 해당하는 시간대를 출력하기 위함		
		 //int movieTheaterCnt = ss.selectCnt(theater.getT_num());
		 //System.out.println("movieTheaterCnt : " + movieTheaterCnt);
		 
		model.addAttribute("movie",movie);
		model.addAttribute("theater",theater);
		model.addAttribute("screen",screen);
		return "ticket/selectTime";
	}
	@RequestMapping("paymentForm")
	public String paymentForm(Model model, String m_title2, String t_title2, String sc_date2, String mt_num2 ,String sc_num2) {
		//m_title2 : 영화제목, t_title2 : 지점이름(신촌), sc_date2 : 날짜, mt_num2 : 상영관
		String m_title = m_title2;
		String t_title = t_title2;
		String sc_date = sc_date2;
		String mt_num = mt_num2;
		int sc_num = Integer.parseInt(sc_num2);
		Movie movie = ms.selectTitle(m_title); // 영화제목으로 검색해서 하나 가져옴
		Theater theater = tts.selectTitle(t_title); //지점으로 검색해서 극장의 정보 하나 가져옴
		Screen screen = ss.select(sc_num); // 해당 상영지점 구하기
		
	
		model.addAttribute("mt_num", mt_num);
		model.addAttribute("movie", movie);
		model.addAttribute("theater", theater);
		model.addAttribute("screen", screen);
		
		return "ticket/paymentForm";
	}
	@RequestMapping("movieTheater50")
	public String movieTheater50() {
		return "ticket/movieTheater50";
	}
}