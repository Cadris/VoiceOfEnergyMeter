package com.sayan.vom.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.sayan.vom.Services.PriceCalculatorService;

@Controller
public class IndexController {
	
	@Autowired
	PriceCalculatorService calcService;
	
	@GetMapping("/page/{value}")
	public String valueDisplay(@PathVariable("value")String value, Model model) {
		model.addAttribute("value", value);
		model.addAttribute("valueCost", calcService.getPrice(value));
		
		return "index";
	}

}
