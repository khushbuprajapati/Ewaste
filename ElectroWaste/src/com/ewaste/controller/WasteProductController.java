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

import com.ewaste.model.WasteProduct;
import com.ewaste.utils.CommonConstants;

@WebServlet("/WasteProductController")
public class WasteProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	HttpSession session;
	
    @Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("WasteProductController Inside");
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("addWasteProduct")) {
			addWasteHandler(request, response);
		} else if (action.equalsIgnoreCase("editWasteProduct")) {
			editWasteHandler(request, response);
		} else if (action.equalsIgnoreCase("deleteWasteProduct")) {
			deleteWasteHandler(request, response);
		}
	}

    private void editWasteHandler(HttpServletRequest request, HttpServletResponse response) {
		try {
			session = request.getSession(true);
			System.out.println("===Edit WasteProduct Inside method====");
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			Session session1 = sessionFactory.openSession();
			Transaction tx1 = session1.beginTransaction();
			
			Query<WasteProduct> query = session1.createQuery("from WasteProduct where id=:id");
			query.setParameter("id",Integer.parseInt(request.getParameter("wasteProductId")));
			WasteProduct wp = query.getSingleResult();
			
			wp.setName(request.getParameter("wpName"));
			wp.setType(request.getParameter("wpType"));
			wp.setPhoto(request.getParameter("photoUpload"));
			wp.setDescription(request.getParameter("description"));
			wp.setPrice(request.getParameter("price"));
			wp.setStatus(CommonConstants.IN_PROGRESS);
			session1.update(wp);
			
			tx1.commit();
			session1.close();
			response.sendRedirect(request.getContextPath()+"/AdminView/jsp/wasteProduct_Details.jsp");
			
		} catch (Exception e) {
			System.out.println("Exception occured while editing WasteProduct inside handler method : " + e.getMessage());
			e.printStackTrace();
		}
	}
    
    private void deleteWasteHandler(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("===Delete WasteProduct Inside method====");
			System.out.println("Requested delete id is : "+request.getParameter("id"));

			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			Session session1 = sessionFactory.openSession();
			Transaction tx1 = session1.beginTransaction();
			
			Query query = session1.createQuery("delete from WasteProduct where id=:id");
			query.setParameter("id", Integer.parseInt(request.getParameter("id")));
			query.executeUpdate();
			tx1.commit();
			System.out.println("WasteProduct deleted successfully");
			
			session1.close();
			response.sendRedirect(request.getContextPath() + "/UserView/jsp/wasteDetails.jsp");
		} catch (Exception e) {
			System.out.println("Exception occured while deleting WasteProduct inside handler method : "+e.getMessage());
			e.printStackTrace();
		}
	}
    
    private void addWasteHandler(HttpServletRequest request, HttpServletResponse response) {
		try {
		System.out.println("===Add WasteProduct Handler inside method===");
		SessionFactory sf = new Configuration().configure().buildSessionFactory();
		Session s1 = sf.openSession();
		Transaction tx = s1.beginTransaction();
		
		WasteProduct wp = new WasteProduct();
		wp.setName(request.getParameter("wpName"));
		wp.setType(request.getParameter("wpType"));
		wp.setPhoto(request.getParameter("photoUpload"));
		wp.setDescription(request.getParameter("description"));
		wp.setPrice(request.getParameter("price"));
		wp.setStatus(CommonConstants.IN_PROGRESS);
		
		s1.save(wp);
		tx.commit();
		System.out.println("WasteProduct added successfully");
		s1.close();
		response.sendRedirect(request.getContextPath()+"/UserView/jsp/wasteDetails.jsp");
		} catch (IOException e) {
			System.out.println("Exception occured while adding WasteProduct in handle method : "+e.getMessage());
			e.printStackTrace();
		}

	}
}
