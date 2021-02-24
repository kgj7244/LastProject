package com.ch.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.ch.dao.ReviewDao;
import com.ch.ch.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao rvd;
	
	public List<Review> list(int m_num) {
		return rvd.list(m_num);
	}
	
	public void insert(Review rv) {
		rvd.insert(rv);
	}
}
