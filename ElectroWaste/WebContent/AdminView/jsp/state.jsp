<%@page import="java.util.Iterator"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ewaste.model.State"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Theme</title>
</head>

<body>
   
    <!-- Include header page -->
	<jsp:include page="adminHeader.jsp"></jsp:include>
	                
<!--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">State Management</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           State Management
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" action="<%=request.getContextPath()%>/StateController" method="post">
                                        <div class="form-group">
                                         	<label>State Name</label>
                                         	<select class="form-control" name="stateName" style="width: 83%; height: 35px;" >
                                         		<option>Gujarat</option>
                                         		<option>Haryana</option>
                                         		<option>Bihar</option>
                                         		<option>Karnataka</option>
                                         		<option>Madhya Pradesh</option>
                                         		<option>Odisha</option>
                                         	</select>
										<!--<input type="text" class="form-control" name="stateName" placeholder="Enter state name"/> -->
                                        </div>
                                       <button type="submit" class="btn btn-default">Submit</button>
                                   	</form>
                                </div>
                             </div>
                         </div>
                     </div>
                     
  <hr>
<!--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
                        
               <div class="row">
                  <div class="col-lg-12">
                     <div class="panel panel-default">
                        <div class="panel-heading">
                            State Management Details
                        </div>
                        
                        <div class="panel-body">
                        	<div class="row">
                                <div class="col-lg-6">
                        			<form action="<%=request.getContextPath()%>/StateController" method="post">
                            			<div class="table-responsive">
                                			<table class="table table-hover">
                                    			<thead>
		                                        	<tr>
		                                        		<th>Id</th>
			                                            <th>State Name</th>
			                                            <th>Edit</th>
			                                            <th>Delete</th>
		                                       	    </tr>
		                                     	 </thead>
		                                     	 <tbody>
		                                     	 <%
		                                     	SessionFactory sf = new Configuration().configure().buildSessionFactory();
		                                 		Session s1 = sf.openSession();
		                                 		Transaction tx = s1.beginTransaction();
			
		                                 		Query<State> query = s1.createQuery("from State");
		                                 		List<State> list = query.list();
		                                 		for(State st : list){
		                                 			System.out.print(st);
		                                     	 %>
		                                     		<tr> 
 					                                   <td><%out.print(st.getStateId());%></td>  
					                                   <td><%out.print(st.getStateName());%></td> 
 					                                   <td><a href="<%=request.getContextPath()%>/StateController?id=<%out.print(st.getStateId());%>">Edit</a></td>
 					                                   <td><a href="<%=request.getContextPath()%>/StateControllerid=<%out.print(st.getStateId());%>">Delete</a></td> 
					                                </tr>
												<%
		                                 		}
		                                 		tx.commit();
		                                 		s1.close();
												%>
			                                    </tbody>
                               				 </table>
                            			</div>
                           			</form>
                        		</div>
                    		</div>
                    	</div>
                	</div>
           		</div>
           	</div>
        </div>
    </div>
</div>   
    
  </body>
</html>
