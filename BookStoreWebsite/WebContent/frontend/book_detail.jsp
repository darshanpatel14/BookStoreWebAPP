<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ${book.title} - Online Book Store </title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>

</head>
<body>
		<jsp:directive.include file="header.jsp" />
	
		<div align="center" >
		<table  style="border:0 ; width=80% ">
			<tr >
				<td colspan="3" align="left" >
				<h2>${book.title}</h2> by ${book.author}
				
				</td>
			
			</tr>
			
			<tr>
			
			<td rowspan="2">
				<img src="data:image/jpg;base64,${book.base64Image}" width="240" height="300"/>
			</td>
			
			<td valign="top" align="left" >
				
				<jsp:directive.include file="book_rating.jsp" />&nbsp;
				<a href="#reviews">${fn:length(book.reviews)} Reviews</a>
			
			</td>
			<td valign="top" rowspan="2"  width="20%">
				
				<h2>$${book.price}</h2>
				<br/>
				<button type="submit">Add To Cart</button>
			
			</td>
			
			</tr>
			
			<tr>
			
				<td valign="top" >
				
				${book.description}
				
				</td>
			
			</tr>
			
			<tr><td>&nbsp;</td></tr>
			
			<tr>
			
				<td><h2><a id="reviews">Customer Reviews</a></h2></td>
				
				<td colspan="2" align="center">
					
					<button id="buttonWriteReview">Write A Customer Reviews</button>
				
				</td>
			
			</tr>
			
			<tr>
				
				<td colspan="3" align="left">
						
						<table style="border:0">
						
							<c:forEach items="${book.reviews}" var="review" > 
							
								<tr>
										
										<td>
										
										<c:forTokens items="${review.stars}" delims="," var="star">
					
												<c:if test="${ star eq 'on'}" >
							
														<img src="images/rating_on.png" />
						
												</c:if>
						
											<c:if test="${ star eq 'off'}" >
							
														<img src="images/rating_off.png" />
						
											</c:if>
					
										</c:forTokens>
											
											
										<b>${review.headline}</b>
													
												
										</td>
								
								</tr>
								
								<tr>
										
										<td>
												
												by ${review.customer.fullname} on ${review.reviewTime}
										
										</td>
									
								
								</tr>
								<tr>
								
										<td><i>${review.comment}</i></td>
								
								</tr>
								
								<tr><td>&nbsp;</td></tr>
							
							</c:forEach>
						
						</table>
			
				</td>
			</tr>
		
		</table>
		
		
		
		
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
		<script type="text/javascript">
		
		$(document).ready(function(){
			
			$("#buttonWriteReview").click(function(){
				
				
				window.location='write_review?book_id=' + ${book.bookId};
			});
		});
		
		</script>
</body>
</html>