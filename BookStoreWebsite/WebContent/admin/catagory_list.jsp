<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Catagory</title>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include><br/><br/>
	
	<div align="center">
	
	<h2 class="pageheading" > Catagory Management </h2><br/>
	
	<h3><a href="catagory_form.jsp">Create New Catagory</a></h3>
	
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
				
				<th>Name</th>
				<th>Actions</th>
				
		
			</tr>
			
			<c:forEach var="cat" items="${listCatagory}" varStatus="status">
			
				<tr>
				
					<td>${status.index + 1}</td>
					<td>${cat.catagoryId}</td>
					<td>${cat.name}</td>
					
					
					<td> 
					
							<a href="edit_catagory?id=${cat.catagoryId }">Edit</a> &nbsp;
							<a href="javascript:void(0);" class="deleteLink" id="${cat.catagoryId}">Delete</a>
					
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
				
				catagoryId= $(this).attr("id");
				if(	confirm("Are You Sure You Want To Delete catagory with Id " + catagoryId + " ?")){
					window.location ="delete_catagory?id=" + catagoryId;
				}
				
			});
		});
	});
	
	</script>
	
</body>
</html>