package com.ch.ch.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ch.ch.model.Movie;
import com.ch.ch.model.Review;
import com.ch.ch.service.MovieService;
import com.ch.ch.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService rvs;
	
	@Autowired
	private MovieService ms;
	
	//한줄평 리스트
	@RequestMapping("/reviewList/m_num/{m_num}")
	public String reviewList(@PathVariable int m_num, Model model) {
		Movie movie = ms.select(m_num);
		List<Review> rvList = rvs.list(m_num);
		System.out.println("rvList : " + rvList);
		
		model.addAttribute("movie", movie);
		model.addAttribute("rvList", rvList);
		
		return "movie/reviewList";
	}
	
	//한줄평 작성
	@RequestMapping("/rInsert")
	public String rInsert(Review rv) {
		rvs.insert(rv);
		
		return "redirect:/movie/reviewList/m_num/" + rv.getM_num();
	}
	
	//한줄평 삭제
	@RequestMapping("rDelete")
	public String rDelete(Review rv) {
		rvs.delete(rv.getRe_num());
		
		return "redirect:/movie/reviewList/m_num/" + rv.getM_num();
	}
	
	//한줄평 수정
	@RequestMapping("rUpdate")
	public String rUpdate(Review rv) {
		rvs.update(rv);
		
		return "redirect:/movie/reviewList/m_num/" + rv.getM_num();
	}
}
