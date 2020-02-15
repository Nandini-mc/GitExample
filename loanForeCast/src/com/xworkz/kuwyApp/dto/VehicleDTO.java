package com.xworkz.kuwyApp.dto;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class VehicleDTO {

	
	private int mfgYear;
	private String brand;
	private String model;
	private String variant;
	
	
	private List<VehicleLoanDTO> vehicleLoans;
	
	@Override
	public String toString() {
		return "VehicleDTO [mfgYear=" + mfgYear + ", brand=" + brand + ", model=" + model + ", variant=" + variant
				+ "]";
	}
	
	
	
}
