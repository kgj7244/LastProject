package com.ch.ch.service;

import java.util.List;
import com.ch.ch.model.Movie;

public interface MovieService {
	List<Movie> list();
	
	Movie select(int m_num);

	int insert(Movie movie);
}
