package com.ch.ch.model;

import java.util.Date;
import lombok.Data;

@Data
public class Review {
	private int re_num;
	private String re_con;
	private int re_grade;
	private Date re_date;
	private Date re_update;
	private String member_id;
	private int m_num;
	private String re_del;	
}
