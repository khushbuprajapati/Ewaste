<%@page import="com.ewaste.model.User"%>
<%@page import="com.ewaste.model.Customer"%>
<%@page import="com.ewaste.model.WasteProduct"%>
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

    <title>Edit Waste Product</title>
</head>
<%
System.out.println(request.getParameter("id"));
	SessionFactory sf = new Configuration().configure().buildSessionFactory();
	Session s1 = sf.openSession();
	Transaction tx = s1.beginTransaction();  
	Query<WasteProduct> query = s1.createQuery("from WasteProduct where id=:id");
	query.setParameter("id",Integer.parseInt(request.getParameter("id")));
	WasteProduct waste = query.getSingleResult();
%>
<body>

     <!-- Include header page -->
	<jsp:include page="adminHeader.jsp"></jsp:include>
	
   
     <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Waste Product Details
                        </div>
                        <div class="panel-body">
                       	 <form action="<%=request.getContextPath()%>/WasteProductController" method="post">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                        <tr>
                                            <th>Waste Product Name</th>
                                            <td><input type="text" 
                                            value="<%out.print(waste.getName());%>" name="wpName">
                                            <input type="hidden" value="<%out.print(waste.getId());%>" name="id"></td>
                                        </tr>        
                                        <tr>
                                            <th>Waste Product Type</th>
                                            <td>
                                            	<select name="wpType" id="wpType" style="width: 77%; height: 25%;">
                                            		<option value="">Select Waste Product Type</option>
                                            		<option value="Home Appliance">Home Appliance</option>
                                            		<option value="Computer Equipments">Computer Equipments</option>
                                            		<option Value="Other">Other</option>
                                            	</select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Photo Upload</th>
                                            <td><img alt="image1" src="image/televisions.jpg"></td>
                                        </tr>
                                        <tr>
                                            <th>Description</th>
                                            <td><input type="text"
                                            	value="<%out.print(waste.getDescription());%>" name="description" id="description"></td>
                                        </tr>
                                        <tr>
                                            <th>Expected Price</th>
                                            <td><input type="text"
                                            value="<%out.print(waste.getPrice());%>" name="expectedPrice" id="expectedPrice"></td>
                                        </tr>
                                </table>
                              </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<hr>

	
	
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 id="title" class="page-header">View Customer Details</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">Customer Details</div>
					<div class="panel-body">
						<form action="<%=request.getContextPath()%>/userMasterController?action=editUser" method="post">
							<div class="table-responsive">
								<table class="table table-hover">
									<tr>
										<th>User Name</th>
										<td><input type="text"
											value="" name="name">
											<input type="hidden" value=""
											name="id" style="width: 243px;"></td>
									</tr>
									<tr>
										<th>Emaill id</th>
										<td><input type="text"
											value="" name="email" style="width: 243px;"></td>
									</tr>
									<tr>
										<th>Contact No.</th>
										<td><input type="text"
											value="" name="contact" style="width: 243px;"></td>
									</tr>
									<tr>
										<th>City</th>
										<td><select name="city" style="width: 73%; height: 27px;" id="city">
												<option value="">Select City</option>
												<option value="Ahmedabad">Ahmedabad</option>
												<option value="Surat">Surat</option>
												<option value="Bhavanagar">Bhavnagar</option>
												<option value="Vadodara">Vadodara</option>
												<option value="Jamanagar">Jamnagar</option>
										</select></td>
									</tr>
									<tr>
										<th>Address</th>
										<td><input type="text"
											value="" name="address" style="width: 243px;"></td>
									</tr>
									<tr>
										<th>Role</th>
										<td><select name="role" style="width: 73%; height: 27px;" id="role">
												<option value="">Select Role</option>
												<option value="Admin">Admin</option>
												<option value="Data Manager">Data Manager</option>
												<option value="Customer">Customer</option>
										</select></td>

									</tr>
								</table>
                            </div>
                          </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		
<hr>

	<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Price
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                 <form role="form" action="" method="post">
                                     <div class="form-group input-group">
                                         <span class="input-group-addon">Approved Price</span>
                                         <input type="text" class="form-control" placeholder="ApprovedPrice">
                                         <span class="input-group-addon">.00</span>
                                     </div>
                                     <lable>Comment</lable>
                                     <div>
                                     	<textarea rows="3" cols="" style="width: 100%;" placeholder="Comment">
                                        		
                                        	</textarea>
                                     </div>
                                     <table>
                                     	<tr>
                            					<td><a href="<%=request.getContextPath()%>/AdminView/jsp/wasteProduct.jsp"   class="btn btn-default">Approve</a></td>
                            					<td><a href="<%=request.getContextPath()%>/AdminView/jsp/wasteProduct.jsp"  class="btn btn-default">Reject</a></td>
                            					<td><a href="<%=request.getContextPath()%>/AdminView/jsp/wasteProduct.jsp"  class="btn btn-default">Back</a></td>
                                    		</tr>
                                    	</table>
                                 </form>
	                        </div>
	                      </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
</body>
</html>
