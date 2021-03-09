package com.ch.ch.service;

import java.util.List;
import com.ch.ch.model.Movie;
import com.ch.ch.model.Stillcut;

public interface MovieService {
	List<Movie> list();
	
	Movie select(int m_num);

	int insert(Movie movie);

	Movie selectTitle(String m_title);

	int update(Movie movie);

	void insertPhoto(List<Stillcut> photos);

	List<Stillcut> listPhoto(int m_num);

	int getTotal(Movie movie);

	List<Movie> movieMainList(); //희주추가

	List<Movie> moviePage(Movie movie);
}
