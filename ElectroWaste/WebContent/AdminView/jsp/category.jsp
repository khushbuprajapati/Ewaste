<%@page import="java.util.Iterator"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ewaste.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
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
	
<!--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Category</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Category Details</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-6">
									<form role="form" action="<%=request.getContextPath()%>/CategoryController?action=addCategory" method="post">
										<div class="form-group">
											<label>Category Name:</label> 
											<input class="form-control" placeholder="Enter category name" type="text" name="categoryName"/>
										</div>
										<button type="submit" class="btn btn-default">Submit</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			
<hr>	
<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
<br/>		
		<div class="row">
			<div class="col-lg-6" style="width: 100%;">
				<div class="panel panel-default" style="width: 100%;">
					<div class="panel-heading">
						View Category
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<form action="<%=request.getContextPath()%>/CategoryController" method="post">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Id</th>
											<th>Category Name</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
									<%
									SessionFactory sf = new Configuration().configure().buildSessionFactory();
									Session s1 = sf.openSession();
									Transaction t1 = s1.beginTransaction();
                        			
                        			Query<Category> query = s1.createQuery("from Category");                        			
                        			List<Category> ct = query.list();
                        			for(Category c1 : ct){
                        				System.out.print(c1);
     								%>
										<tr>
											<td><%out.print(c1.getId());%></td>
											<td><%out.print(c1.getName());%></td>
											<td><a href="<%=request.getContextPath()%>/UpdateCategory?id=<%out.print(c1.getId());%>">Edit</a></td>
											<td><a href="<%=request.getContextPath()%>/CategoryController?action=deleteCategory&id=<%out.print(c1.getId());%>">Delete</a></td>
										</tr>
									<%
                        			}
                        			t1.commit();
                        			s1.close();
                                    %>
									</tbody>	
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

</body>
</html>
