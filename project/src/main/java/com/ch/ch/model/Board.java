package com.ch.ch.model;

import java.sql.Date;

import lombok.Data;
@Data
public class Board {
	private int b_num; // 게시글 번호
	private String member_id; // 아이디
	private String b_title; // 제목
	private String b_content; // 내용
	private String b_lock; // 비밀글여부
	private String b_password; // 암호
	private int b_readcount; // 조회수
	private Date b_date; // 작성일
	private String b_code; // 카테고리(회원/예매/스토어/기타)
	private String b_del; // 삭제여부
	// paging용
	private int startRow;
	private int endRow;
	// search용
	private String search;
	private String keyword;
}
