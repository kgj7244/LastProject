package com.ch.ch.model;


import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Store {
	
	private int s_num;		//게시글 번호	
	private String s_del;	//게시글 삭제여부
	private int s_Pclass;  	//상품 분류
	private String s_Pname;	  //상품 이름
	private String s_Pconfig; //상품구성
	private String s_Pimage; //이미지 이름
	private int s_purchase; //구매수량
	private int s_prive;	//가격
	private String del; 	//환불여부
	

	
	private Date s_per;		//판매기간 시작
	private Date s_pernd;	//판매기간 끝
	private int s_total; 	//총 판매수량
	private int s_sale;		//할인율
	
	private String t_account; //입금 (거래번호
	
	private MultipartFile file; //이미지 파일

	

}
