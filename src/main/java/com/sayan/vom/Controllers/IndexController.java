package com.sayan.vom.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.sayan.vom.Entities.EnergyData;
import com.sayan.vom.Repositories.EnergyDataRepository;
import com.sayan.vom.Services.PriceCalculatorService;

@Controller
public class IndexController {
	
	@Autowired
	PriceCalculatorService calcService;
	
	@Autowired
	EnergyDataRepository edRepo;
	
	@GetMapping("/home")
	public String valueDisplay(Model model) {
		
		EnergyData ed = edRepo.getLastEntry();
		
		model.addAttribute("value", ed.getPower());
		model.addAttribute("valueCost", calcService.getPrice(ed.getPower()));
		
		return "index";
	}
	
	@GetMapping("/manualEntryWeb")
	public String manualEntryWeb(Model model) {
		return "manualEntryWeb";
	}
	
	@GetMapping("/dataChartWeb")
	public String dataChartWeb(Model model) {
		List<EnergyData> dataList = edRepo.findAllReverseOrder();
		
		model.addAttribute("dataList", dataList);
		return "dataChart";
	}
	

}
