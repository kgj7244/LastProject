package com.ch.ch.model;

import java.util.Date;

import lombok.Data;

@Data
public class Ticket {
	private int t_ordernum; //예매번호
	private int t_adult;    //성인예매수
	private int t_teen;     //청소년예매수
	private int t_sale;     //사용포인트
	private String t_id;    //예매ID
	private Date t_date;    //예매일
	private String t_state; //예매상태	
}
