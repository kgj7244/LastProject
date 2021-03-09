package com.ch.ch.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Screen {
	private int sc_num; //상영번호
	private Date sc_date; //상영일
	private String sc_start; //시작시간
	private String sc_end; //종료시간
	private int t_num; //극장번호
	private int mt_num; //상영관번호
	private int m_num; //영화번호 
	
	private String mt_name;//상영관이름
	
	private int cnt; // 좌석 갯수
}
