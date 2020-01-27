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
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
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
					
					<td>
						<div id="rateYo"></div>
						<input type="hidden" id="rating" name="rating" />
						<input type="hidden" name="bookId" value="${book.bookId}" />
						<br/><br/>
						<input type="text" name="headline" size="60" placeholder="Headline Or Summery For Your Review (required)" />
						<br/><br/>
						<textarea name="comment" cols="70" rows="10" placeholder="Enter review Details"></textarea>
						
					</td>
				
				</tr>
				<tr>
					<td colspan="3" align="center">
						<button type="submit">Submit</button>
						&nbsp;&nbsp;
						<button id="buttonCancel">Cancel</button>
					</td>
				</tr>
			
			</table>
		
		</form>
		
		
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript">

	$(document).ready(function() {
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
		
		$("#reviewForm").validate({
			rules: {
				headline: "required",
				comment: "required"
			},
			
			messages: {
				headline: "Please enter headline",				
				comment: "Please enter review details"
			}
		});

		
		$("#rateYo").rateYo({
			starWidth: "40px",
			fullStar: true,
			onSet: function (rating, rateYoInstance) {
				$("#rating").val(rating);
			}
		});		
	});
</script>	

</body>
</html>