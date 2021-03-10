package com.ch.ch.model;

import java.sql.Date;

import lombok.Data;
@Data
public class Notice {
	private int n_num; //공지 번호
	private String n_branch; // 지점
	private String n_title; //공지 제목
	private String n_content; //공지 내용
	private Date n_date; //공지 등록일
	private String n_del; // 삭제 여부
	// paging용
	private int startRow;
	private int endRow;
	// search용
	private String search;
	private String keyword;
}
