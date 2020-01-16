<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Customers</title>

<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include><br/><br/>
	
	<div align="center">
	
	<h2 class="pageheading"> Customer Management </h2><br/>
	
	<h3><a href="customer_form.jsp">Create New Customer</a></h3>
	
	</div>
	
	<c:if test="${message != null }">
	
	<div align="center">
		
		<h4 class="message">${message}</h4>
	
	</div>
	</c:if>
	
	<div align="center">
	
		<table border="1" cellpadding="5">
		
			<tr>
			
				<th>Index</th>
				<th>Id</th>
				<th>E-mail</th>
				<th>Full Name</th>
				<th>City</th>
				<th>Country</th>
				<th>Register Date</th>
				<th>Actions</th>
		
			</tr>
			
			<c:forEach var="customer" items="${listCustomer}" varStatus="status">
			
				<tr>
				
					<td>${status.index + 1}</td>
					<td>${customer.customerId}</td>
					
					
					<td>${customer.email}</td>
					<td>${customer.fullname}</td>
					<td>${customer.city}</td>
					<td>${customer.country}</td>
					<td>${customer.registerDate}</td>
					
					
					
					<td> 
					
							<a href="edit_customer?id=${customer.customerId}">Edit</a> &nbsp;
							<a href="javascript:void(0);" class="deleteLink" id="${customer.customerId}">Delete</a>
					
					</td>
				
				</tr>
			
			</c:forEach>
			
		</table>
	
	
	</div>
	
	
	
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script>
	$(document).ready(function(){
	
		$(".deleteLink").each(function(){
		
			$(this).on("click",function(){
				
				customerId= $(this).attr("id");
				if(	confirm("Are You Sure You Want To Delete Customer with Id " + customerId + " ?")){
					window.location ="delete_customer?id=" + customerId;
				}
				
			});
		});
	});
			
	
	</script>
	
</body>
</html>