package com.ch.ch.dao;

import java.util.List;

import com.ch.ch.model.Movie;

public interface MoiveDao {

	List<Movie> select();

	Movie selectMovie(int m_num);

}
