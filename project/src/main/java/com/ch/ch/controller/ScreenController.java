package com.ch.ch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.ch.service.ScreenService;

@Controller
public class ScreenController {
	@Autowired
	private ScreenService ss;
}
