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

	<script type="text/javascript">
		$(document).ready(function() {
			 $('#wasteForm').validate({

			        // Specify the validation rules
			        rules: {
			        	wpName: {
			        		required: true,
			        		minlength: 10,
			        		maxlength: 10,
			        		lettersonly: true
			        	}
			        },
			        messages:{
			        	wpName: "Please enter your firstname",
			        		
			        	}	
			        },

			        submitHandler: function(form) {
			            form.submit();
			        }
			    });
		});
	</script>
</head>
<body>

	<!-- Include header page -->
	<jsp:include page="Header.jsp"></jsp:include>

	<!-- banner -->
	<div class="page-head2">
		<div class="container">
			<br>
	        <br>
	        <br>
	        <h3>Waste Product Payment</h3>
		</div>
	</div>
	<!-- //banner -->

<!-- Waste Product Form -->
	<div class="contact">
		<div class="container" style="margin-top: -40px;">
			<h3 class="tittle" style="color: orange;"> Receive Payment</h3><br/>
			<form action="<%=request.getContextPath()%>/wasteProductController?action=addWasteProduct" method="post" id="wasteForm">
				<div class="contact-form2">
					<label>CVV No. *</label>
					<input type="text" id="wasteName" name="wpName" value="" placeholder="CVV No." style="width:57%; margin-left: 20px;" required ><br/><br/>
					
					<label>Bank Name *</label>
					<select name="wpType" style="width: 57%; height: 38px;" required>
						<option>SBI</option>
						<option>BANK OF BARODA</option>
						<option>ICICI</option>
					</select>
					<br/><br/>
					
					<label>Account No. *</label>
					<input type="text" id="wasteName" name="wpName" value="" placeholder="Account No" style="width:57%;" required ><br/><br/>
					
					<label>Branch </label>
					<input type="text" id="wasteName" name="wpName" value="" placeholder="Branch" style="width:57%;margin-left: 44px;" required ><br/><br/>
					
					
					<input type="submit" value="Submit" id="submit">
				</div>
			</form>
		</div>
	</div>
<!-- //Waste Product Form -->
<!-- //product-nav -->

	<!-- Include header page -->
	<jsp:include page="Footer.jsp"></jsp:include>


</body>
</html>
