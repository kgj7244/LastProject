package com.ch.ch.model;

import java.sql.Date;

import lombok.Data;
@Data
public class Bank {
	
	private String t_account; // 입금번호
	private Date t_date; // 입금일
	private int t_price; // 금액
	private String t_deal; // 거래방법
	private String member_id; // 아이디
	private String aam_account; // 관리자계좌
	private int t_ordernum; // 예매번호
	private int ord_num; // 예매번호
	
	

}
