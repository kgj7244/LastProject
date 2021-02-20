package com.ch.ch.service;

import java.util.List;

import com.ch.ch.model.Movie;

public interface MoiveService {

	List<Movie> select();

	Movie selectMovie(int m_num);

}
