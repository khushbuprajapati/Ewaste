<%@page import="java.util.List"%>
<%@page import="com.ewaste.model.Product"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	
<!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
    
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Product</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Product Form
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" action="<%=request.getContextPath()%>/ProductController" method="post">
                                        <div class="form-group">
                                            <label>Product Code</label>
                                            <input class="form-control" type="text" name="productCode">
                                        </div>
                                        <div class="form-group">
                                            <label>Product Name</label>
                                            <input class="form-control" placeholder="Enter product name" type="text" name="productName">
                                        </div>
                                        <div class="form-group">
                                            <label>Product Type</label>
                                            <select class="form-control" name="productType">
                                            	<option>Home Appliance</option>
                                            	<option>Computer Equipments</option>
                                            	<option>Gadgets</option>
                                            	<option>Other</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Images Upload</label>
                                            <input type="file" name="imageUpload">
                                        </div>
                                         <div class="form-group">
                                            <label>Description</label>
                                            <textarea class="form-control" rows="3" name="description"></textarea>
                                        </div>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon">Price</span>
                                            <input type="text" class="form-control" name="price">
                                            <span class="input-group-addon">.00</span>
                                        </div>
                                        <br>
                                        <center>
                                        	<button type="submit" class="btn btn-default">Submit</button>
                                        </center>
                                    </form>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<hr>

<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Product Details</h1>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Product Display
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Product Code</th>
                                            <th>Product Name</th>
                                            <th>Product Type</th>
                                            <th>Image upload</th>
                                            <th>Description</th>
                                            <th>Price</th>
                                         </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                    SessionFactory sf = new Configuration().configure().buildSessionFactory();
                            		Session s1 = sf.openSession();
                            		Transaction tx = s1.beginTransaction();  
                            		
                        			Query<Product> query = s1.createQuery("from Product");
                        			
                        			List<Product> list = query.list();
                        			for(Product p1 : list){
                        				System.out.print(p1);
     								%>
                                        <tr>
                                        	<td><%out.print(p1.getCode());%></td>
                                        	<td><%out.print(p1.getName());%></td>
                                        	<td><%out.print(p1.getType());%></td>
                                        	<td><%out.print(p1.getImage());%></td>
                                        	<td><%out.print(p1.getDescription());%></td>
                                        	<td><%out.print(p1.getPrice());%></td>
                                        </tr>
                                    <%
                        			}
                        			tx.commit();
                        			s1.close();
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>
