package com.xworkz.kuwyApp.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.xworkz.kuwyApp.dto.VehicleLoanDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "vehicle_detail")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class VehicleEntity implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private int vehicleId;
	private int mfgYear;
	private String brand;
	private String model;
	private String variant;
	
	@OneToMany(cascade = CascadeType.ALL , fetch = FetchType.EAGER)
	@JoinColumn(name="vehicle_id")
	private List<VehicleLoanEntity> vehicleLoans;

	@Override
	public String toString() {
		return "VehicleEntity [mfgYear=" + mfgYear + ", brand=" + brand + ", model=" + model + ", variant=" + variant
				+ "]";
	}
	
	
	
}
