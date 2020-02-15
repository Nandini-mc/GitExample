package com.xworkz.kuwyApp.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class VehicleLoanDTO {
	
	private Boolean isUsedVehicle;
	/*  1=private 2 = texi  */
	private int vehicleType;
	
	private Boolean isPurchased;
	

	private int mfgYear;
	private String brand;
	private String model;
	private String variant;
	
	
	private String location;
	

	private int ownerShip;
	/* 1=exce , 2 = good , 3= average , 4 = bad */
	private int vehicleCondition;

	private long vehiclePrice; 

	private int personAge;
	
	/* 1 = salaried , 1 = professional , 2 = business , 2 = self employed , 2 =aggriculture  */
	private int customerProfile;
	
	/* 1 - {17000 - 25000}
	 * 2 - {25001 - 35000}
	 * 3 - {35001 - 50000}
	 * 4 - {50001 - 75000}
	 * 5 - {75001 - 100000}
	 *  
	 *  */
	private int monthlyIncome;
	
	private long loanAmount;
	
	private String maxDownPayment;
	
	private int existEmi;
	
	private int affordability;
	
	
	/* 1= self owned , 2 = rented house , 3 = parent house */
	private int customerHouseType;
	
	private Boolean isHaveIncomeProof;
	
	
	/* 1 = no guarentor , 2 =family , 3 = blood relatives , 4= friends  */
	private int guarantor;

	
	private String cusLocationName;
	
	
	private VehicleDTO vehicle;


	@Override
	public String toString() {
		return "VehicleLoanDTO [isUsedVehicle=" + isUsedVehicle + ", vehicleType=" + vehicleType + ", isPurchased="
				+ isPurchased + ", mfgYear=" + mfgYear + ", brand=" + brand + ", model=" + model + ", variant="
				+ variant + ", location=" + location + ", ownerShip=" + ownerShip + ", vehicleCondition=" + vehicleCondition
				+ ", vehiclePrice=" + vehiclePrice + ", personAge=" + personAge + ", customerProfile=" + customerProfile
				+ ", monthlyIncome=" + monthlyIncome + ", loanAmmount=" + loanAmount + ", maxDownPayment="
				+ maxDownPayment + ", exisEmi=" + existEmi + ", affordability=" + affordability + ", customerHouseType="
				+ customerHouseType + ", isHaveIncomeProof=" + isHaveIncomeProof + ", guarantor=" + guarantor
				+ ", cusLocationName=" + cusLocationName + "]";
	}

	
	
}
