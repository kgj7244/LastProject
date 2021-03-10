package com.ch.ch.service;

import java.util.List;

import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Theater;

public interface TheaterService {

	List<Theater> locList(Theater theater);

	List<Theater> selectTheater(String id);

	Theater selectTitle(String t_title);

	List<Theater> List();

	List<Theater> listT_loc();
	
	int insert(Theater theater);

	List<Theater> select(String t_loc, String t_title);

	List<String> titleList();

	List<MovieTheater> movieTheaterList();

	int numInsert(String mt_name, int mt_count, int t_num);
}
