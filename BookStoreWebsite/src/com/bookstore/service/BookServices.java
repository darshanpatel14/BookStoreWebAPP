package com.bookstore.service;

import java.io.IOException;
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

import org.omg.CORBA.portable.InputStream;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CatagoryDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Catagory;

public class BookServices {
	
	private EntityManager entityManager;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private BookDAO bookDAO;
	private CatagoryDAO catagoryDAO;

	
	
	public BookServices(EntityManager entityManager, HttpServletRequest request, HttpServletResponse response
			) {
		super();
		this.entityManager = entityManager;
		this.request = request;
		this.response = response;
		
		bookDAO = new BookDAO(entityManager);
		catagoryDAO = new CatagoryDAO(entityManager);
		
	}

	public void listBooks() throws ServletException, IOException {
		listBooks(null);
	}


	public void listBooks(String message) throws ServletException, IOException {
		
		if(message != null) {
			
			request.setAttribute("message", message);
		}
		
		List<Book> listBooks = bookDAO.listAll();
	
		request.setAttribute("listBooks", listBooks);

		
		String listPage = "book_list.jsp";
		
		RequestDispatcher dispatcher  = request.getRequestDispatcher(listPage);
		
		dispatcher.forward(request,response);
	}
	
	public void showBookNewForm() throws ServletException, IOException {
		
		List<Catagory> listCatagory = catagoryDAO.listAll();
		
		request.setAttribute("listCatagory", listCatagory);
		
		String newPage = "book_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(newPage);
		
		requestDispatcher.forward(request, response);
		
		
		
		
	}



	public void createBook() throws ServletException, IOException {
		String title = request.getParameter("title");
		
		Book existBook = bookDAO.findByTitle(title);
		
		if (existBook != null) {
			String message = "Could not create new book because the title '"
					+ title + "' already exists.";
			listBooks(message);
			return;
		}
		
		Book newBook = new Book();
		readBookFields(newBook);
		
		Book createdBook = bookDAO.create(newBook);
		
		if (createdBook.getBookId() > 0) {
			String message = "A new book has been created successfully.";
			listBooks(message);
		}
	}



	public void editBook() throws ServletException, IOException {
		Integer bookId  = Integer.parseInt(request.getParameter("id"));
		
		Book book  = bookDAO.get(bookId);
		
		List<Catagory> listCatagory = catagoryDAO.listAll();
		
		
		
		request.setAttribute("book", book);
		request.setAttribute("listCatagory", listCatagory);
		
		String editPage = "book_form.jsp";
		
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		
		requestDispatcher.forward(request, response);
		
	}

	public void readBookFields(Book book) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String description = request.getParameter("description");
		String isbn = request.getParameter("isbn");
		float price = Float.parseFloat(request.getParameter("price"));
		DateFormat dateFormat = new SimpleDateFormat("mm/dd/yyyy");
		Date publishDate = null;
		
		try {
			publishDate = dateFormat.parse(request.getParameter("publishDate"));
		} catch (ParseException ex) {
			ex.printStackTrace();
			throw new ServletException("Error parsing publish date (format is MM/dd/yyyy)");
		}
		
		
				
		
		book.setTitle(title);
		book.setAuthor(author);
		book.setIsbn(isbn);
		book.setDescription(description);
		book.setPublishDate(publishDate);
		book.setPrice(price);
		
		
		Integer catagoryId = Integer.parseInt(request.getParameter("catagory"));
		Catagory catagory=catagoryDAO.get(catagoryId);
		
		book.setCatagory(catagory);
				
				

		Part part = request.getPart("bookImage");
		
		if (part != null && part.getSize() > 0) {
			long size = part.getSize();
			byte[] imageBytes = new byte[(int) size];
			
			java.io.InputStream inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();
			
			book.setImage(imageBytes);
		}
		
		
	}
	
	
	public void updateBook() throws ServletException, IOException {
		
		Integer bookId  = Integer.parseInt(request.getParameter("bookId"));
		
		Book existsBook = bookDAO.get(bookId);
		
		readBookFields(existsBook);
		
		bookDAO.update(existsBook);
		
		String message = "Book has Been updated Successfully";
		
		listBooks(message);
	}
	
}
