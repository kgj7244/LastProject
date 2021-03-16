package com.ch.ch.model;

import lombok.Data;

@Data
public class Theater {
	private int t_num; //극장번호 
	private String t_title; //이름 
	private String t_loc; //지역
	private String t_content; //극장 정보 
	private String t_floor; //층별 안내 
	private String t_addr; //주소(극장주소) 
	private String t_number; //전화번호 
	private String t_gui; //시설 안내 
}
