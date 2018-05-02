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

import com.ewaste.model.MyWallet;
import com.ewaste.utils.DateUtils;

@WebServlet("/MyWalletController")
public class MyWalletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyWalletController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session1 = sessionFactory.openSession();
		Transaction tx1 = session1.beginTransaction();
		
		MyWallet  wallet = new MyWallet();
		wallet.setWp_id(Integer.parseInt(request.getParameter("wp_id")));
		wallet.setUser_id(Integer.parseInt(request.getParameter("user_id")));
		wallet.setAmount(Integer.getInteger(request.getParameter("amount")));
		wallet.setDate(DateUtils.getDateToDateObject(request.getParameter("date")));
		
		session1.save(wallet);
		tx1.commit();
		session1.close();
		response.sendRedirect(request.getContextPath()+"/UserView/jsp/index.jsp");
	
	}

}
