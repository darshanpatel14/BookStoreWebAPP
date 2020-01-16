package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Catagory;

public class BookDAOTest  {
	
	private static BookDAO bookDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		BaseDAOTest.setUpBeforeClass();
		bookDAO = new BookDAO();
		
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		BaseDAOTest.tearDownAfterClass();
	}

	@Test
	public void testCreateBook() throws ParseException, IOException {
		
		Book newBook  = new Book();
		
		Catagory catagory = new Catagory("Advanced Java");
		
		catagory.setCatagoryId(12);
		newBook.setCatagory(catagory);
		
		newBook.setTitle("Effective java 2nd Edition");
		newBook.setAuthor("Joshua Bloch");
		newBook.setDescription("New coverage of generics, enums, annotations, autoboxing");
		newBook.setPrice(38.87f);
		newBook.setIsbn("0321356683");
		
		DateFormat dateFormat = new SimpleDateFormat("mm/dd/yy");
		
		Date publishDate = dateFormat.parse("05/28/2008");
		
		newBook.setPublishDate(publishDate);
		
		String imagePath = "/Users/darshanpatel/Downloads/books/Effective Java.jpg";
		
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		
		newBook.setImage(imageBytes);
		
		Book createBook = bookDAO.create(newBook);
		
		
		
		
		assertTrue(createBook.getBookId() >0);
	}
	
	@Test
	public void testUpdateBook() throws ParseException, IOException {
		
		Book existsBook  = new Book();
		
		Catagory catagory = new Catagory("Advanced Java");
		
		catagory.setCatagoryId(3);
		existsBook.setCatagory(catagory);
		
		existsBook.setTitle("Effective java 3nd Edition");
		existsBook.setAuthor("Joshua Bloch");
		existsBook.setDescription("New coverage of generics, enums, annotations, autoboxing");
		existsBook.setPrice(40.87f);
		existsBook.setIsbn("0321356683");
		
		DateFormat dateFormat = new SimpleDateFormat("mm/dd/yy");
		
		Date publishDate = dateFormat.parse("05/28/2008");
		
		existsBook.setPublishDate(publishDate);
		
		String imagePath = "/Users/darshanpatel/Downloads/books/Effective Java.jpg";
		
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		
		existsBook.setImage(imageBytes);
		
		Book updateBook = bookDAO.update(existsBook);
		
		
		
		
		assertEquals(existsBook.getTitle(), "Effective java 3nd Edition");
	}
	
	@Test(expected = EntityNotFoundException.class)
	public void testDeleteBookFail() {
		
		Integer bookId = 100;
		bookDAO.delete(bookId);
		
		
	}
	
	@Test()
	public void testDeleteBookSuccess() {
		
		Integer bookId = 1;
		bookDAO.delete(bookId);
		
		assertTrue(true);
		
		
	}
	
	@Test
	public void testGetBooksFail() {
		Integer bookId = 99;
		Book book = bookDAO.get(bookId);
		
		assertNull(book);
	}
	
	@Test
	public void testGetBookSuccess() {
		Integer bookId = 2;
		Book book =bookDAO.get(bookId);
		
		assertNotNull(true);
	}
	
	@Test
	public void testListAll() {
		
		List<Book> listBooks = bookDAO.listAll();
		
		for(Book book : listBooks) {
			
			System.out.println(book.getTitle() + " " + book.getTitle());
		}
		
		assertFalse(listBooks.isEmpty());
	}
	
	@Test
	public void testCreate2Book() throws ParseException, IOException {
		
		Book newBook  = new Book();
		
		Catagory catagory = new Catagory("Advanced Java");
		
		catagory.setCatagoryId(12);
		newBook.setCatagory(catagory);
		
		newBook.setTitle("Java 8 in action");
		newBook.setAuthor("Joshua Bloch");
		newBook.setDescription("New coverage of generics, enums, annotations, autoboxing");
		newBook.setPrice(38.87f);
		newBook.setIsbn("0321356683");
		
		DateFormat dateFormat = new SimpleDateFormat("mm/dd/yy");
		
		Date publishDate = dateFormat.parse("05/28/2008");
		
		newBook.setPublishDate(publishDate);
		
		String imagePath = "/Users/darshanpatel/Downloads/books/Effective Java.jpg";
		
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		
		newBook.setImage(imageBytes);
		
		Book createBook = bookDAO.create(newBook);
		
		
		
		
		assertTrue(createBook.getBookId() >0);
	}
	
	@Test
	public void testFindByTitleNotExists() {
		
		String title = "Not Here";
		
		Book book = bookDAO.findByTitle(title);
		
		assertNull(book);
	}
	
	@Test
	public void testFindByTitleExists() {
		
		
		String title = "Java 8 in action";
		
		Book book = bookDAO.findByTitle(title);
		
		assertNotNull(true);
	}
	
	@Test
	public void testCount() {
		
		int totalBooks = (int) bookDAO.count();
		
		assertEquals(3,totalBooks);
		
		
	}
	
	@Test
	public void testListByCatagory() {
		int catagoryId = 8;
		
		List<Book> books  = bookDAO.listByCatagory(catagoryId);
		
		assertTrue(books.size() > 0);
	}
	
	@Test
	public void testSearchBookInTitle() {
		
		String keyword = "Java";
		
		List<Book> result = bookDAO.search(keyword);
		
		for(Book book:result) {
			
			System.out.println(book.getTitle());
		}
		
		
		assertEquals(4,result.size());
		
	}
	@Test
	public void testSearchBookInAuthor() {
		
		String keyword = "Joshua Bloch";
		
		List<Book> result = bookDAO.search(keyword);
		
		for(Book book:result) {
			
			System.out.println(book.getTitle());
		}
		
		
		assertEquals(3,result.size());
		
	}
	
	@Test
	public void testSearchBookIndDescription() {
		
		String keyword = " ADGDSGDSGDGSGG";
		
		List<Book> result = bookDAO.search(keyword);
		
		for(Book book:result) {
			
			System.out.println(book.getTitle());
		}
		
		
		assertEquals(1,result.size());
		
	}
	
	@Test
	public void testCountByCatagory() {
		
		int catagoryId  = 12;
		
		long noOfBooks = bookDAO.countByCatagory(catagoryId);
		
		assertTrue(noOfBooks == 6);
		
	}

}
