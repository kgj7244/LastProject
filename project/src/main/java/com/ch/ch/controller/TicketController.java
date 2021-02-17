package com.ch.ch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch.service.TicketService;

@Controller
public class TicketController {
	@Autowired
	private TicketService ts;
	@RequestMapping("ticketMainForm")
	public String ticketMainForm() {
		return "ticket/ticketMainForm";
	}
}
