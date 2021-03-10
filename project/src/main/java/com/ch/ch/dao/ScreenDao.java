package com.ch.ch.dao;

import java.sql.Date;
import java.util.List;

import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Screen;
import com.ch.ch.model.Seat;
import com.ch.ch.model.Theater;

public interface ScreenDao {

	List<Screen> selectTitleList(int movie_num, int theater_num, String sc_date);

	int selectCnt(int t_num);

	Screen select(int sc_num, int mt_num);

	MovieTheater selectMovieTheater(int mt_num, String sc_start, String sc_date);

	MovieTheater selectMovieTheaterFind(int mt_num, int sc_num);

	List<MovieTheater> list();

	MovieTheater selectTitle(String mt_name, int t_num);

	int screenInsert(int m_num, int t_num, int mt_num, String sc_date, String sc_start, String sc_end);

	Screen selectSeat(int sc_num);

	int insertSeat(String st_name, int sc_num);

	int screenReFund(int sc_num, String seat);

	int bankReFund(int t_ordernum, String member_id);

	int ticketReFund(int t_ordernum, int sc_num);

	//새로운
	void newInsertSeat(int sc_num, String seat);

	List<Seat> seatFind(int sc_num);

	void deleteSeatReFund(String st_num, int sc_num);

	Theater selectTheater(String t_title);

	List<MovieTheater> mTheater(int t_num);

}
