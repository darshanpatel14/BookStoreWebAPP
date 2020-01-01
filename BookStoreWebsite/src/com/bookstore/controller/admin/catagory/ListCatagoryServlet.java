package com.bookstore.controller.admin.catagory;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.controller.BaseServlet;
import com.bookstore.service.CatagoryServices;

import com.bookstore.controller.BaseServlet;

@WebServlet("/admin/list_catagory")
public class ListCatagoryServlet extends com.bookstore.controller.BaseServlet {
	private static final long serialVersionUID = 1L;
    
    public ListCatagoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CatagoryServices catagoryServices = new CatagoryServices(entityManager,request, response);
		catagoryServices.listCatagory();
		
	}

}
