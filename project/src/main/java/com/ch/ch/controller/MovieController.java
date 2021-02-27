package com.ch.ch.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ch.ch.model.Movie;
import com.ch.ch.model.Review;
import com.ch.ch.service.MovieService;
import com.ch.ch.service.ReviewPagingBean;
import com.ch.ch.service.ReviewService;

@Controller
public class MovieController {
	@Autowired
	private MovieService ms;
	@Autowired
	private ReviewService rvs;
	
	//영화 메인
	@RequestMapping("movieMainForm")
	public String movieMainForm(Model model){
		List<Movie> movieList = ms.list();
		
		model.addAttribute("movieList", movieList);
		
		return "movie/movieMainForm";
	}
	
	//영화 목록 추가 작성 폼
	@RequestMapping("movieInsertForm")
	public String movieInsertForm() {
		return "movie/movieInsertForm";
	}

	//영화번호 중복 체크
	@RequestMapping(value="numChk", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String numChk(int m_num) {
		String data = "";
		
		Movie movie = ms.select(m_num);
		
		if(movie == null) data = "사용 가능한 영화번호입니다.";
		else data = "이미 사용 중인 영화번호입니다. 다른 영화번호를 입력해주세요";
		
		return data;
	}
	
	//영화 목록 추가 결과 (글 작성 + 이미지 업로드)
	@RequestMapping("movieInsert")
	public String movieInsert(Movie movie, Model model, HttpServletRequest request) throws IOException { 
		if(!movie.getFile().isEmpty()) {
			String m_poster = movie.getFile().getOriginalFilename();			
			String real = request.getSession().getServletContext().getRealPath("/resources/images/m_poster");
			String path = real + "/" + m_poster;
			
			System.out.println("path :" + path);
			
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(movie.getFile().getBytes());
			fos.close();
			
			movie.setM_poster(m_poster);	
		}
		System.out.println(movie);
		
		Movie mv = ms.select(movie.getM_num());
		int result = 0;
		
		if (mv == null) result = ms.insert(movie);
		else result = -1;
		
		model.addAttribute("result", result);
		
		return "movie/movieInsert";
	}
	
	//영화 상세보기
	@RequestMapping("movieView")
	public String movieView(String pageNum, Review review,int m_num, Model model) {
		Movie movie = ms.select(m_num);
		
		System.out.println("pageNum1 : " + pageNum);
		if (pageNum == null || pageNum.equals("") || pageNum == "0") {
			System.out.println("pageNum2 : " + pageNum);
			pageNum = "1";
			System.out.println("pageNum3 : " + pageNum);
		}

		int currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		int rowPerPage = 10;
		int total = rvs.getTotal(review);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);

		review.setStartRow(startRow);
		review.setEndRow(endRow);

		ReviewPagingBean rpb = new ReviewPagingBean(currentPage, rowPerPage, total);

		List<Review> rvList = rvs.list(m_num);

		model.addAttribute("rpb", rpb);
		model.addAttribute("movie", movie);
		model.addAttribute("rvList", rvList);
		
		
		model.addAttribute("movie", movie);
		
		return "movie/movieView";
	}
}
