<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore Administration</title>
<link rel="stylesheet" href="../css/style.css">

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include><br/><br/>
	
	<h2 align="center" class="pageheading"> Administrative Dashbord <hr width="60%" /> </h2><br/></br>
	
	
	
	<div align="center" >
	
		<h2 class="pageheading">Quick Action : </h2>
		<a href="create_book">New Book</a>&nbsp;
		<a href="create_user">New user</a>&nbsp;
		<a href="create_catagory">New Catagory</a>&nbsp;
		<a href="create_customer">New Customer</a>
		
	</div>
	
	<div align="center">
				<hr width="60%" />
				
				<h2 class="pageheading">Recent Sale:</h2>
				
	
	</div>
	
	
	<div align="center">
				<hr width="60%" />
				
				<h2 class="pageheading">Recent Reviews:</h2>
				
	
	</div>
	
	
	<div align="center">
					<hr width="60%" />
				
				<h2 class="pageheading">Statistics:</h2>
				
				<hr width="60%" />
				
	
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>