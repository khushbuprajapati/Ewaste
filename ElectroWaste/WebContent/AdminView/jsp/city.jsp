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
	          
<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">City Management</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           City Management Form
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" action="<%=request.getContextPath()%>/CityController" method="post">
                                        <div class="form-group">
                                            <label>City Name</label>
                                            <input class="form-control" placeholder=" enter city name" name="cityName">
                                        </div>
                                        <div class="form-group">
                                            <label>State Name</label>
                                            <select class="form-control" name="stateName">
                                                <option>Gujarat</option>
                                                <option>Haryana</option>
                                                <option>Bihar</option>
                                                <option>Karnataka</option>
                                                <option>Madhya Pradesh</option>
                                                <option>Odisha</option>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-default"><a href="cityManagement.jsp">Submit</a></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
            	</div>
            </div>

<!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
                
             <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            City Management Details
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                          <form action="<%=request.getContextPath()%>/StateController" method="post">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                        	<th>City name</th>
                                            <th>State name</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Surat</td>
                                            <td>Gujarat</td>
                                            <td>Edit</td>
                                            <td>Delete</td>
                                        </tr>
                                        <tr>
                                            <td>Mumbai</td>
                                            <td>Maharast</td>
                                            <td>Edit</td>
                                            <td>Delete</td>
                                        </tr>
                                        <tr>
                                            <td>Simla</td>
                                            <td>Jammu-kasmir</td>
                                            <td>Edit</td>
                                            <td>Delete</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                          </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>
