package com.sayan.vom.Entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class EnergyData {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	private double power;
	
	private String status;
	
	private String entryMode;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date insertDate;
	
	public EnergyData() {}

	public EnergyData(int id, double power, String status, String entryMode, Date insertDate) {
		super();
		this.id = id;
		this.power = power;
		this.status = status;
		this.entryMode = entryMode;
		this.insertDate = insertDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getPower() {
		return power;
	}

	public void setPower(double power) {
		this.power = power;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEntryMode() {
		return entryMode;
	}

	public void setEntryMode(String entryMode) {
		this.entryMode = entryMode;
	}

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	
	
	
}
