package com.bookstore.controller.admin.catagory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.CatagoryServices;

@WebServlet("/admin/delete_catagory")
public class DeleteCatagoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteCatagoryServlet() {
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CatagoryServices  catagoryServices = new CatagoryServices(request,response);
		
		catagoryServices.deleteCatagory();
	}

}
