package com.sayan.vom.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sayan.vom.Entities.EnergyData;
import com.sayan.vom.Services.EnergyDataServices;

@Controller
@RequestMapping("/entry")
public class EntryControllers {
	
	@Autowired
	EnergyDataServices edService;

	@GetMapping("/api/{value}")
	public @ResponseBody boolean apiSave(@PathVariable("value")String value) {
		EnergyData ed = new EnergyData();
		
		ed.setEntryMode("API");
		ed.setPower(Double.parseDouble(value));
		
		edService.save(ed);
		
		System.out.println("Value Inserted :"+value);
		return true;
	}
	
	@GetMapping("/test/{value}")
	public @ResponseBody boolean apiTest(@PathVariable("value")String value) {
		System.out.println(value);
		return true;
	}
	
	@PostMapping("/screen")
	public String screenSave(@RequestParam ("value") String s_value) {
		double value = Double.parseDouble(s_value);
		
		EnergyData ed = new EnergyData();
		
		ed.setEntryMode("SCREEN");
		ed.setPower(value);
		
		edService.save(ed);
		System.out.println("Value Inserted :"+value);
		return "redirect:/home";
	}
	
}
