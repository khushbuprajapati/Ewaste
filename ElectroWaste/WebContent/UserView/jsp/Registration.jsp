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
<!-- <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script> -->
<!-- <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script> -->
<!-- <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css' -->
<!--     media="screen" /> -->

</head>
<body>
	<!-- Include header page -->
	<jsp:include page="Header.jsp"></jsp:include>
	
	<br>
	<br>
	<br>
	<br>
	<br>

<!-- Registration -->
	<div class="modal-body modal-spa" style="margin-bottom: -135px;">
		<div class="login-grids">
			<div class="login">
				<div class="login-bottom">
					<h3 align="center" style="margin-top: -111px;">SIGN UP FORM</h3>
					<form action="<%=request.getContextPath()%>/customer?action=addCustomerRegistration"
						method="post">
						<div class="sign-up">
							<label>First Name:</label> <input type="text" name="firstName"
								value="" placeholder="First Name" style="color: #433f3f;"
								required>
						</div>
						<div class="sign-up">
							<label>Last Name :</label> <input type="text" name="lastName"
								value="" placeholder="Last Name" style="color: #433f3f;"
								required>
						</div>
						<div class="sign-up">
							<label>Contact No :</label> <input type="text" name="contact"
								value="" placeholder="Contact No" style="color: #433f3f;"
								required>
						</div>
						<div class="sign-up">
							<label>Email id :</label> <input type="text" name="email"
								value="" placeholder="Email id" style="color: #433f3f;" required>
						</div>
						<div class="sign-up">
							<label>Password :</label> <input type="password" name="password"
								value="" placeholder="Password" style="color: #433f3f;" required>
						</div>
						<div class="sign-up">
							<label>Re-type Password :</label> <input type="password"
								name="rePassword" value="" placeholder="re-type pasword"
								style="color: #433f3f;" required>
						</div>
						<div class="sign-up">
							<label>City :</label><br>
							<select id="city" name="cityName"
								style="width: 100%; height: 45px;" required>
								<option value="Ahmedabad"> Ahmedabad </option>
								<option value="Gandhinagar"> Gandhinagar </option>
								<option value="Surat"> Surat </option>
								<option value="Vadodara"> Vadodara </option>
								<option value="Jamnagar"> Jamnagar </option>
								<option value="Bhavnagar"> Bhavnagar </option>
							</select>
						</div>
						<br />
						<div class="sign-up">
							<label>Address :</label>
							<textarea name="address" rows="" cols=""
								placeholder="Write address.."
								style="width: 100%; line-height: 2;" required></textarea>
						</div>
						<br />
						<div class="sign-up">
							<input type="submit" value="SIGN UP NOW">
						</div>

					</form>
				</div>
				<div class="clearfix" style="margin-top: -40px;"></div>
			</div>
<!-- 			<div style="margin-left: 165px;"> -->
<!-- 				By logging in you agree to our <a -->
<%-- 					href="<%=request.getContextPath()%>/UserView/jsp/#">Terms and Conditions</a> and <a --%>
<%-- 					href="<%=request.getContextPath()%>/UserView/jsp/#">Privacy Policy</a> --%>
<!-- 			</div> -->
		</div>
	</div>
	<!-- //Registration-->

	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- Include header page -->
	<jsp:include page="Footer.jsp"></jsp:include>


</body>
</html>