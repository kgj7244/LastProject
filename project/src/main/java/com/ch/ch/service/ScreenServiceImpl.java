package com.ch.ch.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.ScreenDao;
import com.ch.ch.model.Event;
import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Screen;
import com.ch.ch.model.Seat;
import com.ch.ch.model.Theater;

@Service
public class ScreenServiceImpl implements ScreenService{
	@Autowired
	private ScreenDao sd;
	public List<Screen> selectTitleList(int movie_num, int theater_num, String sc_date) {
		return sd.selectTitleList(movie_num, theater_num, sc_date);
	}
	public int selectCnt(int t_num) {
		return sd.selectCnt(t_num);
	}
	public Screen select(int sc_num, int mt_num) {
		return sd.select(sc_num, mt_num);
	}
	public MovieTheater selectMovieTheater(int mt_num, String sc_start, String sc_date) {
		return sd.selectMovieTheater(mt_num, sc_start, sc_date);
	}
	public MovieTheater selectMovieTheaterFind(int mt_num, int sc_num) {
		return sd.selectMovieTheaterFind(mt_num, sc_num);
	}
	public List<MovieTheater> list() {
		return sd.list();
	}
	public MovieTheater selectTitle(String mt_name, int t_num) {
		return sd.selectTitle(mt_name, t_num);
	}
	public int screenInsert(int m_num, int t_num, int mt_num, String sc_date, String sc_start, String sc_end) {
		return sd.screenInsert(m_num, t_num, mt_num, sc_date, sc_start, sc_end);
	}
	public Screen selectSeat(int sc_num) {
		return sd.selectSeat(sc_num);
	}
	public int insertSeat(String st_name, int sc_num) {
		return sd.insertSeat(st_name, sc_num);
	}
	public int screenReFund(int sc_num, String seat) {
		return sd.screenReFund(sc_num, seat);
	}
	public int bankReFund(int t_ordernum, String member_id) {
		return sd.bankReFund(t_ordernum, member_id);
	}
	public int ticketReFund(int t_ordernum, int sc_num) {
		return sd.ticketReFund(t_ordernum, sc_num);
	}

	
	// 새로운거
	public void newInsertSeat(int sc_num, String seat) {
		sd.newInsertSeat(sc_num, seat);
	}
	public List<Seat> seatFind(int sc_num) {
		return sd.seatFind(sc_num);
	}
	public void deleteSeatReFund(String st_num, int sc_num) {
		sd.deleteSeatReFund(st_num, sc_num);	
	}
	public Theater selectTheater(String t_title) {
		return sd.selectTheater(t_title);
	}
	public List<MovieTheater> mTheater(int t_num) {
		return sd.mTheater(t_num);
	}
	public int insertEvent(Event event) {
		return sd.insertEvent(event);
	}
	public List<Event> eventList() {
		return sd.eventList();
	}

}
