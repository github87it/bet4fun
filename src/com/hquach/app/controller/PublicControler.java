package com.hquach.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/public")
public class PublicControler {
	
	@RequestMapping(value="/home", method = RequestMethod.GET)
	public String home() {
		return "Home";
	}

}
