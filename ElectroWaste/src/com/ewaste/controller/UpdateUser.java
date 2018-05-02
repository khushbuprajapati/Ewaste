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

import com.ewaste.model.User;


@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdateUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session1 = sessionFactory.openSession();
		Transaction tx1 = session1.beginTransaction();
		
		Query<User> query = session1.createQuery("from User where id=:id");
		query.setParameter("id", Integer.parseInt(request.getParameter("id")));
		User user = query.getSingleResult();
		
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setAddress(request.getParameter("address"));
		user.setContact(request.getParameter("contact"));
		user.setCity(request.getParameter("City"));
		user.setRole(request.getParameter("role"));
		
		session1.update(user);
		
		tx1.commit();
		session1.close();
		response.sendRedirect(request.getContextPath()+"/AdminView/jsp/userManagement.jsp");
	}

}
