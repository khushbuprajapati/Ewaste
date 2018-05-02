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
	        <h3>Waste Product</h3>
		</div>
	</div>
	<!-- //banner -->

<!-- Waste Product Form -->
	<div class="contact">
		<div class="container" style="margin-top: -40px;">
			<h3 class="tittle" style="color: orange;">Waste Product Form</h3><br/>
			<form action="<%=request.getContextPath()%>/wasteProductController?action=addWasteProduct" method="post" id="wasteForm">
				<div class="contact-form2">
					<label>Waste Product Name *</label>
					<input type="text" id="wasteName" name="wpName" value="" placeholder="Waste Product Name" style="width:55%;" required ><br/><br/>
					
					<label>Waste Product Type *</label>&nbsp;&nbsp;
					<select name="wpType" style="width: 55%; height: 38px;" required>
						<option>Home Appliance</option>
						<option>Computer equipments</option>
						<option>other</option>
					</select>
					
					<div><label>Description *</label><br/>
						<textarea name="description" placeholder="Description..." style="margin-left: 159px;width: 55%; margin-top: 1px;" required></textarea>
					</div>
					
					<div><label>Waste Image Upload</label>
					<input type='file' name="photoUpload" onchange="readURL(this);" style="margin-left: 165px; margin-top: -22px;" /><br/>
					</div>
					
					<label>Expected Price</label>
					<input type="text" name="price" value="" placeholder="Expected Price" style="margin-left: 55px; width: 55%;" required><br/><br/>
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
