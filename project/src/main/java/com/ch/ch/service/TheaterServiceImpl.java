package com.ch.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.TheaterDao;
import com.ch.ch.model.MovieTheater;
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
	public int insert(Theater theater) {
		return td.insert(theater);
	}
	public List<String> titleList() {
		return td.titleList();
	}
	public List<MovieTheater> movieTheaterList() {
		return td.movieTheaterList();
	}
	public int numInsert(String mt_name, int mt_count, int t_num) {
		return td.numInsert(mt_name, mt_count, t_num);
	}
	public List<Theater> select(String t_loc, String t_title) {
		return td.select(t_loc, t_title);
	}
	public java.util.List<Theater> locList(String t_loc) {
		return td.locList(t_loc);
	}
	public Theater theaterView(int t_num) {
		return td.theaterView(t_num);
	}
}
