package com.ch.ch.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ch.ch.model.Event;
import com.ch.ch.model.Event_over;
import com.ch.ch.model.Member;
import com.ch.ch.model.Movie;
import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Screen;
import com.ch.ch.model.Seat;
import com.ch.ch.model.Store;
import com.ch.ch.model.Theater;
import com.ch.ch.model.Ticket;
import com.ch.ch.service.MemberService;
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
	@Autowired
	private MemberService mms; // 회원
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
	
	 @RequestMapping(value = "movieTheaterChk")
	 public String movieTheaterChk(String t_title, Model model) {
		 Theater theater = ss.selectTheater(t_title);
		 List<MovieTheater> mTheater = ss.mTheater(theater.getT_num());
		 model.addAttribute("mTheater", mTheater);
		 return "ticket/movieTheaterChk"; 
	 }
	
	
	@RequestMapping("screenInsert")
	public String screenInsert(Model model, String m_title, String t_title, String mt_name, String sc_date, String sc_start, String sc_end) {
		Movie movie = ms.selectTitle(m_title);
		Theater theater = tts.selectTitle(t_title);
		MovieTheater movieTheater = ss.selectTitle(mt_name, theater.getT_num());
		
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
	public String paymentForm(Model model, String m_title2, String t_title2,String mt_num2 ,String sc_num2, String mt_name) {
		String m_title = m_title2;
		String t_title = t_title2;
		String st_name="";
		int mt_num = Integer.parseInt(mt_num2);
		int sc_num = Integer.parseInt(sc_num2);
		MovieTheater movieTheater = ss.selectMovieTheaterFind(mt_num, sc_num);
		Movie movie = ms.selectTitle(m_title); // 영화제목으로 검색해서 하나 가져옴
		Theater theater = tts.selectTitle(t_title); //지점으로 검색해서 극장의 정보 하나 가져옴
		Screen screen = ss.select(sc_num, mt_num); // 해당 상영지점 구하기
		
		List<Seat> seat = ss.seatFind(sc_num);
		for(int i =0; i<seat.size(); i++) {
			if(i==seat.size()-1) {
				st_name += seat.get(i).getSt_num();
			}else {
				st_name += seat.get(i).getSt_num()+",";
			}
		}
		
		model.addAttribute("mt_name", mt_name);
		model.addAttribute("st_name", st_name);
		model.addAttribute("mt_num", mt_num);
		model.addAttribute("sc_num", sc_num);
		model.addAttribute("movieTheater", movieTheater);
		model.addAttribute("movie", movie);
		model.addAttribute("theater", theater);
		model.addAttribute("screen", screen);
		
		return "ticket/paymentForm";
	}
	@RequestMapping("movieTheater50") // 상영관 1관
	public String movieTheater50() {
		return "ticket/movieTheater50"; 
	}
	@RequestMapping("movieTheater70") // 상영관 2관
	public String movieTheater70() {
		return "ticket/movieTheater70";
	}
	@RequestMapping("movieTheater80") // 상영관 3관
	public String movieTheater80() {
		return "ticket/movieTheater80";
	}
	@RequestMapping("movieTheater90") // 상영관 4관
	public String movieTheater90() {
		return "ticket/movieTheater90";
	}
	@RequestMapping("movieTheater100") // 상영관 5관
	public String movieTheater100() {
		return "ticket/movieTheater100";
	}
	@RequestMapping("payment")
	public String payment(Model model, String totalPrice, String m_title, String t_title, String mt_num2, String sc_num2, String adult_ticket, String youth_ticket, String selectList1) {
		// 나중에 회원에서 사용가능하는 쿠폰 있는지 확인 하기
		Movie movie = ms.selectTitle(m_title);
		Theater theater = tts.selectTitle(t_title);
		int mt_num = Integer.parseInt(mt_num2);
		int sc_num = Integer.parseInt(sc_num2);
		MovieTheater movieTheater = ss.selectMovieTheaterFind(mt_num, sc_num);
		Screen screen = ss.select(sc_num, mt_num);
		
		if(adult_ticket =="null" || adult_ticket.equals("") || adult_ticket=="0") {
			adult_ticket ="0";
		}
		if(youth_ticket =="null" || youth_ticket.equals("") || youth_ticket=="0") {
			youth_ticket ="0";
		}
		
		model.addAttribute("movie", movie);
		model.addAttribute("theater", theater);
		model.addAttribute("movieTheater", movieTheater);
		model.addAttribute("screen", screen);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("adult_ticket", adult_ticket);
		model.addAttribute("youth_ticket", youth_ticket);
		model.addAttribute("selectList1", selectList1);
		return "ticket/payment";
	}
	@RequestMapping("ticketInsert") // 예매
	public String ticketInsert(Model model, String m_title, String sc_num, String mt_num, String t_title, String adult_ticket, String youth_ticket, String t_sale, String totalPrice, String selectList, HttpSession session) {	
		String member_id = (String)session.getAttribute("member_id"); // session에 저장된 id를 가져오기
		int ticket=0; int result=0; int t_sale1=0; String st_name =""; int adult_ticket1 = 0; int youth_ticket1 = 0; int totalPrice1 = Integer.parseInt(totalPrice);
		String t_deal = "계좌"; // 추후에 바꿀것 
		/* int t_sale1 = Integer.parseInt(t_sale); */ // 추후에 바꿀것
		
		/*
		 * if(t_sale == null || t_sale.equals("")) { t_sale1 = 0; }
		 */
		if(adult_ticket =="null" || adult_ticket.equals("") || adult_ticket=="0") {
			adult_ticket1 =0;
		}else {
			adult_ticket1 = Integer.parseInt(adult_ticket);
		}
		if(youth_ticket =="null" || youth_ticket.equals("") || youth_ticket=="0") {
			youth_ticket1 =0;
		}else {
			youth_ticket1 = Integer.parseInt(youth_ticket);
		}
		Movie movie = ms.selectTitle(m_title);
		Theater theater = tts.selectTitle(t_title);
		MovieTheater movieTheater = ss.selectMovieTheaterFind(Integer.parseInt(mt_num), Integer.parseInt(sc_num));
		Screen screen = ss.select(Integer.parseInt(sc_num), Integer.parseInt(mt_num));
		String[] selectList1 = selectList.split(","); // 문자열을 배열에 담아서 넘긴다
 		for(int i=0; i<selectList1.length; i++) {
 			String seat = selectList1[i]; // 좌석을 하나씩 담아서
 			ss.newInsertSeat(Integer.parseInt(sc_num), seat); // 하나씩 넣어준다 리턴값음 없음 
 		}
		ticket = ts.insertTicket(adult_ticket1, youth_ticket1, t_sale1, member_id, screen.getSc_date(),selectList, Integer.parseInt(sc_num)); // 예매가 되면 1이됨
		Ticket ticket1 = ts.selectBank(selectList, member_id, Integer.parseInt(sc_num)); // 자리가 잘 들어가면
		int bank = ts.insertBank(totalPrice1,t_deal,member_id,ticket1.getT_ordernum()); // bank 테이블에 돈을 넣음
		
		model.addAttribute("bank", bank);
		model.addAttribute("movie", movie);
		model.addAttribute("theater", theater);
		model.addAttribute("movieTheater", movieTheater);
		model.addAttribute("screen", screen);
		model.addAttribute("totalPrice1", totalPrice1);
		model.addAttribute("adult_ticket", adult_ticket1);
		model.addAttribute("youth_ticket", youth_ticket1);
		model.addAttribute("ticket", ticket);
		
		return "ticket/ticketInsert";
	}
	//예매시 조회
	@RequestMapping("memberTicket") 
	public String memberTicket(Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		List<Ticket> ticket = ts.memberTicketList(member_id); // 예매한 전체 리스트를 보여줌
		
		model.addAttribute("ticket", ticket);	
		return "/member/memberTicket";
	}
	//예매조회때 의 상세보기
	@RequestMapping("memberTicketView")
	public String memberTicketView(Model model, int sc_num, String t_state, int t_ordernum) {
		Screen screen = ss.selectSeat(sc_num); // 상영번호로 그 해당하는 (상영)의 정보를 다 가져옴
		MovieTheater movieTheater = ts.selectMovieTheater(screen.getMt_num(),screen.getT_num()); // 상영에 있는 상영관 번호와 극장번호로 (상영관)에 대한 정보를 다가져옴
		Theater theater = ts.selectTheater(screen.getT_num()); // 상영에 있는 극장번호로 (극장)에 대한 정보를 다 가져옴
		Movie movie = ts.selectMovie(screen.getM_num()); // 상영에 있는 영화번호로(영화)에 대한 정보를 다 가져옴
		String[] seatList = t_state.split(","); // A1,A2,A3 하나의 문자를 ,로 잘라서 배열에 담는다
		
			
		model.addAttribute("screen", screen);
		model.addAttribute("movieTheater", movieTheater);
		model.addAttribute("theater", theater);
		model.addAttribute("movie", movie);
		model.addAttribute("t_state", t_state); //구매했던 좌석들도 함께 넘겨줌
		model.addAttribute("t_ordernum", t_ordernum); // 예매번호
		model.addAttribute("seatList", seatList); // 좌석들인데 그냥 보여주기식으로 넘김
		return "member/memberTicketView";
	}
	//희주(추가) 환불
	@RequestMapping("memberTicketRefund")
	public String memberTicketRefund(Model model, int t_ordernum, int sc_num, String t_state, HttpSession session) {
		// t_state = 환불하려는 좌석 
		String member_id = (String)session.getAttribute("member_id");
		
		//Screen screen = ss.selectSeat(sc_num); // 일단 찾고
		String[] st_num = t_state.split(","); //"A1, A2" 로 되어있는걸 배열로 담는다
		for(int i=0; i<st_num.length; i++) {
			ss.deleteSeatReFund(st_num[i], sc_num); // for문으로 있는 좌석 일단 삭제 됨
		}		
		int bankRefund = ss.bankReFund(t_ordernum, member_id);
		int ticket = ss.ticketReFund(t_ordernum, sc_num);
		model.addAttribute("ticket", ticket);
		return "member/memberTicketRefund";
	}
	
	
	//이벤트 페이지
	@RequestMapping("eventForm")
	public String eventForm(Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		List<Event> eventList = ss.eventList();
		
		model.addAttribute("member_id", member_id);
		model.addAttribute("eventList", eventList);
		return "event/eventForm";
	}
	//이벤트 추가폼
	@RequestMapping("eventInsertForm")
	public String eventInsertForm(Model model) {
		//값 넘어갈거 없나? ㅇㅋ
		return "event/eventInsertForm";
	}
	
	//이벤트 추가
	@RequestMapping("eventInsert")
	public String eventInsert(Event event,Model model,HttpSession session)throws IOException  {		
		if(!event.getFile().isEmpty()) {
			String event_poster = event.getFile().getOriginalFilename();
			
			String real = session.getServletContext().getRealPath("/resources/images/event");
			String path = real + "/" + event_poster; 
			
			
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(event.getFile().getBytes());
			fos.close();
			
			event.setE_poster(event_poster);
	
		} 
		int result = ss.insertEvent(event);

		model.addAttribute("result", result);
		
		return "event/eventInsert";
	}
	//운영자 리스트
	@RequestMapping("eventList")
	public String eventList(Model model) {
		List<Event_over> event_overList = ss.Event_overList(); //대기자들만 검색할까?
		
		model.addAttribute("event_overList", event_overList);
		return "event/eventList";
	}
	
	//이벤트 클릭시 참여한 사람인지 체크 (없으면 바로 이벤트 대기로 ㄱㄱ)
	@RequestMapping("eventPart")
	public String eventPart(Model model, int e_num, HttpSession session) {
		int result = 0; 
		String member_id = (String)session.getAttribute("member_id");
		List<Event_over> eventFind = ss.eventFind(e_num, member_id); // 이벤트에 참여한 기록이 없다면
		if(eventFind.size() >0) { // 값이 있으면 이벤트에 이미 참여하였음
			result = -1;
		}else {
			result = ss.event_overInsert(e_num, member_id);
		}
		model.addAttribute("result", result);
		return "event/eventPart";
	}
	
	//쿠폰 발급
	@RequestMapping("Issued")
	public String Issued(Model model, int eo_num) {
		int result = ss.rankUp(eo_num);
		
		model.addAttribute("result", result);
		return "event/Issued";
	}
	//쿠폰 발급
	@RequestMapping("cancel")
	public String cancel(Model model, int eo_num) {
		int result = ss.eventCancel(eo_num);
		
		model.addAttribute("result", result);
		return "event/cancel";
	}
	// 이벤트 수정 및 삭제 페이지(마스터기준)
	@RequestMapping("eventListUpdate")
	public String eventListUpdate(Model model) {
		List<Event> event = ss.eventList(); // 이벤트 리스트 불러옴
		
		model.addAttribute("event", event);
		return "event/eventListUpdate";
	}
	
	// 이벤트 수정
	@RequestMapping("eventUpdateForm")
	public String eventUpdate(Model model, int e_num) {
		Event event = ss.selectEvent(e_num);
		
		model.addAttribute("event" , event);
		return "event/eventUpdateForm";
	}
	//이벤트 결과
	@RequestMapping("eventUpdate")
	public String eventUpdate(Model model, Event event, HttpSession session)throws IOException  {
		if(!event.getFile().isEmpty()) {
			String event_poster = event.getFile().getOriginalFilename();
			
			String real = session.getServletContext().getRealPath("/resources/images/event");
			String path = real + "/" + event_poster; 
			
			
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(event.getFile().getBytes());
			fos.close();
			
			event.setE_poster(event_poster);
		} 
		int result = ss.eventUpdate(event); // 수정 되면 1
		model.addAttribute("result", result);
		return "event/eventUpdate";
	}
	//이벤트 삭제
	@RequestMapping("eventDelete")
	public String eventdelete(Model model, int e_num) {
		int result = ss.eventDelete(e_num);
		
		model.addAttribute("result", result);
		return "event/eventDelete";
	}
	//회원 쿠폰 사용 리스트
	@RequestMapping("memberCouponForm")
	public String memberCouponForm(Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		List<Event_over> coupon = ss.coupon(member_id);
		
		model.addAttribute("coupon", coupon);
		return "event/memberCouponForm";
	}
}