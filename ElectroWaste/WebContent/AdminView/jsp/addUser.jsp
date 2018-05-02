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

	<jsp:include page="adminHeader.jsp"></jsp:include>


	<div id="page-wrapper">

		<div class="row">
			<%
				if (null!= request.getParameter("flag") && request.getParameter("flag").equalsIgnoreCase("true")) {
			%>
			<h4 style="color: green;">User Details Added Successfully</h4>
			<%
				}
			%>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Add New User</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">Add new user Details</div>

					<div class="panel-body">
						<div class="table-responsive">
							<form
								action="<%=request.getContextPath()%>/userMasterController?action=addUser"
								method="post">
								<table class="table table-hover">
									<tr>
										<th>User Name</th>
										<td><input type="text" name="userName"></td>
									</tr>
									<tr>
										<th>Emaill id</th>
										<td><input type="text" name="email"></td>
									</tr>
									<tr>
										<th>Password</th>
										<td><input type="password" name="pasword"></td>
									</tr>
									<tr>
										<th>Contact No.</th>
										<td><input type="text" name="contact"></td>
									</tr>
									<tr>
										<th>City</th>
										<td><select name="city" style="width: 58%; height: 27px;">
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
										<td><input type="text" name="address"></td>
									</tr>
									<tr>
										<th>Role</th>
										<td><select name="role" style="width: 58%; height: 27px;">
												<option value="">Select Role</option>
												<option value="Admin">Admin</option>
												<option value="Data Manager">Data Manager</option>
												<option value="Customer">Customer</option>
										</select></td>
									</tr>
									<tr>
										<td><input type="submit" value="Submit"></td>
										<td><input type="button" value="Cancel"></td>
									</tr>
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
