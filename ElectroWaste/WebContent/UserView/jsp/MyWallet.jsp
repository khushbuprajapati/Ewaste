<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.util.List"%>
<%@page import="com.ewaste.model.WasteProduct"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Electro Waste</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Smart Shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	
</head>
<body>
	
	<!-- Include header page -->
	<jsp:include page="Header.jsp"></jsp:include>
	
<!-- My Wallet -->
<div class="row">
	 <div class="col-lg-6">
    	 <div class="panel panel-default" style="margin-top: 30px; margin-right: -90%;margin-left: 123px;">
        	 <div class="panel-heading" style="padding: 1% 40%; color: orange; font-size: 18px;">
             	 My Wallet History
             </div>
             <div class="panel-body" >
             	<div class="table-responsive">
                	<form action="<%=request.getContextPath()%>/WasteProductController" method="post">
                     	<table class="table table-striped table-bordered table-hover">
                        	<thead>
                            	<tr>
                                	<th>Waste Product Name</th>
                                    <th>User Name</th>
                                    <th>Uploaded Image</th>
                                    <th>Date</th>
                                </tr>
                             </thead>
                             <tbody>
                                    <%
                                    SessionFactory sf = new Configuration().configure().buildSessionFactory();
                            		Session s1 = sf.openSession();
                            		Transaction tx = s1.beginTransaction();  
                            		
                        			Query<WasteProduct> query = s1.createQuery("from WasteProduct");
                        			
                        			List<WasteProduct> list = query.list();
                        			for(WasteProduct wp1 : list){
                        				System.out.print(wp1);
     								%>
                                   <tr>
                                   		<td><%out.print(wp1.getName()); %></td>
                                   		<td><%out.print(wp1.getType()); %></td>
                                   		<td><%out.print(wp1.getPhoto()); %></td>
                                   		<td><%out.print(wp1.getDescription());%></td>
                                   </tr>
                                   <%
                        			}
                        			tx.commit();
                        			s1.close();
                                   %>
                                </table>
                                </form>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<!-- //My wallet -->

	<!-- Include header page -->
	<jsp:include page="Footer.jsp"></jsp:include>
		

</body>
</html>
