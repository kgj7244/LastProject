package com.ch.ch.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ch.ch.model.Movie;
import com.ch.ch.model.Review;
import com.ch.ch.model.Stillcut;

@Repository
public class MovieDaoImpl implements MovieDao{
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<Movie> list() {
		return sst.selectList("moviens.list");
	}
	
	public Movie select(int m_num) {
		return sst.selectOne("moviens.select", m_num);
	}
	
	public int insert(Movie movie) {
		return sst.insert("moviens.insert", movie);
	}
	
	public Movie selectTitle(String m_title) {
		return sst.selectOne("moviens.selectTitle", m_title);
	}
	
	public int getTotal(Review review) {
		return sst.selectOne("moviens.getTotal", review);
	}
	
	public List<Review> list1(int m_num) {
		return sst.selectList("moviens.list1", m_num);
	}
	
	public int update(Movie movie) {
		return sst.update("moviens.update", movie);
	}
	
	public void insertPhoto(List<Stillcut> photos) {
		for (Stillcut sc : photos) {
			sst.insert("moviens.insertPh", sc);	
		}
	}
	
	public List<Stillcut> listPhoto(int m_num) {
		return sst.selectList("moviens.listPhoto", m_num);
	}
}
