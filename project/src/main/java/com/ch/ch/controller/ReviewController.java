package com.ch.ch.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ch.ch.model.Movie;
import com.ch.ch.model.Review;
import com.ch.ch.service.MovieService;
import com.ch.ch.service.ReviewPagingBean;
import com.ch.ch.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService rvs;

	@Autowired
	private MovieService ms;

	// 한줄평 리스트
	@RequestMapping("reviewList")
	public String reviewList(String pageNum, Review review, int m_num, Model model) {
		if (pageNum == null || pageNum.equals("") || pageNum == "0") {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		int rowPerPage = 10;
		int total = rvs.getTotal(review);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		review.setStartRow(startRow);
		review.setEndRow(endRow);

		ReviewPagingBean rpb = new ReviewPagingBean(currentPage, rowPerPage, total);

		Movie movie = ms.select(m_num);
		List<Review> rvList = rvs.list(m_num);

		model.addAttribute("rpb", rpb);
		model.addAttribute("movie", movie);
		model.addAttribute("rvList", rvList);

		return "movie/reviewList";
	}

	// 한`줄평 작성
	@RequestMapping("rInsert")
	public String rInsert(Review rv) {
		rvs.insert(rv);

		return "redirect:/reviewList.do?m_num=" + rv.getM_num();
	}

	// 한줄평 삭제
	@RequestMapping("rDelete")
	public String rDelete(Review rv) {
		rvs.delete(rv.getRe_num());

		System.out.print(rv.getM_num());

		return "redirect:/reviewList.do?m_num=" + rv.getM_num();
	}

	// 한줄평 수정
	@RequestMapping("rUpdate")
	public String rUpdate(Review rv) {
		rvs.update(rv);

		return "redirect:/reviewList.do?m_num=" + rv.getM_num();
	}
}
