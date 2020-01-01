package com.bookstore.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import com.bookstore.entity.Users;

public class UserDAO extends JpaDAO<Users> implements GenericDAO<Users> {

	public UserDAO(EntityManager entityManager) {
		super(entityManager);
		// TODO Auto-generated constructor stub
	}
	
	public Users create(Users t) {
		return super.create(t);
	}

	@Override
	public Users update(Users t) {
		// TODO Auto-generated method stub
		return super.update(t);
	}

	@Override
	public Users get(Object userId) {
		
		return super.find(Users.class, userId);
	}

	@Override
	public void delete(Object userId) {
		
		super.delete(Users.class, userId);
	}

	@Override
	public List<Users> listAll() {
		
		return super.findNamedQuery("Users.findAll");
	}

	@Override
	public long count() {
		
		return  super.countWithNamedQuery("Users.countAll");
	}
	
	public Users findByEmail(String email) {
		List<Users> listUsers =  super.findNamedQuery("Users.findByEmail","email",email);
		
		if(listUsers != null && listUsers.size() > 0) {
			return listUsers.get(0);
		}
		
		return null;
	}
	
	public boolean checkLogin(String email,String  password) {
		
		Map<String,Object> parameters = new HashMap<>();
		parameters.put("email", email);
		parameters.put("password", password);
		
		List<Users> listUsers =super.findNamedQuery("Users.checkLogin", parameters);
		
		if(listUsers.size() == 1) {
			return true;
		}
		
		return false;
	}

	

}
