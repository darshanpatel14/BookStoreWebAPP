package com.bookstore.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CatagoryDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Catagory;

public class BookServices {
	
	private EntityManager entityManager;
	private CatagoryDAO catagoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private BookDAO bookDAO;
	
	
	
	
	public BookServices(EntityManager entityManager, HttpServletRequest request, HttpServletResponse response
			) {
		super();
		this.entityManager = entityManager;
		this.request = request;
		this.response = response;
		bookDAO = new BookDAO(entityManager);
		catagoryDAO  = new CatagoryDAO(entityManager);
	}

	public void listBooks() throws ServletException, IOException {
		
		listBooks(null);
		
	}


	public void listBooks(String message) throws ServletException, IOException {
		
		List<Book> listBooks = bookDAO.listAll();
		
		request.setAttribute("listBooks", listBooks);
		
		if(message != null) {
			request.setAttribute("message", message);
			
		}
		
		String listPage = "book_list.jsp";
		

		RequestDispatcher dispatcher = request.getRequestDispatcher(listPage);
		
		dispatcher.forward(request, response);
		
	}
	
	public void showBookNewForm() throws ServletException, IOException {
		
		List<Catagory> listCatagory = 	catagoryDAO.listAll();
		
		request.setAttribute("listCatagory", listCatagory);
		
		String newPage = "book_form.jsp";
		

		RequestDispatcher dispatcher = request.getRequestDispatcher(newPage);
		
		dispatcher.forward(request, response);
	}




	public void createBook() throws ServletException, IOException  {
		
		
		
		String title = request.getParameter("title");
		
		Book existBook = bookDAO.findByTitle(title);
		
		if(existBook != null ) {
			
			String message = "Could not create new book because the title '"
					+ title + "' already exists.";
			listBooks(message);
			return;
		}
		
		Book newBook = new Book();
		readBookFields(newBook);
		
		
		Book createdBook  = bookDAO.create(newBook);
		

		if (createdBook.getBookId() > 0) {
			String message = "A new book has been created successfully.";
			listBooks(message);
		}
		
	}
	
	public void readBookFields(Book book) throws ServletException, IOException {
		Integer catagoryId = Integer.parseInt(request.getParameter("catagory"));
		
		String title = request.getParameter("title");

		String author = request.getParameter("author");
		String description = request.getParameter("description");
		String isbn = request.getParameter("isbn");
		float price = Float.parseFloat(request.getParameter("price"));
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		
		Date publishDate=null;
		
		
		try {
			publishDate = dateFormat.parse(request.getParameter("publishDate"));
			
		}catch(ParseException ex) {
			ex.printStackTrace();
			throw new ServletException("Errror parsing publish date ");
		}
		
		System.out.println("Catagory  " + catagoryId);
		System.out.println("title " + title);
		System.out.println("author  " + author);
		System.out.println("description  " + description);
		System.out.println("isbn  " + isbn);
		System.out.println("price  " + price);
		System.out.println("publish date  " + publishDate);
		
		
		book.setTitle(title);
		book.setAuthor(author);
		book.setDescription(description);
		book.setIsbn(isbn);
		book.setPrice(price);
		book.setPublishDate(publishDate);
		
		Catagory catagory = catagoryDAO.get(catagoryId);
		book.setCatagory(catagory);
		
		
		
		Part part  = request.getPart("bookImage");
		
		if(part != null && part.getSize() >0) {
			
			long size = part.getSize();
			
			byte[] imageBytes = new byte[(int) size];
			
			InputStream inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();
			
			
			book.setImage(imageBytes);
		}
		
	}

	public void editBook() throws ServletException, IOException {
		
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		
		Book book = bookDAO.get(bookId);
		
		List<Catagory> listCatagory = catagoryDAO.listAll();
		
		
		request.setAttribute("listCatagory", listCatagory);
		request.setAttribute("book", book);
		

		String editPage = "book_form.jsp";
		

		RequestDispatcher dispatcher = request.getRequestDispatcher(editPage);
		
		dispatcher.forward(request, response);
		
	}
	

	public void updateBook() throws ServletException, IOException {
		
		Integer bookId = Integer.parseInt(request.getParameter("bookId"));
		String title = request.getParameter("title");
		
		Book bookByTitle = bookDAO.findByTitle(title);
		
		Book existBook = bookDAO.get(bookId);
		
		if(!existBook.equals(bookByTitle)) {
			
			String message = "Could not update book because There's another book  having same title.";
			listBooks(message);
		}
		
		readBookFields(existBook);
		
		bookDAO.update(existBook);
		
		String message ="The Book has Been Updated Successfully.";
		
		listBooks(message);
	
		
	}

	public void deleteBook() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		
		bookDAO.delete(bookId);
		

		String message ="The Book has Been Deleted Successfully.";
		
		listBooks(message);
		
		
	}

	public void listBooksByCatagory() throws ServletException, IOException {
		
		int catagoryId = Integer.parseInt(request.getParameter("id"));
		
		List<Book> listBooks  =  bookDAO.listByCatagory(catagoryId);
		
		Catagory catagory = catagoryDAO.get(catagoryId);
		
		List<Catagory> listCatagory = catagoryDAO.listAll();
		
		request.setAttribute("listCatagory", listCatagory);
		
		request.setAttribute("catagory", catagory);
		request.setAttribute("listBooks", listBooks);
		
		String listPage = "frontend/books_list_by_catagory.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(listPage);
		
		dispatcher.forward(request, response);
		
	}

	public void viewBookDetail() throws ServletException, IOException {
		
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		
		Book book  = bookDAO.get(bookId);
		
		request.setAttribute("book", book);
		
		
		
		List<Catagory> listCatagory = catagoryDAO.listAll();
		
		request.setAttribute("listCatagory", listCatagory);
		
		String detailPage = "frontend/book_detail.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(detailPage);
		
		dispatcher.forward(request, response);
		
	}

	public void search() throws ServletException, IOException {
		
		String keyword = request.getParameter("keyword");
		
		List<Book> result = null;
		
		if(keyword.equals("")) {
			
			result = bookDAO.listAll();
			
		}else {
			
			result = bookDAO.search(keyword);
			
		}
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("result", result);
		
		String resultPage = "frontend/search_result.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(resultPage);
		
		dispatcher.forward(request, response);
		
		
	}
	
}
