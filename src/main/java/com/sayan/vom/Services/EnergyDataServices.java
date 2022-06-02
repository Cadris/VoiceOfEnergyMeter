package com.sayan.vom.Services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sayan.vom.Entities.EnergyData;
import com.sayan.vom.Repositories.EnergyDataRepository;

@Service
public class EnergyDataServices {
	
	@Autowired
	EnergyDataRepository repo;

	/**
	 * Use to save a Record to Entry
	 * 
	 * @param ob
	 * @return
	 */
	public boolean save(EnergyData ob) {
		ob.setStatus("NORMAL");
		ob.setInsertDate(new Date());
		
		EnergyData temp = repo.getLastEntry();
		temp.setStatus("CANCEL");
		repo.save(temp);
		
		repo.save(ob);
		
		return true;
	}
	
	public EnergyData getLastDataInserted() {
		return repo.getLastEntry();
	}
	
	public List<EnergyData> getAllData(){
		return repo.findAll();
	}
	
	public boolean onlySave(EnergyData ob) {
		if(repo.getAllNormalEntry().size() > 0) {
			return false;
		}
		
		ob.setStatus("NORNAL");
		ob.setInsertDate(new Date());
		repo.save(ob);
		
		return true;
	}
}
