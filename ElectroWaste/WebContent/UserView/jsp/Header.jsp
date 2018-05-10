<%@page import="com.ewaste.model.Customer"%>
<%@ page import="com.ewaste.model.Customer" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="application/x-javascript"> 
	addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 
	function hideURLbar(){ window.scrollTo(0,1); } 
</script>

<link href="<%=request.getContextPath()%>/UserView/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath()%>/UserView/css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath()%>/UserView/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link  href="<%=request.getContextPath()%>/UserView/css/flexslider.css" rel="stylesheet" type="text/css" media="screen" />

<script type="text/javascript" src="<%=request.getContextPath()%>/UserView/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/UserView/js/simpleCart.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/UserView/js/bootstrap-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/UserView/js/custom.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/UserView/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/UserView/js/imagezoom.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/UserView/js/jquery.flexslider.js"></script>
<script src="<%=request.getContextPath()%>/UserView/js/jquery.validate.min (2)"></script>

<link href='//fonts.googleapis.com/css?family=Montserrat:400,700'srel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>

<%
boolean isUserLogin = false;
Customer customerVO = null;
if(null != session.getAttribute("customerInfo")) {
	 customerVO = (Customer) session.getAttribute("customerInfo");
	 isUserLogin = true;
}
%>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		var isUserLogin = "<%=isUserLogin%>";
		$('.sessionNeed').hide();
		
		if(isUserLogin == true || isUserLogin == "true") {
			$('.sessionNeed').show();
			$('.hideMe').hide();
		} else {
			$('.hideMe').show();
		}
	});
</script>
	<!-- header -->
	<div class="header">
		<div class="container">
			<ul>
				<li><span class="glyphicon glyphicon-time" aria-hidden="true"></span>Free and Fast Delivery</li>
				<li><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Start Selling</li>
				<li class="hideMe"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>info@electrowaste.com</li>
				<li class="sessionNeed"><span class="glyphicon glyphicon-power" aria-hidden="true"></span>
					<a href="<%=request.getContextPath()%>/customer?action=logoutCustomer">Logout</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- //header -->
	<!-- header-bot -->
	<div class="header-bot">
		<div class="container">
			<div class="col-md-3 header-left">
				<h1>
					<a href="<%=request.getContextPath()%>/UserView/jsp/index.jsp"></a>
					<img src="../images/logo.png" width="200" height="100" class="glyphicon-scissors" />
				</h1>
			</div>
			<div class="col-md-6 header-middle">
				<form>
					<div class="search">
						<input type="search" value="" placeholder="Search" >
					</div>
					<div class="sear-sub">
						<input type="submit" value=" ">
					</div>
					<div class="clearfix"></div>
				</form>
			</div>
			<div class="col-md-3 header-right footer-bottom hideMe">
				<ul>
					<li><a href="<%=request.getContextPath()%>/UserView/jsp/#" class="use1" data-toggle="modal" data-target="#myModal4"
							style="margin-left: -130%;"><span style="margin-left: 19%;">Login</span></a></li>
					<li><a href="<%=request.getContextPath()%>/UserView/jsp/Registration.jsp" class="use1" 
							style="margin-left: -125%;"><span style="margin-left: 50%; width: 90px;">Registration</span></a></li>
							
<!-- 					<li><a class="fb" href="https://www.facebook.com/"></a></li> -->
<!-- 					<li><a class="twi" href="https://twitter.com/"></a></li> -->
<!-- 					<li><a class="insta" href="https://www.instagram.com/"></a></li> -->
<!-- 					<li><a class="you" href="https://www.youtube.com/results?search_query=electronic+waste+management"></a></li> -->
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //header-bot -->
	<!-- banner -->
	<div class="ban-top">
		<div class="container">
			<div class="top_nav_left">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> 
								<span class="icon-bar"></span> 
								<span class="icon-bar"></span>
							    <span class="icon-bar"></span>
							</button>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav menu__list">
								<li class="active menu__item menu__item--current"><a class="menu__link" href="<%=request.getContextPath()%>/UserView/jsp/index.jsp">
								Home <span class="sr-only">(current)</span> </a></li>
								<li class="sessionNeed dropdown menu__item"><a href="<%=request.getContextPath()%>/UserView/jsp/#" 
										class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" 
										aria-expanded="false">Dashboard <span class="caret"></span> </a>
									<ul class="dropdown-menu multi-column columns-3">
										<div class="row">
											<div class="col-sm-6 multi-gd-img1 multi-gd-text ">
												<a href="<%=request.getContextPath()%>/UserView/jsp/WasteProduct.jsp">
												<img src="../images/waste.jpg" alt=" " /></a>
											</div>
											<div class="col-sm-3 multi-gd-img">
											<h3 style="margin-left: 25px; width: 100%;">Waste Product</h3>
												<ul class="multi-column-dropdown" style="margin-left: 30px;">
													<li style="width: 170px;"><a href="<%=request.getContextPath()%>/UserView/jsp/WasteProduct.jsp">Add Waste Product Form</a></li>
													<li style="width: 175px;"><a href="<%=request.getContextPath()%>/UserView/jsp/wasteDetails.jsp">View Waste Product Details</a></li>
													<li><a href="<%=request.getContextPath()%>/UserView/jsp/MyWallet.jsp">My Wallet</a></li>
													<li><a href="<%=request.getContextPath()%>/UserView/jsp/Payment.jsp">Payment</a></li>
												</ul>
											</div>
											<div class="clearfix"></div>
										</div>
									</ul>
								</li>
								<li class="dropdown menu__item"><a
									href="<%=request.getContextPath()%>/UserView/jsp/#"
									class="dropdown-toggle menu__link" data-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="false">Computer equipments <span class="caret"></span></a>
									<ul class="dropdown-menu multi-column columns-3">
										<div class="row">
											<div class="col-sm-3 multi-gd-img">
												<ul class="multi-column-dropdown">
													<li>Desktop pc</li>
													<li>Laptop</li>
													<li>Monitors</li>
													<li>Keyboards</li>
													<li>Mobile Phone</li>
													<li>Printer</li>
													
												</ul>
											</div>

											<div class="col-sm-6 multi-gd-img multi-gd-text ">
<%-- 											<a href="<%=request.getContextPath()%>/UserView/jsp/single.jsp"> --%>
												<img src="../images/woo1.jpg" alt=" " /></a>
											</div>
											<div class="clearfix"></div>
										</div>
									</ul>
								</li>
								<li class=" menu__item"><a class="menu__link"
									href="<%=request.getContextPath()%>/UserView/jsp/How-it-works.jsp">How it works ?</a></li>


								<li class=" menu__item"><a class="menu__link"
									href="<%=request.getContextPath()%>/UserView/jsp/contact.jsp">contact</a></li>
									
								<li class=" menu__item"><a class="menu__link"
									href="<%=request.getContextPath()%>/UserView/jsp/about.jsp">About Us</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
<!-- 			<div class="top_nav_right"> -->
<!-- 				<div class="cart box_1"> -->
<%-- 					<a href="<%=request.getContextPath()%>/UserView/jsp/checkout.jsp"> --%>
<!-- 						<h3> -->
<!-- 							<div class="total"> -->
<!-- 								<i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i> -->
<!-- 								<span class="simpleCart_total">Rs 0.00</span> (<span -->
<!-- 									id="simpleCart_quantity" class="simpleCart_quantity"></span> -->
<!-- 								items) -->
<!-- 							</div> -->
<!-- 						</h3> -->
<!-- 					</a> -->
<!-- 					<p> -->
<!-- 						<a href="javascript:;" class="simpleCart_empty">Empty Cart</a> -->
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="top_nav_right"> -->
<!-- 				<div class="cart box_1" style="height: 73px; width: 125px; margin-left: 100px;"> -->
<%-- 					<a href="<%=request.getContextPath()%>/UserView/jsp/Registration.jsp"> --%>
<!-- 						<h4> -->
<!-- 							<div> -->
<!-- 								<span>Registration</span>  -->
<!-- 							</div> -->
<!-- 						</h4> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //banner-top -->
	
	<!-- login -->
			<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>						
						</div>
						
						<div>
							
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
								<div class="login">
								
									<div class="login-right">
									<h4><label id="errorMsg" style="color: red;"></label></h4>
									<br/><br/>
										<h3 align="center">SIGN IN</h3>
										<!-- <form name="loginForm" action="<%=request.getContextPath()%>/customer?action=loginCustomer" method="post"> -->
										<form name="loginForm" id="loginForm" method="post" >
											<fieldset>
											<div class="sign-in">
												<h4>Email :</h4>
												<input type="text" value="" name="email" id="email" placeholder="Enter your email id" autocomplete="nope" style="color: #524747;" required>	
											</div>
											<div class="sign-in">
												<h4>Password :</h4>
												<input type="password" value="" id="password" name="password" placeholder="Password" autocomplete="off" style="color: #524747;" required>
												<a href="<%=request.getContextPath()%>/UserView/jsp/#">Forgot password?</a>
											</div>
											
											<div class="sign-in">
												<input type="button" onclick="loginCustomer();" value="SIGN IN" reqquired>
											</div>
											<br/>
											<div class="sign-up">
												<h6>Don't have an account?<a href="<%=request.getContextPath()%>/UserView/jsp/Registration.jsp">&nbsp;<span><u>SIGN UP</u></span></a></h6>
											</div>
											</fieldset>
										</form>
									</div>
									<div class="clearfix" style="margin-top:-50px;"></div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- //login -->


</html>