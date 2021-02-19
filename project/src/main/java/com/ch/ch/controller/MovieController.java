package com.ch.ch.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.ch.ch.model.Movie;
import com.ch.ch.service.MovieService;

@Controller
public class MovieController {
	@Autowired
	private MovieService ms;
	
	@RequestMapping("movieMainForm")
	public String movieMainForm(Model model){
		List<Movie> movieList = ms.list();
		
		model.addAttribute("movieList", movieList);
		
		return "movie/movieMainForm";
	}
	
	@RequestMapping("movieInsertForm")
	public String movieInsertForm() {
		return "movie/movieInsertForm";
	}
	
	@RequestMapping("movieInsert")
	public String movieInsert(@RequestParam("m_poster") MultipartFile mf, 
			Model model, Movie movie, HttpSession session) throws IOException {
		Movie mv = ms.select(movie.getM_num());
		
		int result = 0;
		
		if (mv == null) result = ms.insert(movie);
		else result = -1;
		
		String m_poster = mf.getOriginalFilename();
		String real = session.getServletContext().getRealPath("/resources/images/m_poster");
		
		FileOutputStream fos = new FileOutputStream(new File(real + "/" + m_poster));
		fos.write(mf.getBytes());
		fos.close();
		
		model.addAttribute("result", result);
		model.addAttribute("m_poster", m_poster);
		
		return "movie/movieInsert";
	}
}
