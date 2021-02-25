package com.ch.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.ScreenDao;
import com.ch.ch.model.Screen;

@Service
public class ScreenServiceImpl implements ScreenService{
	@Autowired
	private ScreenDao sd;
	public List<Screen> selectTitleList(int movie_num, int theater_num, String sc_date) {
		return sd.selectTitleList(movie_num, theater_num, sc_date);
	}
}
