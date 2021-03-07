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
	
	public List<Review> list(Review review) { 
		return rvd.list(review); 
	}
	
	public void insert(Review rv) {
		rvd.insert(rv);
	}
	
	public void delete(int re_num) {
		rvd.delete(re_num);
	}
	
	public void update(Review rv) {
		rvd.update(rv);
	}
	
	 public int getTotal(Review review) {
		 return rvd.getTotal(review); 
	}
	
	public int count(Review review) {
		return rvd.count(review);
	}
	
	public int sum(Review review) {
		return rvd.sum(review);
	}
}
