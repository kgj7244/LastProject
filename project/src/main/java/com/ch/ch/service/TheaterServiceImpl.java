package com.ch.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.TheaterDao;
import com.ch.ch.model.Theater;

@Service
public class TheaterServiceImpl implements TheaterService{
	@Autowired
	private TheaterDao td;
	public List<Theater> locList(Theater theater) {
		return td.locList(theater);
	}
	public List<Theater> selectTheater(String id) {
		return td.selectTheater(id);
	}
	public Theater selectTitle(String t_title) {
		return td.selectTitle(t_title);
	}
	public java.util.List<Theater> List() {
		return td.list();
	}
	public List<Theater> listT_loc() {
		return td.listT_loc();
	}
	
}
