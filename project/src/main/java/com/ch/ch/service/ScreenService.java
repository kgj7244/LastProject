package com.ch.ch.service;

import java.util.List;

import com.ch.ch.model.Screen;

public interface ScreenService {

	List<Screen> selectTitleList(int movie_num, int theater_num, String sc_date);

}
