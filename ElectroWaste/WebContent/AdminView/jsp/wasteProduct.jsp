<%@page import="com.ewaste.model.WasteProduct"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.nio.file.Watchable"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.persister.entity.Queryable"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Theme</title>
</head>

<body>

    <!-- Include header page -->
	<jsp:include page="adminHeader.jsp"></jsp:include>
	                
<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->

        <div id="page-wrapper">
       		 <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Waste Product</h1>
                </div>
             </div>

            <div class="row">
                <div class="col-lg-6" style="width: 100%;">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Waste Product
                        </div>
                        <div class="panel-body" >
                            <div class="table-responsive">
                              <form action="<%=request.getContextPath()%>/WasteProductController" method="post">
                                <table  class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                        	<th>Sr No.</th>
                                            <th>Waste Product Name</th>
                                            <th>Waste Product Type</th>
                                            <th>Uploaded Photo</th>
                                            <th>Description</th>
                                            <th>Expected Price</th>
                                            <th colspan="2" >Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                    SessionFactory sf = new Configuration().configure().buildSessionFactory();
                            		Session s1 = sf.openSession();
                            		Transaction tx = s1.beginTransaction();  
                        			Query<WasteProduct> query = s1.createQuery("from WasteProduct");
                        			
                        			List<WasteProduct> list = query.list();
                        			int count = 1;
                        			for(WasteProduct wp : list){
                        				String id = String.valueOf(wp.getId());
                        				System.out.print(wp);
     								%>
                                   <tr>
                                   		<td><%=count++ %></td>
                                   		<td><a href="<%=request.getContextPath()%>/AdminView/jsp/wasteProduct_Details.jsp?id=<%=wp.getId() %>"><%out.print(wp.getName()); %></a></td>
                                   		<td><%out.print(wp.getType()); %></td>
                                   		<td><%out.print(wp.getPhoto()); %></td>
                                   		<td><%out.print(wp.getDescription());%></td>
                                   		<td><%out.print(wp.getPrice()); %></td>
                                   		<td><a href="<%=request.getContextPath()%>/AdminView/jsp/wasteProduct_Details.jsp">Approve</a></td>
                                   		<td><a href="<%=request.getContextPath()%>/AdminView/jsp/wasteProduct_Details.jsp">Reject</a></td>
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
        </div>
</body>
</html>
