package com.ch.ch.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.ch.model.Member;
import com.ch.ch.model.Movie;
import com.ch.ch.service.MovieService;

@Controller
public class MovieController {
	@Autowired
	private MovieService ms;
	
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
	
	/*public String movieInsert(Movie movie, Model model, HttpServletRequest request) throws IOException { 
		System.out.println("movieInsert");
		if(!movie.getFile1().isEmpty()) {
			String fname = movie.getFile1().getOriginalFilename();			
			String path = request.getSession().getServletContext().getRealPath("/upload");
			String fpath = path + "/" + fname;
			
			System.out.println("fpath:"+fpath);
			FileOutputStream fs = new FileOutputStream(fpath);
			fs.write(movie.getFile1().getBytes());
			fs.close();
			
			movie.setPicUrl(fname);	
		}
		System.out.println(movie);
		int result = ms.insert(movie);
		model.addAttribute("result", result);
		return "movie/movieInsert";
	}	
	 * */
	
	//영화 목록 추가 결과
	@RequestMapping("movieInsert")
	public String movieInsert(Movie movie, Model model, HttpServletRequest request) throws IOException { 
//		String m_poster1 = movie.getFile().getOriginalFilename();
//
//		// 파일명 중복 방지
//		UUID uuid = UUID.randomUUID();
//		String m_poster = uuid + "_" + m_poster1;
//		
//		String real = session.getServletContext().getRealPath("/resources/images/m_poster");
//		
//		FileOutputStream fos = new FileOutputStream(new File(real + "/" + m_poster));
//		fos.write(movie.getFile().getBytes());
//		fos.close();
//		
//		model.addAttribute("m_poster", m_poster);
//		model.addAttribute("m_num", movie.getM_num());
//		model.addAttribute("m_title", movie.getM_title());
//		model.addAttribute("m_content", movie.getM_content());
//		model.addAttribute("m_rank", movie.getM_rank());
//		model.addAttribute("m_opendate", movie.getM_opendate());
//		model.addAttribute("m_state", movie.getM_state());
//		model.addAttribute("m_time", movie.getM_time());
//		model.addAttribute("m_director", movie.getM_director());
//		model.addAttribute("m_actor", movie.getM_actor());
//		model.addAttribute("m_genre", movie.getM_genre());
		
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
}
