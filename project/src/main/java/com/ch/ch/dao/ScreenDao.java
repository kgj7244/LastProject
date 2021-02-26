package com.ch.ch.dao;

import java.util.List;

import com.ch.ch.model.Screen;

public interface ScreenDao {

	List<Screen> selectTitleList(int movie_num, int theater_num, String sc_date);

}
