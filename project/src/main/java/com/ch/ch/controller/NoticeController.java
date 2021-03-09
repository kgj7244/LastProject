package com.ch.ch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.ch.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService ns;
}
