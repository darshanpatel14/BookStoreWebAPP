<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Users</title>

<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include><br/><br/>
	
	<div align="center">
	
	<h2 class="pageheading"> User Management </h2><br/>
	
	<h3><a href="user_form.jsp">Create New User</a></h3>
	
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
				<th>Email</th>
				<th>Full Name</th>
				<th>Actions</th>
		
			</tr>
			
			<c:forEach var="user" items="${listUsers}" varStatus="status">
			
				<tr>
				
					<td>${status.index + 1}</td>
					<td>${user.userId}</td>
					<td>${user.email}</td>
					<td>${user.fullName}</td>
					
					<td> 
					
							<a href="edit_user?id=${user.userId }">Edit</a> &nbsp;
							<a href="javascript:void(0);" class="deleteLink" id="${user.userId }">Delete</a>
					
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
				
				userId= $(this).attr("id");
				if(	confirm("Are You Sure You Want To Delete user with Id " + userId + " ?")){
					window.location ="delete_user?id=" + userId;
				}
				
			});
		});
	});
			/* function confirmDelete(userId){
			if(	confirm("Are You Sure You Want To Delete user with Id " + userId + " ?")){
				window.location ="delete_user?id=" + userId;
			}
			} */
	
	</script>
	
</body>
</html>