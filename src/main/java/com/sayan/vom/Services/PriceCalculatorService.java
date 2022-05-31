package com.sayan.vom.Services;

import java.text.ParseException;

import org.springframework.stereotype.Service;

@Service
public class PriceCalculatorService {
	
	/**
	 * This function calculates the value based on the Tariff Charges for :: https://www.cesc.co.in/wp-content/uploads/tariff/Tariff%20and%20Associated%20terms%20and%20conditions%20for%202019-20.pdf 
	 * 
	 * @param value
	 * @return
	 */
	public double getPrice(String value) {
		double units;
		double costs = 0.0;
		try {
			units = Double.parseDouble(value);
		} catch (Exception pe) {
			return 0.0D;
		}
		
		if(units<=25.0) {
			costs = 5.18 * units;
		} else if(units<=60) {
			costs = (5.18*25) + (5.69*(60-25));
		} else if(units<=100) {
			costs = (5.18*25) + (5.69*35) + (6.7*(units-60));
		} else if(units<=150) {
			costs = (5.18*25) + (5.69*35) + (6.7*40) + (7.45*(units-100));
		} else if(units<=200) {
			costs = (5.18*25) + (5.69*35) + (6.7*40) + (7.45*50) + (7.62*(units-150));
		} else if(units<=300) {
			costs = (5.18*25) + (5.69*35) + (6.7*40) + (7.45*50) + (7.62*50) + (7.62*(units-200));
		} else {
			costs = (5.18*25) + (5.69*35) + (6.7*40) + (7.45*50) + (7.62*50) + (7.62*300) + (9.21*(units-300));
		}
		
		return costs;
	}
}
