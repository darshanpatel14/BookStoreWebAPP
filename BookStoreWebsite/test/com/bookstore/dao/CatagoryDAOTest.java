package com.bookstore.dao;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Catagory;

public class CatagoryDAOTest {
	
	private static  EntityManagerFactory entityManagerFactory;
	private static  EntityManager entityManager;
	private static CatagoryDAO catagoryDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
EntityManagerFactory entityManagerFactory=Persistence.createEntityManagerFactory("BookStoreWebsite");
		
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		catagoryDao= new  CatagoryDAO(entityManager);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		
		entityManager.close();
		entityManagerFactory.close();
	}

	@Test
	public void testCreateCatagory() {
		
		Catagory  newCat= new Catagory("Python");
		Catagory  catagory = catagoryDao.create(newCat);
		
		assertTrue(catagory != null && catagory.getCatagoryId() > 0);
	}

	@Test
	public void testUpdateCatagory() {
		fail("Not yet implemented");
	}

	@Test
	public void testGet() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteObject() {
		fail("Not yet implemented");
	}

	@Test
	public void testListAll() {
		fail("Not yet implemented");
	}

	@Test
	public void testCount() {
		fail("Not yet implemented");
	}

}
