package com.sayan.vom.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.sayan.vom.Entities.EnergyData;

@Repository
public interface EnergyDataRepository extends JpaRepository<EnergyData, Integer> {
	
	@Query(value = "SELECT * FROM Energy_Data ORDER BY id DESC LIMIT 1", nativeQuery = true)
	public EnergyData getLastEntry();
	
	@Query("SELECT ed FROM EnergyData ed WHERE ed.entryMode='SCREEN' ORDER BY ed.id DESC")
	public List<EnergyData> getAllScreenEntry();
	
	@Query("SELECT ed FROM EnergyData ed WHERE ed.entryMode='API' ORDER BY ed.id DESC")
	public List<EnergyData> getAllAPIEntry();
	
	@Query("SELECT ed FROM EnergyData ed WHERE ed.status='NORMAL' ORDER BY ed.id DESC")
	public List<EnergyData> getAllNormalEntry();
	
	@Query("SELECT ed FROM EnergyData ed WHERE ed.status='CANCEL' ORDER BY ed.id DESC")
	public List<EnergyData> getAllCancelEntry();
	
	@Query("SELECT ed FROM EnergyData ed ORDER BY ed.id DESC")
	public List<EnergyData> findAllReverseOrder();
		
}
