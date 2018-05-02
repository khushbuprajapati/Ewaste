package com.ewaste.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.ewaste.model.Product;

@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SessionFactory sf = new Configuration().configure().buildSessionFactory();
		Session s1 = sf.openSession();
		Transaction tx = s1.beginTransaction();
		
		Product product = new Product();
		product.setCode(request.getParameter("productCode"));
		product.setName(request.getParameter("productName"));
		product.setType(request.getParameter("productType"));
		product.setImage(request.getParameter("imageUpload"));
		product.setDescription(request.getParameter("description"));
		product.setPrice(request.getParameter("price"));
		
		s1.save(product);
		tx.commit();
		s1.close();
		response.sendRedirect(request.getContextPath()+"/AdminView/jsp/product.jsp");
		
		
		
	}

}
