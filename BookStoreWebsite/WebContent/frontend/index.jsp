<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Evergreen Books - Online Book Store </title>
<link rel="stylesheet" href="css/style.css">

</head>
<body>
		<jsp:directive.include file="header.jsp" />
		<br/><br/>
		<div align="center">
	
		<div align="center" style="width:80%; margin: 0 auto; ">
		<h2>New Books</h2>
		
			<c:forEach items="${listNewBooks}" var="book">
			<div style="display:inline-block;  margin : 20px;">
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
					
					<jsp:directive.include file="book_rating.jsp" />
				
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
		
		<div align="center" style="clear:both;">
		<h1>Best Selling Books</h1>
		</div>
		
		<div align="center" style="clear:both;">
		<h1>Most-fav Books</h1>
		</div>
		
		</div>
		<br/><br/>
		
		
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>