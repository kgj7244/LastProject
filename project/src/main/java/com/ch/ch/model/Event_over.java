package com.ch.ch.model;

import lombok.Data;
@Data
public class Event_over {
	private int eo_num; //중복체크 번호
	private String member_id; //아이디
	private String eo_state; //상태
	private int e_num; //이벤트번호
}
