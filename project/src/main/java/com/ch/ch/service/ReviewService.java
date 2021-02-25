package com.ch.ch.service;

import java.util.List;
import com.ch.ch.model.Review;

public interface ReviewService {
	List<Review> list(int m_num);

	void insert(Review rv);

	void delete(int re_num);

	void update(Review rv);

}
