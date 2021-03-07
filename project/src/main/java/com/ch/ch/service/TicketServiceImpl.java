package com.ch.ch.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.TicketDao;
import com.ch.ch.model.Movie;
import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Theater;
import com.ch.ch.model.Ticket;

@Service
public class TicketServiceImpl implements TicketService{
	@Autowired
	private TicketDao td;
	public List<Movie> select() {
		return td.select();
	}
	public int insertTicket(int adult_ticket, int youth_ticket, int t_sale1, String member_id, Date sc_date, String selectList,
			int sc_num) {
		return td.insertTicket(adult_ticket, youth_ticket, t_sale1, member_id, sc_date,selectList, sc_num);
	}
	public Ticket selectBank(String member_id, int sc_num) {
		return td.selectBank(member_id, sc_num);
	}
	public int insertBank(int totalPrice1, String t_deal, String member_id, int t_ordernum) {
		return td.insertBank(totalPrice1, t_deal, member_id, t_ordernum);
	}
	
	public List<Ticket> memberTicketList(String member_id) { //희주 추가(예매리스트)
		return td.memberTicketList(member_id);
	}
	public MovieTheater selectMovieTheater(int mt_num, int t_num) { //희주 추가(상영관검색)
		return td.selectMovieTheater(mt_num, t_num);
	}
	public Theater selectTheater(int t_num) {
		return td.selectTheater(t_num);
	}
	public Movie selectMovie(int m_num) {
		return td.selectMovie(m_num);
	} 
}
