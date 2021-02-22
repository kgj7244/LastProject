package com.ch.ch.model;


import java.sql.Date;

import lombok.Data;

@Data
public class Store {
	
	private int s_num;		//게시글 번호
	
	// #
//	private String s_title;	  //게시글 제목
	private String s_del;	  //게시글 삭제여부
	// #
	
	private String s_Pclass;  //상품 분류
	private String s_Pname;	  //상품 이름
	private String s_Pconfig; //상품구성
	private String s_Pimage;
	
	private Date s_per;		//판매기간
	private Date s_validity; //유효기간
	
	private int s_total; 	//총 판매수량
	private int s_purchase; //구매수량
	private int s_prive;	//가격
	private int s_sale;		//할인율
	private String del; 	//구매취소 여부
	
	private String t_account; //입금 (거래번호
	
	

}
