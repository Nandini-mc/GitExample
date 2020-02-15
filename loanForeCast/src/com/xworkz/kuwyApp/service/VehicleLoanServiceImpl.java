package com.xworkz.kuwyApp.service;

import java.io.Serializable;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xworkz.kuwyApp.dao.IVehicleDAO;
import com.xworkz.kuwyApp.dao.IVehicleLoanDAO;
import com.xworkz.kuwyApp.dto.VehicleLoanDTO;
import com.xworkz.kuwyApp.entity.VehicleEntity;
import com.xworkz.kuwyApp.entity.VehicleLoanEntity;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class VehicleLoanServiceImpl implements IVehicleLoanService{

	@Autowired
	private IVehicleLoanDAO iVehicleLoanDAO;
	@Autowired
	private IVehicleDAO iVehicleDAO;
	
	public Serializable saveVehicleLoanData(VehicleLoanDTO dto) {
		VehicleLoanEntity entity = new VehicleLoanEntity();
		BeanUtils.copyProperties(dto, entity);
		log.info("entity is {}",entity);
		entity = this.convertData(dto,entity);
		
		return iVehicleLoanDAO.saveVehicle(entity);
	}

	private VehicleLoanEntity convertData(VehicleLoanDTO dto, VehicleLoanEntity entity) {
		VehicleEntity vehicleEntity = iVehicleDAO.getVehicleByMFGModelBrandNVariant(dto.getBrand(),dto.getMfgYear(), dto.getModel(), dto.getVariant());
		vehicleEntity.getVehicleLoans().add(entity);
		entity.setVehicle(vehicleEntity);
		return entity;
	}
	
	
}
