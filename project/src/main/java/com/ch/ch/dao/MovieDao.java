package com.ch.ch.dao;

import java.util.List;
import com.ch.ch.model.Movie;
import com.ch.ch.model.Review;

public interface MovieDao {
	List<Movie> list();

	Movie select(int m_num);

	int insert(Movie movie);

	Movie selectTitle(String m_title);

	int getTotal(Review review);

	List<Review> list1(int m_num);

	int update(Movie movie);
}
