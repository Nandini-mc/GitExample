package com.xworkz.kuwyApp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xworkz.kuwyApp.service.IVehicleService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class VehicleRestController {

	@Autowired
	private IVehicleService iVehicleService; 
	
	@GetMapping("/getAllDistYear.do")
	public ResponseEntity<List<Integer>> getDistictYear(){
		List<Integer> list =  iVehicleService.getDistinctYear();
		log.info("hi.............");
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	@GetMapping("/getAllDistBrandByYear.do")
	public ResponseEntity<List<String>> getAllDistBrandByYear(@RequestParam("mfgYear") Integer mfgYear){
		List<String> list=iVehicleService.getDistinctBrand(mfgYear);
		log.info("data is {}",list);
		return new ResponseEntity<>(list , HttpStatus.OK);
		
	}
	
	@GetMapping("/getAllDistinctModelByBrandNYear.do")
	public ResponseEntity<List<String>> getAllDistinctModelbyBrand(@RequestParam("mfgYear") Integer mfgYear, @RequestParam("brand") String brand ){
		List<String> list=iVehicleService.getDistinctModelbyBrand(mfgYear, brand);
		log.info("data is {}",list);
		return new ResponseEntity<>(list , HttpStatus.OK);
	}
	@GetMapping("/getAllDistinctVariantByBrandNYearNModel.do")
	public ResponseEntity<List<String>> getAllDistinctVariantByBrandNYearNModel(@RequestParam("mfgYear") Integer mfgYear, @RequestParam("brand") String brand, @RequestParam("model") String model ){
		List<String> list=iVehicleService.getAllDistinctVariantByBrandNYearNModel(mfgYear,brand,model);
		return new ResponseEntity<>(list,HttpStatus.OK);
		
	}
}
