package com.xworkz.kuwyApp.dao;

import java.io.Serializable;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xworkz.kuwyApp.entity.VehicleLoanEntity;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class VehicleLoanDAOImpl implements IVehicleLoanDAO {

	@Autowired
	private SessionFactory factory;
	
	@Override
	public Serializable saveVehicle(VehicleLoanEntity entity) {
		try(Session session = factory.openSession();){
			Transaction transaction = session.beginTransaction();
			Serializable res = session.save(entity);
			transaction.commit();
			log.info("Data is {}",res);
			return res;
		}catch (HibernateException e) {
			log.error("Message is {} and exception is {}", e.getMessage(),e);
		}
		
		return null;
	}

}
