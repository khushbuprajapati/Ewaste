package com.ewaste.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.ewaste.model.User;

@WebServlet("/UserMasterController")
public class UserMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	HttpSession session;

    @Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("UserController Inside");
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("addUser")) {
			addUserHandler(request, response);
		} else if (action.equalsIgnoreCase("editUser")) {
			editUserHandler(request, response);
		} else if (action.equalsIgnoreCase("deleteUser")) {
			deleteUserHandler(request, response);
		}
	}
    
    private void editUserHandler(HttpServletRequest request, HttpServletResponse response) {
		try {
			session = request.getSession(true);
			System.out.println("===Edit User Management Inside method====");
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
			user.setCity(request.getParameter("city"));
			user.setRole(request.getParameter("role"));
			user.setCreatedBy(session.getAttribute("userId").toString());
			session1.update(user);
			
			tx1.commit();
			session1.close();
			response.sendRedirect(request.getContextPath()+"/AdminView/jsp/userManagement.jsp");

		} catch (Exception e) {
			System.out.println("Exception occured while editing user inside handler method : " + e.getMessage());
			e.printStackTrace();
		}
	}
    
    private void deleteUserHandler(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("===Delete User Inside method====");
			System.out.println("Requested delete id is : "+request.getParameter("id"));

			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			Session session1 = sessionFactory.openSession();
			Transaction tx1 = session1.beginTransaction();
			
			Query query = session1.createQuery("delete from User where id=:id");
			query.setParameter("id", Integer.parseInt(request.getParameter("id")));
			query.executeUpdate();
			tx1.commit();
			System.out.println("User deleted successfully");
			
			session1.close();
			response.sendRedirect(request.getContextPath() + "/AdminView/jsp/userManagement.jsp");
		
		} catch (Exception e) {
			System.out.println("Exception occured while deleting user inside handler method : "+e.getMessage());
			e.printStackTrace();
		}
	}
    
    private void addUserHandler(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			session = request.getSession(true);
			System.out.println("===Add User Handler inside method===");
			SessionFactory sf = new Configuration().configure().buildSessionFactory();
			Session s1 = sf.openSession();
			Transaction t1 = s1.beginTransaction();

			User user = new User();
			user.setName(request.getParameter("userName"));
			user.setEmail(request.getParameter("email"));
			user.setPassword(request.getParameter("pasword"));
			user.setAddress(request.getParameter("address"));
			user.setContact(request.getParameter("contact"));
			user.setCity(request.getParameter("city"));
			user.setRole(request.getParameter("role"));
			user.setCreatedBy(session.getAttribute("userId").toString());
			s1.save(user);
			t1.commit();
			System.out.println("New User added successfully");
			
			s1.close();
			response.sendRedirect(request.getContextPath() + "/AdminView/jsp/addUser.jsp?flag=true");
		
		} catch (IOException e) {
			System.out.println("Exception occured while adding new user in handle method : "+e.getMessage());
			e.printStackTrace();
		}
    }
	
	
	

}
