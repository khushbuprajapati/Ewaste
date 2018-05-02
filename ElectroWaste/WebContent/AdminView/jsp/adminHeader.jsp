<%@page import="com.ewaste.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

<%
User userVO = null;
	System.out.println("---"+session.getAttribute("userInfo"));

	if(null != session.getAttribute("userInfo")) {
		userVO = (User)session.getAttribute("userInfo");
	}
%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">	

    <title>Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/AdminView/jsp/../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=request.getContextPath()%>/AdminView/jsp/../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/AdminView/jsp/../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<%=request.getContextPath()%>/AdminView/jsp/../vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath()%>/AdminView/jsp/../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<!-- DataTables CSS -->
    <link href="<%=request.getContextPath()%>/AdminView/jsp/../vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
    
    <!-- DataTables Responsive CSS -->
    <link href="<%=request.getContextPath()%>/AdminView/jsp/../vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
	
	<!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
    
    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>
    
    <!-- DataTables JavaScript -->
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>
    
	<script>
    $(document).ready(function() {
        /* $('#dataTables-example').DataTable({
            responsive: true
        }); */
    });
    </script>
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

  
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=request.getContextPath()%>/AdminView/jsp/index.jsp">ElectroWaste</a>
            </div>
            <!-- /.navbar-header -->
			<div  class="nav navbar-top-links navbar-right">
				<ul>
                
                <li><label><h4>Welcome <%=userVO.getName() %> </h4></label></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="<%=request.getContextPath()%>/AdminView/jsp/#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="<%=request.getContextPath()%>/AdminView/jsp/userDetails.jsp?userId=<%=session.getAttribute("userId").toString() %>&comeFrom=profile"><i class="fa fa-user fa-fw"></i> 
                    	<% 
	 					//out.write(session.getAttribute("AdminName").toString());
						%>
                        Profile</a>
                        </li>
                        
                        <li class="divider"></li>
                        <li><a href="<%=request.getContextPath()%>/adminLogin?action=logoutAdmin"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
			</div>
            
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="<%=request.getContextPath()%>/AdminView/jsp/index.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <%-- <li>
                            <a href="<%=request.getContextPath()%>/AdminView/jsp/login.jsp"><i class="fa fa-dashboard fa-fw"></i> Login Page</a>
                        </li> --%>
                        <li>
                            <a href="<%=request.getContextPath()%>/AdminView/jsp/#"><i class="fa fa-dashboard fa-fw"></i> User Management<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            	<li>
                                    <a href="<%=request.getContextPath()%>/AdminView/jsp/addUser.jsp">Add User</a>
                                </li>
                            	<li>
                                    <a href="<%=request.getContextPath()%>/AdminView/jsp/userManagement.jsp">View User List</a>
                                </li>
<!--                                 <li> -->
<%--                                     <a href="<%=request.getContextPath()%>/AdminView/jsp/userManagement.jsp">User Details</a> --%>
<!--                                 </li> -->
                                
                            </ul>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/AdminView/jsp/product.jsp"><i class="fa fa-dashboard fa-fw"></i> Product</a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/AdminView/jsp/#"><i class="fa fa-dashboard fa-fw"></i> Waste Product<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<%=request.getContextPath()%>/AdminView/jsp/wasteProduct.jsp">View Waste Product List</a>
                                </li>
<!--                                 <li> -->
<%--                                     <a href="<%=request.getContextPath()%>/AdminView/jsp/wasteProduct_Details.jsp">Waste Product Details</a> --%>
<!--                                 </li> -->
<!--                                 <li> -->
<%--                                     <a href="<%=request.getContextPath()%>/AdminView/jsp/addWaste.jsp">Add Waste</a> --%>
<!--                                 </li> -->
                            </ul>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/AdminView/jsp/category.jsp"><i class="fa fa-dashboard fa-fw"></i> Category</a>
                        </li>
                        <li><a href="<%=request.getContextPath()%>/adminLogin?action=logoutAdmin"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
<!--                         <li> -->
<%--                             <a href="<%=request.getContextPath()%>/AdminView/jsp/sub-category.jsp"><i class="fa fa-dashboard fa-fw"></i>Sub-Category</a> --%>
<!--                         </li> -->
                        <%-- <li>
                            <a href="<%=request.getContextPath()%>/AdminView/jsp/state.jsp"><i class="fa fa-dashboard fa-fw"></i>State Management</a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/AdminView/jsp/city.jsp"><i class="fa fa-dashboard fa-fw"></i>City Management</a>
                        </li> --%>
                    </ul>
                </div>
            </div>
        </nav>
     </div>

</body>
</html>