<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write A Review - Online BookStore</title>

	<link rel="stylesheet" href="css/style.css" >
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
</head>
<body>
<jsp:directive.include file="header.jsp" />
	<div align="center">
	
		<form id="reviewForm" >
		
			<table style="border:0; width:60% ;">
			
				<tr>
				<td><h3>You already wrote a review for this book</h3></td>
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
					
					<td>
						<div id="rateYo"></div>
						<br/>
						<input type="text" name="headline" size="60" readonly="readonly" value="${review.headline }" />
						<br/><br/>
						<textarea name="comment" cols="70" rows="10" readonly="readonly">${review.comment}</textarea>
						
					</td>
				
				</tr>
				
			
			</table>
		
		</form>
		
		
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript">

	$(document).ready(function() {
				
		$("#rateYo").rateYo({
			starWidth: "40px",
			fullStar: true,
			rating: ${review.rating},
			readOnly: true
		});		
	});
</script>	


</body>
</html>