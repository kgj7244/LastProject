package com.ch.ch.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.ch.dao.MovieDao;
import com.ch.ch.model.Movie;
import com.ch.ch.model.Stillcut;

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

	public int update(Movie movie) {
		return md.update(movie);
	}
	
	public void insertPhoto(List<Stillcut> photos) {
		md.insertPhoto(photos);
	}
	
	public List<Stillcut> listPhoto(int m_num) {
		return md.listPhoto(m_num);
	}
	
	public int getTotal(Movie movie) {
		return md.getTotal(movie);
	}
	
	public List<Movie> movieMainList() { // 희주 추가
		return md.movieMainList();
	}
	
	public List<Movie> moviePage(Movie movie) {
		return md.moviePage(movie);
	}
	
	public List<Movie> allMovieList(Movie movie) {
		return md.allMovieList(movie);
	}
	
	public int allMovieTotal(Movie movie) {
		return md.allMovieTotal(movie);
	}
	
	@Override
	public void gradeupdate(Movie movie) {
		md.gradeupdate(movie);
	}
}
