package com.ch.ch.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Movie {
	private int m_num;
	private String m_title;
	private String m_content;
	private String m_rank;
	private Date m_opendate;
	private String m_state;
	private int m_time;
	private int m_grade;
	private String m_poster;
	private String m_director;
	private String m_actor;
	private String m_genre;
	private String m_stillcut;
	
	//포스터 upload용
	private MultipartFile file;
}
