<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Books in ${catagory.name} - Online Book Store </title>
<link rel="stylesheet" href="css/style.css">

</head>
<body>
		<jsp:directive.include file="header.jsp" />
		
		<div align="center" >
		<h2>${catagory.name}</h2>
		
		</div>
		
		<div align="center" style="width:80%; margin: 0 auto; ">
		
			<c:forEach items="${listBooks}" var="book">
			<div style="float: left;  display:inline-block;  margin : 20px;">
				<div>
						<a href="view_book?id=${book.bookId}">
						<img src="data:image/jpg;base64,${book.base64Image}" width="128" height="164"/>
					</a>
				</div>
				
				<div>
					<a href="view_book?id=${book.bookId}">
					<b>${book.title}</b>
					</a>
				</div>
				<div>
					
					Rating *****
				
				</div>
				
				<div>
					
						<i>${book.author}</i>
				
				</div>
				
				<div>
					
						<b>${book.price}</b>
				
				</div>
			</div>	
			</c:forEach>
		
		</div>
		
		
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>