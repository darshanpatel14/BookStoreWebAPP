<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create New Book</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/jquery-ui.min.css">
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>


<script type="text/javascript" src="../js/jquery-ui.min.js"></script>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include><br/><br/>
	
	<div align="center">
	<h2 class="pageheading">
		<c:if test="${Book != null }">
			Edit Book
		
		</c:if>
		<c:if test="${Book == null }">
			Create New Book
		
		</c:if>
	
	</h2>
	</div>
	
	<div align="center">
	
	<c:if test="${Book != null }">
		<form action="update_user" method="post" id="userForm">
		<input type="hidden" name="userId" value="${user.userId}">
	</c:if>
	
	<c:if test="${Book == null }">
		<form action="create_book" method="post" id="bookForm">
	</c:if>
		
		<table class="form">
		
			<tr>
			
					<td>Catagory:</td>
					<td>
					
						<select name="catagory">
						
								<c:forEach items="${listCatagory}" var="catagory">
									
									<option value="${catagory.catagoryId}">	
									
											${catagory.name}
									
									</option>							
									
								</c:forEach>
						
						</select>
					
					
					</td>
			
			
			
			</tr>
		
				<tr>
				
						<td align="right">Title:</td>
						<td align="left"><input type="text" id="title" name="title" value="${book.title}" size="20"/>
				
				</tr>
				
				<tr>
				
						<td align="right">Author:</td>
						<td align="left"><input type="text" id="author" name="author" value="${book.author}" size="20"/>
				
				</tr>
				
				<tr>
				
						<td align="right">ISBN:</td>
						<td align="left"><input type="text" id="isbn" name="isbn" value="${book.isbn}" size="20"/>
				
				</tr>
				
				
				<tr>
				
						<td align="right">Publish Date:</td>
						<td align="left"><input type="text" id="publishDate" name="publishDate" value="${book.publishDate}" size="20"/>
				
				</tr>
				
				<tr>
				
						<td align="right">Book Image:</td>
						<td align="left"><input type="file" id="bookImage" name="bookImage"  size="20"></br>
						<img id="thumbnail" alt="Image Preview" style="width:20%; margin-top: 10px"/>
						</td>
				
				</tr>
				
				<tr>
				
						<td align="right">Price:</td>
						<td align="left"><input type="text" id="price" name="price" value="${book.price}" size="20"/>
						
						
				
				</tr>
				
				<tr>
				
						<td align="right">Description:</td>
						<td align="left">
						<textarea rows="5" cols="50" name="description" id="description"></textarea>
						</td>
				</tr>
				
				
				<tr><td>&nbsp;</td></tr>
				<tr>
				
						
						<td colspan="2" align="center">
						<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
						<Button  id="buttonCancel">Cancel</Button>
						</td>
				
				</tr>
		
		</table>
		</form>
	
	</div>
			
	
	<jsp:include page="footer.jsp"></jsp:include>
		
</body>

<script type="text/javascript">

	
	$(document).ready(function(){

		$('#publishDate').datepicker();
		
		$('#bookImage').change(function(){
			
		
			showImageThumbnail(this);
		});
		
		$(" #bookForm").validate({
			
			rules : {
				catagory:"required",
				title: "required",
				author : "required",
				isbn : "required",
				publishDate : "required",
				bookImage : "required",
				price:"required",
				description:"required"
			},
			
			messages : {
				catagory:"Please choose book Catagory",
				title:"please enter book title",
				
				author : "Please enter book author",
				isbn : "Please enter book isbn",
				publishDate : "Please enter book publish date",
				bookImage : "Please enter book image",
				price : "Please enter book price",
				description : "Please enter book description",
				
			}
			
		});
		
		$("#buttonCancel").click(function(){
			history.go(-1);
		})
		
	});
	
	function showImageThumbnail(fileInput){
		
		var file = fileInput.files[0];
		
		var reader = new FileReader();
		reader.onload = function(e){
		
		$("#thumbnail").attr('src',e.target.result);
		
	};
	
	reader.readAsDataURL(file);
	
	}
	
	/* function validateFormInput(){
		var fieldEmail = document.getElementById("email");
		var fieldFullname = document.getElementById("fullname");
		var fieldPassword = document.getElementById("password");
		
		if(fieldEmail.value==0){
			
			alert("Email Is Required");
			
			fieldEmail.focus();
			
			return false;
			
		}
		
		if(fieldFullname.value==0){
			
			alert("Full Name Is Required");
			
			fieldFullname.focus();
			
			return false;
			
		}
		
		if(fieldPassword.value==0){
			
			alert("Password Is Required");
			
			fieldPassword.focus();
			
			return false;
			
		}
		
		return true;
		
		
	} */
	
</script>

</html>