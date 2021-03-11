package com.ch.ch.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Ord {
	private int ord_num;		
	private String member_id;	
	private int s_num;		

	private int s_purchase;  //수량
	private int full_price; //총 금액
	private Date buy_date;	 //구매 날짜
	private Date s_validity; //유통기한 sysdate+365
	private String buy_i;	//구매여부
	private String del;		//환불여부

	private String t_account; //입금 (거래번호
	
	private String s_Pname;
}
