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

<title>Edit User</title>
</head>
<%
	SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	Session session1 = sessionFactory.openSession();
	Transaction tx1 = session1.beginTransaction();
	Query<User> query = session1.createQuery("from User where id=:id");
	query.setParameter("id", Integer.parseInt(request.getParameter("userId")));
	User user = query.getSingleResult();
%>
<body>

	<!-- Include header page -->
	<jsp:include page="adminHeader.jsp"></jsp:include>

<script type="text/javascript">
	$(document).ready(function() {
		var city = "<%=user.getCity()%>";
		$('#city').val(city);
		
		var role = "<%=user.getRole()%>";
		$('#role').val(role);
		
		var comeFrom = "<%=request.getParameter("comeFrom")%>";
		if(comeFrom == "profile") {
			$('#title').html("Profile Details");
			$('#deleteBtn').hide();
			$('#backBtn').hide();
			//$('#role').css("disabled",true);
		}
	});
</script>


	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 id="title" class="page-header">Update User Details</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">User Details</div>
					<div class="panel-body">
						<form action="<%=request.getContextPath()%>/userMasterController?action=editUser" method="post">
							<div class="table-responsive">
								
								<table class="table table-hover">
									<tr>
										<th>User Name</th>
										<td><input type="text"
											value="<%out.print(user.getName());%>" name="name">
											<input type="hidden" value="<%out.print(user.getId());%>"
											name="id"></td>
									</tr>
									<tr>
										<th>Emaill id</th>
										<td><input type="text"
											value="<%out.print(user.getEmail());%>" name="email"></td>
									</tr>
									<tr>
										<th>Contact No.</th>
										<td><input type="text"
											value="<%out.print(user.getContact());%>" name="contact"></td>
									</tr>
									<tr>
										<th>City</th>
										<td><select name="city" style="width: 61%; height: 27px;" id="city">
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
											value="<%out.print(user.getAddress());%>" name="address"></td>
									</tr>
									<tr>
										<th>Role</th>
										<td><select name="role" style="width: 61%; height: 27px;" id="role">
												<option value="">Select Role</option>
												<option value="Admin">Admin</option>
												<option value="Data Manager">Data Manager</option>
												<option value="Customer">Customer</option>
										</select></td>

									</tr>
									<tr>
										<td><input type="submit" value="Update"
											class="btn btn-default"/></td>
										<td><a id="deleteBtn"
											href="<%=request.getContextPath()%>/userMasterController?action=deleteUser&id=<%out.print(user.getId());%>"
											class="btn btn-default">Delete</a></td>
										<td><a
											href="<%=request.getContextPath()%>/AdminView/jsp/userManagement.jsp"
											class="btn btn-default" id="backBtn">Back</a></td>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
