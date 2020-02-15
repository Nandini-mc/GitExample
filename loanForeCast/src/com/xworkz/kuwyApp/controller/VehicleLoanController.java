package com.xworkz.kuwyApp.controller;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.xworkz.kuwyApp.dto.VehicleLoanDTO;
import com.xworkz.kuwyApp.service.IVehicleLoanService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class VehicleLoanController {

	//update
	
	@Autowired
	private IVehicleLoanService iVehicleLoanService;

	@PostMapping("/saveVehicleLoanData.do")
	public String saveVehicleLoanData(VehicleLoanDTO dto) {
		log.info("DTO IS {}", dto);
		Serializable ser=  iVehicleLoanService.saveVehicleLoanData(dto);
		return null;
	}

}
