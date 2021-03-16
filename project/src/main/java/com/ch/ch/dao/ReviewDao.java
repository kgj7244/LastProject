package com.ch.ch.dao;

import java.util.List;
import com.ch.ch.model.Review;

public interface ReviewDao {
	List<Review> list(Review review);

	void insert(Review rv);

	void delete(int re_num);

	void update(Review rv);

	int getTotal(Review review);

	int count(Review review);
}
