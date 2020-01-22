package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Customer;

public class CustomerDAOTest {
	
	private static CustomerDAO customerDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		BaseDAOTest.setUpBeforeClass();
		customerDAO = new CustomerDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		
		BaseDAOTest.tearDownAfterClass();
	}

	@Test
	public void testCreateCustomer() {
		
		Customer customer  = new Customer();
		
		customer.setEmail("Amit@gmail.com");
		customer.setFullname("Amit patel");
		customer.setCity("Junagadh");
		customer.setCountry("india");
		customer.setAddress("Manavadar");
		customer.setPassword("123");
		customer.setPhone("123456789");
		customer.setZipcode("362625");
		
		Customer savedCustomer  = customerDAO.create(customer);
		
		assertTrue(savedCustomer.getCustomerId() > 0);
	}

	@Test
	public void testGet() {
		
		Integer customerId = 1;
		
		Customer customer = customerDAO.get(customerId);
		
		assertNotNull(customer);
	}
	
	@Test
	public void testUpdateCustomer() {
		
		String fullName = "Darshan Patel";
		
		Customer customer  = customerDAO.get(1);
		
		customer.setFullname(fullName);
		
		Customer updatedCustomer = customerDAO.update(customer);
		
		assertTrue(updatedCustomer.getFullname().equals(fullName));
		
		
		
	}

	@Test
	public void testDeleteCustomer() {
		
		Integer customerId = 1;
		
		customerDAO.delete(customerId);
		
		Customer customer  = customerDAO.get(1);
		
		assertNull(customer);
	}
	
	@Test
	public void testListAll() {
		
		List<Customer> listCustomer = customerDAO.listAll();
		
		for(Customer customer:listCustomer) {
			
			System.out.println(customer.getFullname());
		}
		
		assertFalse(listCustomer.isEmpty());
		
	}
	
	@Test
	public void testCount() {
		
		long totalCustomers  = customerDAO.count();
		
		assertEquals(2,totalCustomers);
		
	}
	
	@Test
	public void testFindByEmail() {
		
		String email = "Darsha@gmail.com";
		
		Customer customer  = customerDAO.findByEmail(email);
		
		assertNotNull(customer);
		
	}
	
	@Test
	public void testCheckLoginSuccess() {
		
		String email = "Darshan@gmail.com";
		String password = "123";
		
		Customer customer  = customerDAO.checkLogin(email, password);
		
		assertNotNull(customer);
	}
	
	@Test
	public void testCheckLoginFail() {
		

		String email = "Darshan1@gmail.com";
		String password = "123";
		
		Customer customer  = customerDAO.checkLogin(email, password);
		
		assertNull(customer);
		
	}

}
