package com.ch.ch.dao;

import java.util.List;
import com.ch.ch.model.Movie;

public interface MovieDao {
	List<Movie> list();

	Movie select(int m_num);

	int insert(Movie movie);

	Movie selectTitle(String m_title);
}
