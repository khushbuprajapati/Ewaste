package com.ewaste.controller;

import java.io.IOException;
//import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
//import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.ewaste.model.Category;
import com.ewaste.model.User;

@WebServlet("/CategoryController")
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CategoryController() {
		super();
	}
	
	HttpSession session;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CategoryController Inside");
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("addCategory")) {
			addCategoryHandler(request, response);
		} else if (action.equalsIgnoreCase("editCategory")) {
			editCategoryHandler(request, response);
		} else if (action.equalsIgnoreCase("deleteCategory")) {
			deleteCategoryHandler(request, response);
		}
	}

	private void editCategoryHandler(HttpServletRequest request, HttpServletResponse response) {
		try {
			session = request.getSession(true);
			System.out.println("===Edit Category Inside method====");
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			Session session1 = sessionFactory.openSession();
			Transaction tx1 = session1.beginTransaction();
			
			Query query = session1.createQuery("delete from Category where id=:id");
			query.setParameter("id", Integer.parseInt(request.getParameter("id")));
			com.ewaste.model.Category c1 = new com.ewaste.model.Category();
			
			c1.setName(request.getParameter("categoryName"));
			session1.update(c1);
			
			tx1.commit();
			session1.close();
			response.sendRedirect(request.getContextPath()+"/AdminView/jsp/category.jsp");
			
		} catch (Exception e) {
			System.out.println("Exception occured while editing category inside handler method : " + e.getMessage());
			e.printStackTrace();
		}
	}

	private void deleteCategoryHandler(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("===Delete Category Inside method====");
			System.out.println("Requested delete id is : "+request.getParameter("id"));

			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			Session session1 = sessionFactory.openSession();
			Transaction tx1 = session1.beginTransaction();
			
			Query query = session1.createQuery("delete from Category where id=:id");
			query.setParameter("id", Integer.parseInt(request.getParameter("id")));
			query.executeUpdate();
			tx1.commit();
			System.out.println("Category deleted successfully");
			
			session1.close();
			response.sendRedirect(request.getContextPath() + "/AdminView/jsp/category.jsp");
		
		} catch (Exception e) {
			System.out.println("Exception occured while deleting category inside handler method : "+e.getMessage());
			e.printStackTrace();
		}
	}

	private void addCategoryHandler(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("===Add Category Handler inside method===");
			SessionFactory sf = new Configuration().configure().buildSessionFactory();
			Session s1 = sf.openSession();
			Transaction t1 = s1.beginTransaction();

			com.ewaste.model.Category c1 = new com.ewaste.model.Category();
			c1.setName(request.getParameter("categoryName"));

			s1.save(c1);
			t1.commit();
			System.out.println("Category added successfully");
			
			s1.close();
			response.sendRedirect(request.getContextPath() + "/AdminView/jsp/category.jsp");
		} catch (IOException e) {
			System.out.println("Exception occured while adding category in handle method : "+e.getMessage());
			e.printStackTrace();
		}

	}
}
