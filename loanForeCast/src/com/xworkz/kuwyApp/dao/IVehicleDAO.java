package com.xworkz.kuwyApp.dao;

import java.util.List;

import com.xworkz.kuwyApp.entity.VehicleEntity;

public interface IVehicleDAO {

	VehicleEntity getVehicleByMFGModelBrandNVariant(String brand, int mfgYear, String model, String variant);

	List<Integer> getDistinctYear();

	List<String> getDistinctBrandByYear(Integer mfgYear);

	List<String> getDistinctModelbyBrand(Integer mfgYear, String brand);
	
	List<String> getAllDistinctVariantByBrandNYearNModel(Integer mfgYear, String brand,String model);

}
