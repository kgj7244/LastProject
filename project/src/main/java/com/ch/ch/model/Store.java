package com.ch.ch.model;


import java.sql.Date;

import lombok.Data;

@Data
public class Store {
	
	private int s_num;
	private String s_title;
	private String s_del;
	private String s_Pclass;
	private String s_Pname;
	private String s_Pconfig;
	private String s_Pimage;
	
	private Date s_per;
	private Date s_validity;
	
	private int s_total;
	private int s_purchase;
	private int s_prive;
	private int s_sale;
	private String del;
	
	private String t_account;

}
