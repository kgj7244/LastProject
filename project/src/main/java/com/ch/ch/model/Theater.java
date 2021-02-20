package com.ch.ch.model;

import lombok.Data;

@Data
public class Theater {
	private int t_num; //극장번호
	private String t_title; //이름
	private String t_loc; //위치(주소)
	private String t_info; //시설 정보
	private String t_gui; //시설 안내
}
