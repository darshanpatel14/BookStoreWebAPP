<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
	
	<h2 class="pageheading"> Book Management </h2><br/>
	
	<h3><a href="new_book">Create New book</a></h3>
	
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
				<th>Image</th>
				<th>Title</th>
				<th>Author</th>
				<th>Catagory</th>
				<th>Price</th>
				<th>Last Updated</th>
				<th>Actions</th>
		
			</tr>
			
			<c:forEach var="book" items="${listBooks}" varStatus="status">
			
				<tr>
				
					<td>${status.index + 1}</td>
					<td>${book.bookId}</td>
					
					<td>
					
						<img src="data:image/jpg;base64,${book.base64Image}" width="84" height="110"/>
					
					
					</td>
					
					<td>${book.title}</td>
					<td>${book.author}</td>
					<td>${book.catagory.name}</td>
					<td>$ ${book.price}</td>
					<td><fmt:formatDate pattern="MM/dd/yyyy" value='${book.publishDate}'/></td>
					
					<td> 
					
							<a href="edit_book?id=${book.bookId}">Edit</a> &nbsp;
							<a href="javascript:void(0);" class="deleteLink" id="${book.bookId}">Delete</a>
					
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
				
				bookId= $(this).attr("id");
				if(	confirm("Are You Sure You Want To Delete book with Id " + bookId + " ?")){
					window.location ="delete_book?id=" + bookId;
				}
				
			});
		});
	});
			
	
	</script>
	
</body>
</html>