package com.bookstore.dao;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

public class ReviewDAOTest {

	private static ReviewDAO reviewDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		BaseDAOTest.setUpBeforeClass();
		reviewDAO = new ReviewDAO();
		
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		
		BaseDAOTest.tearDownAfterClass();
	}

	

	@Test
	public void testCreateReview() {
		
		Review review  = new Review();
		
		Book book =new Book();
		book.setBookId(3);
		
		Customer customer  = new Customer();
		customer.setCustomerId(2);
		
		review.setCustomer(customer);
		review.setBook(book);
		review.setHeadline("This is very Good Book");
		review.setRating(5);
		review.setComment("I have just read this book ,very good");
		
		Review savedReview =reviewDAO.create(review);
		
		assertTrue(savedReview.getReviewId() > 0);
		
	}

	@Test
	public void testUpdateReview() {
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
