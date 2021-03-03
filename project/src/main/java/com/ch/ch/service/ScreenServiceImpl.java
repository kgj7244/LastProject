package com.ch.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.ScreenDao;
import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Screen;

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
	public Screen select(int sc_num) {
		return sd.select(sc_num);
	}
	public MovieTheater selectMovieTheater(int mt_num) {
		return sd.selectMovieTheater(mt_num);
	}
}
