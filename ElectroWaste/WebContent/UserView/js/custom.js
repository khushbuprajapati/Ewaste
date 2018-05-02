/**
 * 
 */
function loginCustomer() {
	
	var email = $('#email').val();
	var password = $('#password').val();
	//alert("aaa"+email+"---"+password);
	//alert($('#loginForm').serialize());
	$.ajax({
		url: "/ElectroWaste/customer?action=loginCustomer&email="+email+"&password="+password,
	    type: 'POST',
	    data: $('#loginForm').serialize(),
	    contentType: 'application/json',
	    dataType: 'json',
		success: function(resp){
			if(resp == false || resp == "false") {
				$('#errorMsg').html("Please enter correct email and password");
			} else {
				window.location.replace("/ElectroWaste/UserView/jsp/index.jsp");
			}
		},
		error: function(e){
			window.console.log(e.responseText);	
		}
	});
}

$('.loginInput').on("input", function() {
	$('#errorMsg').html("");
});