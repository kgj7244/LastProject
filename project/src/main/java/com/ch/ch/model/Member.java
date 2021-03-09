package com.ch.ch.model;



import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private String member_id; //아이디
	private String member_password; //비번
	private String member_name; //이름 
	private String member_gender; //성별
	private Date member_birth;  //생년월일 관람등급
	private String member_email; //이메일
	private String member_number; //휴대전화
	private String member_addr; //주소
	private Date member_date; //가입일
	private String member_del; //탈퇴여부
	// paging용
	private int startRow;
	private int endRow;
	// search용
	private String search;
	private String keyword;
}
