
package com.ewaste.controller;

import java.io.IOException;
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

@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AdminLoginController() {
        super();
    }

    HttpSession session;
    
    @Override
   	protected void service(HttpServletRequest request, HttpServletResponse response)
   			throws ServletException, IOException {
   		System.out.println("LoginAdminController Inside");
   		String action = request.getParameter("action");
   		if (action.equalsIgnoreCase("loginAdmin")) {
   			loginAdminHandler(request, response);
   		} else if(action.equalsIgnoreCase("logoutAdmin")) {
   			logoutAdminHandler(request,response);
   		}
   	}

   	private void logoutAdminHandler(HttpServletRequest request, HttpServletResponse response) {
   		try {
   			System.out.println("===LogoutController Inside===");
   			session.setAttribute("userInfo", null);
			session.setAttribute("userId", null);
			session.invalidate();
   			response.sendRedirect(request.getContextPath() + "/AdminView/jsp/login.jsp");
   		} catch (Exception e) {
   			System.out.println("Exception occured while logout from system : "+e.getMessage());
   			e.printStackTrace();
   		}
   	}		
   	
   	private void loginAdminHandler(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("===LoginController Inside===");
			System.out.println("Login Parameter :: UserName : "+request.getParameter("userName")+", Password : "+request.getParameter("password"));
			
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			Session session1 = sessionFactory.openSession();
			Transaction tx1 = session1.beginTransaction();
			
			Query<User> query = session1.createQuery("from User where name=:userName and password=:password");
			query.setParameter("userName", request.getParameter("userName"));
			query.setParameter("password", request.getParameter("password"));
			
			List<User> userList = query.getResultList();
			tx1.commit();
			session1.close();
			
			if(userList.isEmpty()) {
				System.out.println("No record found in user");
				response.sendRedirect(request.getContextPath() + "/AdminView/jsp/login.jsp?errorMsg=false");
			} else {
				System.out.println("Admin information found : "+userList.get(0).toString());
				session = request.getSession(true);
				session.setAttribute("userInfo", userList.get(0));
				session.setAttribute("userId", userList.get(0).getId());
				response.sendRedirect(request.getContextPath() + "/AdminView/jsp/index.jsp");
			}
			
	        
		} catch (Exception e) {
			System.out.println("Exception occured while logged into systm : "+e.getMessage());
			e.printStackTrace();
		}
	}
}


