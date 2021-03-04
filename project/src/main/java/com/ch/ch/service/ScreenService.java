package com.ch.ch.service;

import java.util.List;

import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Screen;

public interface ScreenService {

	List<Screen> selectTitleList(int movie_num, int theater_num, String sc_date);

	int selectCnt(int t_num);

	Screen select(int sc_num, int mt_num);

	MovieTheater selectMovieTheater(int mt_num, String sc_start, String sc_date);

	MovieTheater selectMovieTheaterFind(int mt_num, int sc_num);

	List<MovieTheater> list();

	MovieTheater selectTitle(String mt_name);

	int screenInsert(int m_num, int t_num, int mt_num, String sc_date, String sc_start, String sc_end);

}
