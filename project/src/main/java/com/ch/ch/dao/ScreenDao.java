package com.ch.ch.dao;

import java.util.List;

import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Screen;

public interface ScreenDao {

	List<Screen> selectTitleList(int movie_num, int theater_num, String sc_date);

	int selectCnt(int t_num);

	Screen select(int sc_num);

}
