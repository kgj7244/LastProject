package com.ch.ch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch.service.StoreService;

@Controller
public class StoreController {
	@Autowired
	private StoreService ss;
	@RequestMapping("storeMainForm")
	public String storeMainForm() {
		return "store/storeMainForm";
	}
}
