package com.bookstore.dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.bookstore.entity.Catagory;

public class CatagoryDAO extends JpaDAO<Catagory> implements GenericDAO<Catagory> {

	public CatagoryDAO() {
		
		
	}
	
	public Catagory create(Catagory catagory) {
		
		return super.create(catagory);
	}

	public Catagory update(Catagory t) {
		return super.update(t);
	}
	
	@Override
	public Catagory get(Object id) {
		return super.find(Catagory.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Catagory.class, id);
		
	}

	@Override
	public List<Catagory> listAll() {
		
		return super.findNamedQuery("Catagory.findAll");
	}

	@Override
	public long count() {
		return  super.countWithNamedQuery("Catagory.countAll");
	}
	
	public Catagory findByName(String catagoryName) {
		
		List<Catagory> result = super.findNamedQuery("Catagory.findByName","name",catagoryName);
		
		if(result != null && result.size() >0) {
			return result.get(0);
		}
		
		return null; 
	}

}
