package com.ewaste.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
import com.ewaste.model.Customer;

@WebServlet("/CustomerRegistrationController")
public class CustomerRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CustomerRegistrationController() {
		super();
	}

	HttpSession session;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CustomerRegistrationController Inside");
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("addCustomerRegistration")) {
			customerRegistrationHandler(request, response);
		} else if(action.equalsIgnoreCase("loginCustomer")) {
			loginCustomerHandler(request,response);
		} else if(action.equalsIgnoreCase("logoutCustomer")) {
			logoutCustomerHandler(request,response);
		}
		
	}

	private void logoutCustomerHandler(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("===LogoutController Inside===");
			session.setAttribute("customerInfo", null);
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/UserView/jsp/index.jsp");
		} catch (Exception e) {
			System.out.println("Exception occured while logout from system : "+e.getMessage());
			e.printStackTrace();
		}
	}

	private void loginCustomerHandler(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("===LoginController Inside===");
			System.out.println("Login Parameter :: Email : "+request.getParameter("email")+", Password : "+request.getParameter("password"));
			session = request.getSession(true);
			
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			response.setHeader("Access-Control-Allow-Origin", "*");
	        response.setHeader("Access-Control-Allow-Methods", "POST");
	        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
	       

			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			Session session1 = sessionFactory.openSession();
			Transaction tx1 = session1.beginTransaction();
			
			Query<Customer> query = session1.createQuery("from Customer where email = :email and password = :password");
			query.setString("email", request.getParameter("email"));
			query.setString("password", request.getParameter("password"));
			
			
			List<Customer> customerList = query.getResultList();
			tx1.commit();
			session1.close();
			
			if(customerList.isEmpty()) {
				System.out.println("No record found in Customer");
				session.setAttribute("customerInfo", null);
				session.invalidate();
				out.println(false);
			} else {
				System.out.println("Customer information found : "+customerList.get(0).toString());
				session.setAttribute("customerInfo", customerList.get(0));
				out.println(true);
			}
			out.flush();
			
	        
		} catch (Exception e) {
			System.out.println("Exception occured while logged into system : "+e.getMessage());
			e.getMessage();
		}
	}

	private void customerRegistrationHandler(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("===Customer Registration handler inside===");
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			Session session1 = sessionFactory.openSession();
			Transaction tx1 = session1.beginTransaction();

			Customer Customer = new Customer();
			Customer.setFirstName(request.getParameter("firstName"));
			Customer.setLastName(request.getParameter("lastName"));
			Customer.setContact(request.getParameter("contact"));
			Customer.setEmail(request.getParameter("email"));
			Customer.setPassword(request.getParameter("password"));
			Customer.setCityName(request.getParameter("cityName"));
			Customer.setAddress(request.getParameter("address"));

			session1.save(Customer);
			tx1.commit();
			session1.close();
			response.sendRedirect(request.getContextPath() + "/UserView/jsp/index.jsp");
		} catch (Exception e) {
			System.out.println("Exception occured while registring Customer handler");
			e.printStackTrace();
		}
	}
}
