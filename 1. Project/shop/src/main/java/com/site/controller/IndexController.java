package com.site.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController
{

	@RequestMapping("")
	public String main() {
		return "redirect:/index";
	}
}
