package com.xworkz.kuwyApp.service;

import java.util.List;

public interface IVehicleService {

	List<Integer> getDistinctYear();

	List<String> getDistinctBrand(Integer mfgYear);

	List<String> getDistinctModelbyBrand(Integer mfgYear, String brand);

	List<String> getAllDistinctVariantByBrandNYearNModel(Integer mfgYear, String brand, String model);

}
