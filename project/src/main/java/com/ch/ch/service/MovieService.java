package com.ch.ch.service;

import java.util.List;
import com.ch.ch.model.Movie;
import com.ch.ch.model.Review;
import com.ch.ch.model.Stillcut;

public interface MovieService {
	List<Movie> list();
	
	Movie select(int m_num);

	int insert(Movie movie);

	Movie selectTitle(String m_title);

	int getTotal(Review review); // 실험 리뷰

	List<Review> list1(int m_num); // 실험 리스트

	int update(Movie movie);

	void insertPhoto(List<Stillcut> photos);

	List<Stillcut> listPhoto(int m_num);

	List<Movie> movieMainList(); //희주추가
}
