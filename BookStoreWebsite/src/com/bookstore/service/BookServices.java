package com.bookstore.service;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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



	public void createBook() throws ServletException  {
		
		Integer catagoryId = Integer.parseInt(request.getParameter("catagory"));
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String description = request.getParameter("description");
		String isbn = request.getParameter("isbn");
		Float price = Float.parseFloat(request.getParameter("price"));
		DateFormat dateFormat = SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = null;
		
		try {
		
			publishDate = dateFormat.parse(request.getParameter("publishDate"));
			
		}catch(ParseException ex) {
			ex.printStackTrace();
			throw new ServletException("error Parsing publishing date");
		}
		
		
		System.out.println("Catagory Id : " + catagoryId);
		System.out.println("Title : " + title);
		System.out.println(" Author: " + author);
		System.out.println(" Description : " + description);
		System.out.println("ISBN : " + isbn);
		System.out.println("Price : " + price);
		System.out.println("Publish Date : " + publishDate);
		
		
	}



	private DateFormat SimpleDateFormat(String string) {
		
		return null;
	}
	
}
