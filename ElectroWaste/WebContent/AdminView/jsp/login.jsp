<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Theme</title>

    <link href="<%=request.getContextPath()%>/AdminView/jsp/../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/AdminView/jsp/../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/AdminView/jsp/../dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/AdminView/jsp/../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="<%=request.getContextPath()%>/adminLogin?action=loginAdmin" method="post">
                            <%
				            if(request.getParameter("errorMsg") != null){
				            	%>
				            	<p style="color: red;text-align: center;margin-top: 10px"><% out.print("Either UserName or Password is Wrong!");%></p>
				            	<%
				            }
				            %>
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="User Name" name="userName" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                  <input type="submit" value="Login" class="btn btn-lg btn-success btn-block">
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
