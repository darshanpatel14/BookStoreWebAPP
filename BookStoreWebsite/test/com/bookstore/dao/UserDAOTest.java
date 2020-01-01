package com.bookstore.dao;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Users;

public class UserDAOTest {
	
	private static  EntityManagerFactory entityManagerFactory;
	private static  EntityManager entityManager;
	private UserDAO userDAO;
	
	@BeforeClass
	public static void setupClass() {
EntityManagerFactory entityManagerFactory=Persistence.createEntityManagerFactory("BookStoreWebsite");
		
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		UserDAO userDAO = new UserDAO(entityManager);
	}

	@Test
	public void testCreateUsers() {
		

		Users user1 = new Users();
		
		user1.setEmail("new1@gmail.com");
		user1.setFullName("new1");
		user1.setPassword("----1");
		
		
		
		user1 = userDAO.create(user1);
		
		
		assertTrue(user1.getUserId()>0);
		
	}
		
		@Test
		public void testCreateUsersFieldsNotSet() {

			Users user1 = new Users();
			
		
			user1 = userDAO.create(user1);
			
		
			
		}
		
		@Test
		public void testGetUsersFound() {
			Integer userId=1;
			Users user = userDAO.get(userId);
			
			assertNotNull(user);
		}
		
		@AfterClass
		public static void tearDownClass() {

			entityManager.close();
			entityManagerFactory.close();
			
		}
	

}
