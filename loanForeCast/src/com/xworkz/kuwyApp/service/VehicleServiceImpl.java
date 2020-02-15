package com.xworkz.kuwyApp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xworkz.kuwyApp.dao.IVehicleDAO;

@Service
public class VehicleServiceImpl implements IVehicleService{
	
	@Autowired
	private IVehicleDAO iVehicleDAO;
	
	@Override
	public List<Integer> getDistinctYear() {
		return iVehicleDAO.getDistinctYear();
	}

	@Override
	public List<String> getDistinctBrand(Integer mfgYear) {
		
		return iVehicleDAO.getDistinctBrandByYear(mfgYear);
	}

	@Override
	public List<String> getDistinctModelbyBrand(Integer mfgYear, String brand) {
		
		return iVehicleDAO.getDistinctModelbyBrand(mfgYear, brand);
	}

	@Override
	public List<String> getAllDistinctVariantByBrandNYearNModel(Integer mfgYear, String brand, String model) {
		return iVehicleDAO.getAllDistinctVariantByBrandNYearNModel(mfgYear, brand, model);
	}

}
