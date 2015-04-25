package com.singthi.thisys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/home")
public class HomeController {
	
	@RequestMapping(value = {"","index"})
	public String toIndex() {
		return "home/index";
	}
	
}
