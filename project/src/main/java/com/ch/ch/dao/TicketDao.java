package com.ch.ch.dao;

import java.sql.Date;
import java.util.List;

import com.ch.ch.model.Movie;
import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Theater;
import com.ch.ch.model.Ticket;

public interface TicketDao {

	List<Movie> select();

	int insertTicket(int adult_ticket, int youth_ticket, int t_sale1, String member_id, Date sc_date, String selectList, int sc_num);

	Ticket selectBank(String selectList,String member_id, int sc_num);

	int insertBank(int totalPrice1, String t_deal, String member_id, int t_ordernum);
	
	List<Ticket> memberTicketList(String member_id); //희주 추가

	MovieTheater selectMovieTheater(int mt_num, int t_num); //희주 추가

	Theater selectTheater(int t_num); //희주 추가

	Movie selectMovie(int m_num); // 희주추가

}
