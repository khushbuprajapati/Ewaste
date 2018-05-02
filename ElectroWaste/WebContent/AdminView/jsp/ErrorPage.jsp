<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Error Page</title>

</head>

<body>

	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Oops! There is something wrong..</h1>
			</div>
			
			<div class="col-lg-12">
				<h4 class="page-header">Please <a href="<%=request.getContextPath()%>/AdminView/jsp/login.jsp">ReLogin Here<a></a></h4>
			</div>
		</div>
	</div>
</body>
</html>
