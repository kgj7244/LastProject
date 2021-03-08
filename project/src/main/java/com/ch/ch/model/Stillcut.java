package com.ch.ch.model;

import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class Stillcut {
	private int sc_num;
	private int m_num;
	private String m_stillcut;
	
	private MultipartFile file1;
}
