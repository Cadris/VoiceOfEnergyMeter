package com.sayan.vom.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class IndexController {
	
	@GetMapping("/page/{value}")
	public String valueDisplay(@PathVariable("value")String value, Model model) {
		model.addAttribute("value", value);
		model.addAttribute("valueCost", value);
		
		return "index";
	}

}
