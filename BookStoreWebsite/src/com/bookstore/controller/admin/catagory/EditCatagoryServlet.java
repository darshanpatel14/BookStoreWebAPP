package com.bookstore.controller.admin.catagory;

import com.bookstore.controller.BaseServlet;
import com.bookstore.service.CatagoryServices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/admin/edit_catagory")
public class EditCatagoryServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    
    public EditCatagoryServlet() {
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CatagoryServices catagoryServices = new CatagoryServices(entityManager,request,response);
		catagoryServices.editCatagory();
	}

}
