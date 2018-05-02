<%@page import="java.util.List"%>
<%@page import="com.ewaste.model.User"%>
<%@page import="org.hibernate.Query"%>
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
	                

        <div id="page-wrapper">
       		 <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">View User List</h1>
                </div>
                <!-- /.col-lg-12 -->
             </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6" style="width: 100%;'">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            User Management
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table width="100%" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                        	<th>Sr No.</th>
                                            <th>User Name</th>
                                            <th>Email id</th>
                                            <th>Contact No.</th>
                                            <th>City</th>	
                                            <th>Address</th>
                                            <th>Role</th>
                                        </tr>
                                    </thead>
                                    <tbody>
      <!--Select Query -->          <%
                                    SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
                        			Session session1 = sessionFactory.openSession();
                        			Transaction tx1 = session1.beginTransaction();
                        			Query<User> query = session1.createQuery("from User");
                        			
                        			List<User> users = query.list();
                        			int count = 1;
                        			for(User user : users){
                        			String id = String.valueOf(user.getId());
     								%>
                        			<tr>
                        					<td><%=count++%></td>
                                            <td><a href="<%=request.getContextPath()%>/AdminView/jsp/userDetails.jsp?userId=<%=id %>"><%out.print(user.getName()); %></a></td>
                                            <td><%out.print(user.getEmail()); %></td>
                                            <td><%out.print(user.getContact()); %></td>
                                            <td><%out.print(user.getCity()); %></td>
                                            <td><%out.print(user.getAddress()); %></td>
                                            <td><%out.print(user.getRole());%></td>
                                    </tr>
                        			<%
                        			}
                        			tx1.commit();
                        			session1.close();
                                    %>
    <!--Select Query completed--> </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>
