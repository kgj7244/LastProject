package com.ch.ch.dao;

import java.util.List;

import com.ch.ch.model.Theater;

public interface TheaterDao {

	List<Theater> locList(Theater theater);

	List<Theater> selectTheater(String id);

	Theater selectTitle(String t_title);

	List<Theater> list();
	
}
