package com.ch.ch.model;

import java.util.Date;

import lombok.Data;

@Data
public class Ticket {
	private int t_ordernum; //주문번호
	private int	m_num; //영화번호
	private String t_account; //계좌번호
	private String member_id; //회원 아이디
	private int t_adult; //성인 예매수
	private int	t_teen; //청소년 예매수
	private int t_sale; //할인
	private String m_title; //영화제목
	private Date t_date; //날짜	
	private int t_num; //극장번호
	private String t_seat; //좌석번호
	private String t_time; //시간
	private String t_addr; //지역
}
