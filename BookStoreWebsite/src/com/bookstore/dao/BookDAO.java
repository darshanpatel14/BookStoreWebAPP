package com.bookstore.dao;


import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.bookstore.entity.Book;

public class BookDAO extends JpaDAO<Book> implements GenericDAO<Book> {

	public BookDAO() {
		
		
	}

	@Override
	public Book create(Book book) {
		
		book.setLastUpdateTime(new Date());
		return super.create(book);
	}

	@Override
	public Book update(Book book) {
		book.setLastUpdateTime(new Date());
		
		return super.update(book);
	}

	@Override
	public Book get(Object bookId) {
		
		return super.find(Book.class,bookId);
	}

	@Override
	public void delete(Object bookId) {
		
		super.delete(Book.class, bookId);
		
	}

	@Override
	public List<Book> listAll() {
		
		return super.findNamedQuery("Book.findAll");
	}

	@Override
	public long count() {
		
		
		
		return super.countWithNamedQuery("Book.countAll");
	}
	
	public Book findByTitle(String title) {
		List<Book> result = super.findNamedQuery("Book.findByTitle", "title", title);
		
		if (!result.isEmpty()) {
			return result.get(0);
		}
		
		return null;
	}
	
	public List<Book> listByCatagory(int catagoryId){
		
		return super.findNamedQuery("Book.findByCatagory","catId",catagoryId);
	}
	
	public List<Book> listNewBooks(){
		
		
		
		
		return super.findNamedQuery("Book.listNew", 0, 4);
		
	}
	
	public List<Book> search(String keyword){
		return super.findNamedQuery("Book.search","keyword",keyword);
	}
	

}
