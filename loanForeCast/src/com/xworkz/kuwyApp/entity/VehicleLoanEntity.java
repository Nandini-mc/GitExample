package com.xworkz.kuwyApp.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "vehicle_loan_detail")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class VehicleLoanEntity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name = "key", strategy = "increment")
	@GeneratedValue(generator = "key")
	private int vehicleLoanId;

	private Boolean isUsedVehicle = true;
	/* 1=private 2 = texi */
	private int vehicleType;

	private Boolean isPurchased = true;

	private String location;

	private int ownerShip;
	/* 1=exce , 2 = good , 3= average , 4 = bad */
	private int vehicleCondition;

	private long vehiclePrice;

	private int personAge;

	/*
	 * 1 = salaried , 1 = professional , 2 = business , 2 = self employed , 2
	 * =aggriculture
	 */
	private int customerProfile;

	/*
	 * 1 - {17000 - 25000} 2 - {25001 - 35000} 3 - {35001 - 50000} 4 - {50001 -
	 * 75000} 5 - {75001 - 100000}
	 * 
	 */
	private int monthlyIncome;

	private long loanAmount;

	private String maxDownPayment;

	private int existEmi;

	private int affordability;

	/* 1= self owned , 2 = rented house , 3 = parent house */
	private int customerHouseType;

	private Boolean isHaveIncomeProof;

	/* 1 = no guarentor , 2 =family , 3 = blood relatives , 4= friends */
	private int guarantor;

	private String cusLocationName;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "vehicle_id")
	private VehicleEntity vehicle;

	@PrePersist()
	public void prePersist() {
		if(getIsPurchased()==null) {
			setIsPurchased(true);
		}
		if(getIsUsedVehicle()==null) {
			setIsUsedVehicle(true);
		}
	
	}
	
	@Override
	public String toString() {
		return "VehicleLoanEntity [vehicleLoanId=" + vehicleLoanId + ", isUsedVehicle=" + isUsedVehicle
				+ ", vehicleType=" + vehicleType + ", isPurchased=" + isPurchased + ", location=" + location
				+ ", ownerShip=" + ownerShip + ", vehicleCondition=" + vehicleCondition + ", vehiclePrice="
				+ vehiclePrice + ", personAge=" + personAge + ", customerProfile=" + customerProfile
				+ ", monthlyIncome=" + monthlyIncome + ", loanAmount=" + loanAmount + ", maxDownPayment="
				+ maxDownPayment + ", existEmi=" + existEmi + ", affordability=" + affordability
				+ ", customerHouseType=" + customerHouseType + ", isHaveIncomeProof=" + isHaveIncomeProof
				+ ", guarantor=" + guarantor + ", cusLocationName=" + cusLocationName + "]";
	}

}
