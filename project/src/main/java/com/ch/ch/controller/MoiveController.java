package com.ch.ch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.ch.service.MoiveService;

@Controller
public class MoiveController {
	@Autowired
	private MoiveService ms;
}
