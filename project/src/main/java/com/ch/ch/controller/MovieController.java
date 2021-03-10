package com.ch.ch.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.ch.ch.model.Movie;
import com.ch.ch.model.Review;
import com.ch.ch.model.Stillcut;
import com.ch.ch.service.MovieService;
import com.ch.ch.service.PagingBean;
import com.ch.ch.service.ReviewService;

@Controller
public class MovieController {
	@Autowired
	private MovieService ms;
	
	@Autowired
	private ReviewService rvs;
	
	//영화 메인
	@RequestMapping("movieMainForm")
	public String movieMainForm(String pageNum, Movie movie, Model model, String m_state) {
		if (pageNum == null || pageNum.equals("") || pageNum == "0") {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 4;
		int total = ms.getTotal(movie);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		movie.setStartRow(startRow);
		movie.setEndRow(endRow);

		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		
		List<Movie> movieList = ms.moviePage(movie);
		
		model.addAttribute("pb", pb);
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
	
	//영화 목록 추가 결과 (글 작성 + 포스터 / 스틸컷 업로드)
	@RequestMapping("movieInsert")
	public String movieInsert(Movie movie, Model model, HttpServletRequest request, 
			 HttpSession session, MultipartHttpServletRequest mr) throws IOException { 
		int result = 0;
		
		Movie mv = ms.select(movie.getM_num());
		
		if (mv == null) {
			if(!movie.getFile().isEmpty()) {
				String m_poster = movie.getFile().getOriginalFilename();			
				String real = request.getSession().getServletContext().getRealPath("/resources/images/m_poster");
				String path = real + "/" + m_poster;
				
				FileOutputStream fos = new FileOutputStream(path);
				fos.write(movie.getFile().getBytes());
				fos.close();
				
				movie.setM_poster(m_poster);	
			}
			
			String real1 = session.getServletContext().getRealPath("/resources/images/stillcut");
			
			List<MultipartFile> list = mr.getFiles("file1");
			List<Stillcut> photos = new ArrayList<Stillcut>();
			
			for (MultipartFile mf : list) {
				Stillcut st = new Stillcut();
				
				String m_stillcut = mf.getOriginalFilename();
				
				st.setM_stillcut(m_stillcut);
				st.setM_num(movie.getM_num());
				
				photos.add(st);
				
				FileOutputStream fos = new FileOutputStream(new File(real1 + "/" + m_stillcut));
				fos.write(mf.getBytes());
				fos.close();
				
				movie.setM_stillcut(m_stillcut);;
			}
			
			result = ms.insert(movie);
			
			ms.insertPhoto(photos);
		
		} else result = -1;
		
		model.addAttribute("result", result);
		
		return "movie/movieInsert";
	}
	
	//영화 상세보기 + 한줄평 리스트(with. 페이징)
	@RequestMapping("/movieView")
	public String movieView(String pageNum, Review review, int m_num, Model model) {
		Movie movie = ms.select(m_num);
		
		if (pageNum == null || pageNum.equals("") || pageNum == "0") {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;
		int total = rvs.getTotal(review);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		review.setStartRow(startRow);
		review.setEndRow(endRow);

		PagingBean rpb = new PagingBean(currentPage, rowPerPage, total);

		List<Review> rvList = rvs.list(review);
		
		int tot = rvs.count(review);
		int hap = rvs.sum(review);
		
		double grade = hap/(double)tot;
		
		List<Stillcut> list = ms.listPhoto(m_num);
		
		model.addAttribute("list", list);
		model.addAttribute("tot", tot);
		model.addAttribute("grade", grade);
		model.addAttribute("rpb", rpb);
		model.addAttribute("movie", movie);
		model.addAttribute("rvList", rvList);
		
		return "movie/movieView";
	}
	
	// 한줄평 작성
	@RequestMapping("/rInsert.do")
	public String rInsert(Review rv) {
		rvs.insert(rv);
	
		return "redirect:/movieView.do?m_num=" + rv.getM_num();
	}

	// 한줄평 삭제
	@RequestMapping("rDelete.do")
	public String rDelete(Review rv) {
		rvs.delete(rv.getRe_num());

		return "redirect:/movieView.do?m_num=" + rv.getM_num();
	}

	// 한줄평 수정
	@RequestMapping("rUpdate.do")
	public String rUpdate(Review rv) {
		rvs.update(rv);

		return "redirect:/movieView.do?m_num=" + rv.getM_num();
	}
	
	//영화 수정 작성 폼
	@RequestMapping("movieUpdateForm")
	public String movieUpdateForm(int m_num, Model model) {
		Movie movie = ms.select(m_num);

		List<Stillcut> list = ms.listPhoto(m_num);

		model.addAttribute("list", list);
		model.addAttribute("movie", movie);
		 
		return "movie/movieUpdateForm";
	}
	
	//영화 수정 결과 (글 + 이미지 수정)
	 @RequestMapping("movieUpdate") 
	 public String movieUpdate(Movie movie, Stillcut stillcut, String file1,
			 Model model, HttpServletRequest request) throws IOException { 
		 
		 int result = 0;
		 
		 String m_poster = movie.getFile().getOriginalFilename();
		 
		 if (m_poster != null && !m_poster.equals("")) { 
			 movie.setM_poster(m_poster);
	 
			 String real = request.getSession().getServletContext().getRealPath("/resources/images/m_poster");
			 String path = real + "/" + m_poster;
	
			 FileOutputStream fos = new FileOutputStream(path);
			 fos.write(movie.getFile().getBytes());
			 fos.close();
	  
		 } else result = -1;
		 
		 result = ms.update(movie);
		 
		 model.addAttribute("result", result);
		
		 return "movie/movieUpdate";
	 }
	 
	 @RequestMapping("allMovieList")
	 public String allMovieList(Model model) {
		 List<Movie> list = ms.allMovieList();
		 
		 model.addAttribute("list", list);
		 
		 return "movie/allMovieList";
	 }
}
