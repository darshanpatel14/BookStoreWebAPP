package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

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
		book.setBookId(2);
		
		Customer customer  = new Customer();
		customer.setCustomerId(4);
		
		review.setCustomer(customer);
		review.setBook(book);
		review.setHeadline("This is Good Book");
		review.setRating(3);
		review.setComment("I have just read this book ,very good");
		
		Review savedReview =reviewDAO.create(review);
		
		assertTrue(savedReview.getReviewId() > 0);
		
	}

	@Test
	public void testUpdateReview() {
		
		Integer reviewId =1;
		
		Review review =reviewDAO.get(reviewId);
		
		review.setHeadline("Excellent book");
		
		Review updatedReview = reviewDAO.update(review);
		
		assertEquals(review.getHeadline(),updatedReview.getHeadline());
	}

	@Test
	public void testGet() {
		
		Integer reviewId =1;
		
		Review review =reviewDAO.get(reviewId);
		
		assertNotNull(review);
	}

	@Test
	public void testDeleteReview() {
		
		int reviewId = 7 ;
		reviewDAO.delete(reviewId);
		
		Review review = reviewDAO.get(reviewId);
		
		assertNull(review);	
		
	}

	@Test
	public void testListAll() {
		
		List<Review> listReview  = reviewDAO.listAll();
		
		for(Review review:listReview) {
			
			System.out.println(review.getReviewId() + " " + review.getBook().getTitle() + " " + review.getCustomer().getFullname());
		}
		
		assertTrue(listReview.size() > 0);
	}

	@Test
	public void testCount() {
		
		long totalReview = reviewDAO.count();
		
		System.out.println("Total reviews : "  + totalReview);
		
		assertTrue(totalReview > 0); 
		
	}
	
	@Test
	public void testFindByCustomerAndBook() {
		
		Integer customerId = 5;
		Integer bookId = 22;
		
		Review result = reviewDAO.findByCustomerAndBook(customerId, bookId);
		
		assertNotNull(result);
	}

}
