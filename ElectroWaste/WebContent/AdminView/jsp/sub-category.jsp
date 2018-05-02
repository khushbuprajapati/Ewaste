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

<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Sub-Category</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Sub-Category
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                
                                    <form role="form" action="<%=request.getContextPath()%>/SubCategoryController" method="post">
                                       <div class="form-group">
                                            <label>Category Name:</label>
                                            <select class="form-control">
                                                <option>Televisions</option>
                                                <option>Digital Cameras</option>
                                                <option>Laptop</option>
                                                <option>Computer Parts</option>
                                            </select>
                                        </div> 
                                        <div class="form-group">
                                            <label>Sub-category Name:</label>
                                            <input class="form-control" placeholder=" enter sub-category name" name="scname">
                                        </div>
                                        <button type="submit" class="btn btn-default">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>
