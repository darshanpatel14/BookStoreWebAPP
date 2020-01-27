<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Posted - Online BookStore</title>
<link rel="stylesheet" href="css/style.css" >
	
</head>
<body>
<jsp:directive.include file="header.jsp" />
	<div align="center">
	
		<form id="reviewForm" action="submit_review" method="post">
		
			<table style="border:0; width:60% ;">
			
				<tr>
				<td><h2>Your Reviews</h2></td>
				<td>&nbsp;</td>
				<td><h2>${loggedCustomer.fullname}</h2></td>
				</tr>
				
				<tr>
				
					<td colspan="3"><hr></td>
				<tr>
					
					<td>
						<span style="font-size: x-large; font-weight: bold;">${book.title}</span><br/><br/>
						<img src="data:image/jpg;base64,${book.base64Image}" width="240" height="300"/>
					
					</td>
					
					<td colspan="2">
						
						<h3>Your Review Has Been Posted. Thank You!</h3>
						
					</td>
				
				</tr>
				
			</table>
		
		</form>
		
		
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>



</body>
</html>