package com.ch.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.MovieDao;
import com.ch.ch.model.Movie;
import com.ch.ch.model.Review;

@Service
public class MovieServiceImpl implements MovieService{
	@Autowired
	private MovieDao md;
	
	public List<Movie> list() {
		return md.list();
	}
	
	public Movie select(int m_num) {
		return md.select(m_num);
	}
	
	public int insert(Movie movie) {
		return md.insert(movie);
	}
	public Movie selectTitle(String m_title) {
		return md.selectTitle(m_title);
	}

	public int getTotal(Review review) {
		return md.getTotal(review);
	}

	public List<Review> list1(int m_num) {
		return md.list1(m_num);
	}
	
	public int update(Movie movie) {
		return md.update(movie);
	}
}
