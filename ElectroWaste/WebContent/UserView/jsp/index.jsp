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

	<!-- banner -->
	<div class="banner-grid">
		<div id="visual">
			<div class="slide-visual">
				<!-- Slide Image Area (1000 x 591) -->
				<ul class="slide-group">
					<li><img class="img-responsive" src="../images/baaa1.jpg" alt="Image" /></li>
					<li><img class="img-responsive" src="../images/baaa2.png" alt="Image" /></li>
					<li><img class="img-responsive" src="../images/baaa3.jpg" alt="Image" /></li>
				</ul>

				<!-- Slide Description Image Area (316 x 328) -->
				<div class="script-wrap">
					<ul class="script-group">
						<li><div class="inner-script">
								<img class="img-responsive" src="../images/ba1.jpg" alt="Image" />
							</div></li>
						<li><div class="inner-script">
								<img class="img-responsive" src="../images/ba2.png" alt="Image" />
							</div></li>
						<li><div class="inner-script">
								<img class="img-responsive" src="../images/ba3.jpg" alt="Image" />
							</div></li>
					</ul>
					<div class="slide-controller">
						<a href="<%=request.getContextPath()%>/UserView/jsp/#" class="btn-prev">
						<img src="../images/btn_prev.png" alt="Prev Slide" /></a> 
						<a href="<%=request.getContextPath()%>/UserView/jsp/#" class="btn-play">
						<img src="../images/btn_play.png" alt="Start Slide" /></a> 
						<a  href="<%=request.getContextPath()%>/UserView/jsp/#" class="btn-pause">
						<img src="../images/btn_pause.png" alt="Pause Slide" /></a> 
						<a href="<%=request.getContextPath()%>/UserView/jsp/#" class="btn-next">
						<img src="../images/btn_next.png" alt="Next Slide" /></a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/UserView/js/pignose.layerslider.js"></script>
		<script type="text/javascript">
			//<![CDATA[
			$(window).load(function() {
				$('#visual').pignoseLayerSlider({
					play : '.btn-play',
					pause : '.btn-pause',
					next : '.btn-next',
					prev : '.btn-prev'
				});
			});
			
			
			//]]>
		</script>

	</div>
	<!-- //banner -->
	<!-- content -->

	<div class="new_arrivals">
		<div class="container">
			<h3>
				<span>Electronic</span> Equipments
			</h3>
			<p></p>
			<!-- Electronics -->
<div class="electronics" style="margin-top: -80px;">
	<div class="container">
		<div class="col-md-8 electro-left text-center">
			<div class="electro-img-left mask">
				<div class="content-grid-effect slow-zoom vertical">
					<div class="img-box"><img src="../images/e5.jpg" alt="image" class="img-responsive zoom-img"></div>
						<div class="info-box">
							<div class="info-content electro-text simpleCart_shelfItem">
								<h4>Smart Phone</h4>
							</div>
						</div>
				</div>
			</div>
			<div class="electro-img-btm-left mask">
				<div class="content-grid-effect slow-zoom vertical">
					<div class="img-box"><img src="../images/e1.jpg" alt="image" class="img-responsive zoom-img"></div>
						<div class="info-box">
							<div class="info-content electro-text simpleCart_shelfItem">
								<h4>Mobiles</h4>
							</div>
						</div>
				</div>
			</div>
			<div class="electro-img-btm-right mask">
				<div class="content-grid-effect slow-zoom vertical">
					<div class="img-box"><img src="../images/e2.jpg" alt="image" class="img-responsive zoom-img"></div>
						<div class="info-box">
							<div class="info-content electro-text simpleCart_shelfItem">
								<h4>Branded Watches</h4>
							</div>
						</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="col-md-4 electro-right text-center">
			<div class="electro-img-rt mask">
				<div class="content-grid-effect slow-zoom vertical">
					<div class="img-box"><img src="../images/e4.jpg" alt="image" class="img-responsive zoom-img"></div>
						<div class="info-box">
							<div class="info-content electro-text simpleCart_shelfItem">
								<h4>Mobiles</h4>
							</div>
						</div>
				</div>
			</div>
		</div>
		
       
        
        <div class="clearfix"></div>
			<div class="ele-bottom-grid">
				<h3><span style="color: black;">The Electro Waste Problem is Huge</span></h3>
				
					<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
									<img src="../images/111.jpg" alt="" class="pro-image-front" class="img-responsive zoom-img">
									<img src="../images/111.jpg" alt="" class="pro-image-back" class="img-responsive zoom-img">
										<span class="product-new-top">Problem</span>
								<div class="item-info-product ">
									<h4 style="color: orange; height: 75px;">We make a lots of electronic waste.  </h4>
								</div>
							</div>
						</div>
						
                        <div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
									<img src="../images/222.jpg" alt="" class="pro-image-front">
									<img src="../images/222.jpg" alt="" class="pro-image-back">
										<span class="product-new-top">Problem</span>
								<div class="item-info-product ">
									<h4 style="color: orange;">collecting of the electronic garbage materials from the customers, industries, college, and local collector and so on. </h4>
								</div>
							</div>
						</div>
                        
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
									<img src="../images/333.jpg" alt="" class="pro-image-front">
									<img src="../images/333.jpg" alt="" class="pro-image-back">
									<span class="product-new-top">Problem</span>
								<div class="item-info-product ">
									<h4 style="color: orange; height: 75px;">Electro waste is the Toxic Legacy of our Digital Age
											Our waste electronics are polluting drinking water and harming eco-systems around the world. 
											 </h4>
								</div>
							</div>
						</div>
						
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
									<img src="../images/444.gif" alt="" class="pro-image-front">
									<img src="../images/444.gif" alt="" class="pro-image-back">
									<span class="product-new-top">Problem</span>
								<div class="item-info-product ">
									<h4 style="color: orange; height: 75px;">It's time to fix the problem.</h4>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
			</div>
	</div>
</div>
<!-- //Electronics -->
<!-- //product-nav -->
	<!-- //product-nav -->
	
	<!-- Include header page -->
	<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>
