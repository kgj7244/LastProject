package com.ch.ch.service;

import java.util.List;
import com.ch.ch.model.Review;

public interface ReviewService {
 	List<Review> list(Review review);

	void insert(Review rv);

	void delete(int re_num);

	void update(Review rv);

	int getTotal(Review review);

	int count(Review review);

	int sum(Review review);
}
