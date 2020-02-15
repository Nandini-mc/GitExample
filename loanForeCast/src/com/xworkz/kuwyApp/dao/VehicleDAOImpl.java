package com.xworkz.kuwyApp.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xworkz.kuwyApp.entity.VehicleEntity;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class VehicleDAOImpl implements IVehicleDAO{

	@Autowired
	private SessionFactory factory;
	
	public VehicleEntity getVehicleByMFGModelBrandNVariant(String brand, int mfgYear, String model, String variant) {
		try(Session session = factory.openSession()){
			Query query = session.createQuery("FROM VehicleEntity WHERE mfgYear = :mfg AND model =:model AND brand =:brand AND variant = :variant");
			query.setParameter("mfg", mfgYear);
			query.setParameter("model", model);
			query.setParameter("brand", brand);
			query.setParameter("variant", variant);
			return (VehicleEntity) query.uniqueResult();
		}catch (HibernateException e) {
			log.error("message is {} and exception is {}", e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<Integer> getDistinctYear() {
		try(Session session = factory.openSession()){
			Query query = session.createQuery("SELECT distinct(mfgYear) FROM VehicleEntity");
			return query.list();
		}catch (HibernateException e) {
			log.error("message is {} and exception is {}", e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<String> getDistinctBrandByYear(Integer mfgYear) {
		try(Session session = factory.openSession()){
			Query query = session.createQuery("SELECT distinct(brand) FROM VehicleEntity where mfgYear=:year");
			query.setParameter("year", mfgYear);
			return query.list();
		}catch (HibernateException e) {
			log.error("message is {} and exception is {}", e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<String> getDistinctModelbyBrand(Integer mfgYear, String brand) {
		try(Session session = factory.openSession()){
			Query query = session.createQuery("SELECT distinct(model) FROM VehicleEntity where mfgYear=:year and brand=:brand");
			query.setParameter("year", mfgYear);
			query.setParameter("brand", brand);
			return query.list();
		}catch (HibernateException e) {
			log.error("message is {} and exception is {}", e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<String> getAllDistinctVariantByBrandNYearNModel(Integer mfgYear, String brand, String model) {
		try(Session session = factory.openSession()){
			Query query = session.createQuery("SELECT distinct(variant) FROM VehicleEntity where mfgYear=:year and brand=:brand and model=:model");
			query.setParameter("year", mfgYear);
			query.setParameter("brand", brand);
			query.setParameter("model", model);
			return query.list();
		}catch (HibernateException e) {
			log.error("message is {} and exception is {}", e.getMessage(), e);
		}
		return null;
	}

}
