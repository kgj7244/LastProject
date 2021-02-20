package com.ch.ch.dao;

import java.util.List;

import com.ch.ch.model.Moive;

public interface MoiveDao {

	List<Moive> select();

	Moive selectMovie(int m_num);

}
