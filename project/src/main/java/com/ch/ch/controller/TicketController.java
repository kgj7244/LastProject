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
	@RequestMapping("screenInsertForm") // 상영 추가하기
	public String screenInsertForm(Model model) {
		List<Movie> movie = ms.list(); 
		List<Theater> theater = tts.listT_loc();
		List<MovieTheater> movieTheater = ss.list();
		
		model.addAttribute("movie", movie);
		model.addAttribute("theater", theater);
		model.addAttribute("movieTheater", movieTheater);
		return "ticket/screenInsertForm";
	}
	@RequestMapping("screenInsert")
	public String screenInsert(Model model, String m_title, String t_title, String mt_name, String sc_date, String sc_start, String sc_end) {
		Movie movie = ms.selectTitle(m_title);
		Theater theater = tts.selectTitle(t_title);
		MovieTheater movieTheater = ss.selectTitle(mt_name);
		
		int result = ss.screenInsert(movie.getM_num(), theater.getT_num(), movieTheater.getMt_num(), sc_date, sc_start, sc_end);
		model.addAttribute("result", result);
		return "ticket/screenInsert";
	}
	@RequestMapping(value = "selectTheater") // 극장주소을 클릭시 옆에 극장명 나오기
	public String selectTheater(String id, Model model) {
		List<Theater> selectTheater = tts.selectTheater(id);
		
		model.addAttribute("selectTheater", selectTheater);
		return "ticket/selectTheater";
	}
	@RequestMapping(value = "selectTheater1") // insert시 화면때문에 하나 더 만듬...
	public String selectTheater1(String id, Model model) {
		List<Theater> selectTheater1 = tts.selectTheater(id);
		
		model.addAttribute("selectTheater1", selectTheater1);
		return "ticket/selectTheater1";
	}
	@RequestMapping(value = "selectTime") 
	public String selectTime(String m_title, String t_title, String sc_date, Model model) {
		Movie movie = ms.selectTitle(m_title); // movie.getM_num() 영화 번호 가져옴
		int movie_num = movie.getM_num();
		Theater theater = tts.selectTitle(t_title); // theater.getT_num() 극장번호 가져옴
		int theater_num = theater.getT_num();
		List<Screen> screen = ss.selectTitleList(movie_num, theater_num, sc_date); // 영화번호, 극장번호, 날짜를 가지고와서 그 해당하는 시간대를 출력하기 위함		
		
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
		int mt_num = Integer.parseInt(mt_num2);
		int sc_num = Integer.parseInt(sc_num2);
		MovieTheater movieTheater = ss.selectMovieTheaterFind(mt_num, sc_num);
		Movie movie = ms.selectTitle(m_title); // 영화제목으로 검색해서 하나 가져옴
		Theater theater = tts.selectTitle(t_title); //지점으로 검색해서 극장의 정보 하나 가져옴
		Screen screen = ss.select(sc_num, mt_num); // 해당 상영지점 구하기
		 
		model.addAttribute("mt_num", mt_num);
		model.addAttribute("sc_num", sc_num);
		model.addAttribute("movieTheater", movieTheater);
		model.addAttribute("movie", movie);
		model.addAttribute("theater", theater);
		model.addAttribute("screen", screen);
		
		return "ticket/paymentForm";
	}
	@RequestMapping("movieTheater50")
	public String movieTheater50() {
		return "ticket/movieTheater50";
	}
	@RequestMapping("movieTheater70")
	public String movieTheater70() {
		return "ticket/movieTheater70";
	}
	@RequestMapping("movieTheater80")
	public String movieTheater80() {
		return "ticket/movieTheater80";
	}
	@RequestMapping("movieTheater90")
	public String movieTheater90() {
		return "ticket/movieTheater90";
	}
	@RequestMapping("movieTheater100")
	public String movieTheater100() {
		return "ticket/movieTheater100";
	}
	@RequestMapping("payment")
	public String payment(Model model, String totalPrice, String selectList , String m_title, String t_title, String mt_num2, String sc_num2, String adult_ticket, String youth_ticket, String sc_date2, String sc_start) {
		//m_title:영화제목, t_loc:극장주소, t_title:극장명, mt_num:상영관번호, sc_date:상영날짜, sc_start:상영시간, sc_end:상영종료, m_poster:영화포스터, selectList:구매할 좌석, totalPrice:구매할 금액 ,sc_num:상영번호
		Movie movie = ms.selectTitle(m_title);
		Theater theater = tts.selectTitle(t_title);
		int mt_num = Integer.parseInt(mt_num2);
		int sc_num = Integer.parseInt(sc_num2);
		String sc_date = sc_date2;
		MovieTheater movieTheater = ss.selectMovieTheaterFind(mt_num, sc_num);
		Screen screen = ss.select(sc_num, mt_num);
		
		model.addAttribute("movie", movie);
		model.addAttribute("theater", theater);
		model.addAttribute("movieTheater", movieTheater);
		model.addAttribute("screen", screen);
		model.addAttribute("selectList", selectList);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("adult_ticket", adult_ticket);
		model.addAttribute("youth_ticket", youth_ticket);
		return "ticket/payment";
	}
}