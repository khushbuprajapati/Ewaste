package com.ewaste.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.ewaste.model.Category;

@WebServlet("/UpdateCategory")
public class UpdateCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
       public UpdateCategory() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SessionFactory sf = new Configuration().configure().buildSessionFactory();
		Session s1 = sf.openSession();
		Transaction t1 = s1.beginTransaction();
		
		Query<Category> query = s1.createQuery("from com.ewaste.model.Category where id=:id");
		query.setParameter("id", Integer.parseInt(request.getParameter("id")));
		com.ewaste.model.Category c1 = query.getSingleResult();
		
		c1.setName(request.getParameter("categoryName"));
		
		s1.update(c1);
		
		t1.commit();
		s1.close();
		response.sendRedirect(request.getContextPath()+"/AdminView/jsp/category.jsp");
		
	}

}
