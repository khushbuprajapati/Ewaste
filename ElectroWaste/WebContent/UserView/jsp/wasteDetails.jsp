<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.util.List"%>
<%@page import="com.ewaste.model.WasteProduct"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
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

	<!-- Waste Product Table details -->
        <div class="row">
                <div class="col-lg-6" >
                    <div class="panel panel-default" style="margin-top: 30px; margin-right: -90%;margin-left: 123px;">
                        <div class="panel-heading" style="padding: 1% 40%; color: orange; font-size: 18px;">
                           Waste Product Details
                        </div>
                        <div class="panel-body" >
                            <div class="table-responsive">
                              <form action="<%=request.getContextPath()%>/WasteProductController" method="post">
                                <table width="100%" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                        	<th>Id</th>
                                            <th>Waste Product Name</th>
                                            <th>Waste Product Type</th>
                                            <th>Uploaded Photo</th>
                                            <th>Description</th>
                                            <th>Expected Price</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                    SessionFactory sf = new Configuration().configure().buildSessionFactory();
                            		Session s1 = sf.openSession();
                            		Transaction tx = s1.beginTransaction();  
                            		
                        			Query<WasteProduct> query = s1.createQuery("from WasteProduct");
                        			
                        			List<WasteProduct> list = query.list();
                        			for(WasteProduct wp1 : list){
                        				System.out.print(wp1);
     								%>
                                   <tr>
                                   		<td><%out.print(wp1.getId()); %></td>
                                   		<td><%out.print(wp1.getName()); %></td>
                                   		<td><%out.print(wp1.getType()); %></td>
                                   		<td><%out.print(wp1.getPhoto()); %></td>
                                   		<td><%out.print(wp1.getDescription());%></td>
                                   		<td><%out.print(wp1.getPrice());%></td>
                                   		<td><a href="<%=request.getContextPath()%>/UpdateWasteProduct?id=<%out.print(wp1.getId());%>">Edit</a></td>
                                   		<td><a href="<%=request.getContextPath()%>/WasteProductController?action=deleteWasteProduct&id=<%out.print(wp1.getId());%>">Delete</a></td>
                                   </tr>
                                   <%
                        			}
                        			tx.commit();
                        			s1.close();
                                   %>
                                </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
<!-- //Waste Product table details -->

	<!-- Include header page -->
	<jsp:include page="Footer.jsp"></jsp:include>
	

</body>
</html>
