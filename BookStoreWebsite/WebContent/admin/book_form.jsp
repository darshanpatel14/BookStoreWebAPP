<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

	<jsp:include page="header.jsp"></jsp:include><br />
	<br />

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
			<form action="update_book" method="post" id="bookForm"
				enctype="multipart/form-data">
				<input type="hidden" name="bookId" value="${book.bookId}">
		</c:if>

		<c:if test="${Book == null }">
			<form action="create_book" method="post" id="bookForm"
				enctype="multipart/form-data">
		</c:if>

		<table class="form">

			<tr>

				<td>Catagory:</td>
				<td><select name="catagory">

						<c:forEach items="${listCatagory}" var="catagory">

							<c:if test="${catagory.catagoryId eq book.catagory.catagoryId }">

								<option value="${catagory.catagoryId}" selected>
							</c:if>

							<c:if test="${catagory.catagoryId ne book.catagory.catagoryId }">

								<option value="${catagory.catagoryId}">
							</c:if>
									
									${catagory.name}
									
							</option>

						</c:forEach>

				</select>
				
				
				</td>



			</tr>

			<tr>

				<td align="right">Title:</td>
				<td align="left"><input type="text" id="title" name="title"
					value="${book.title}" size="20" />
			</tr>

			<tr>

				<td align="right">Author:</td>
				<td align="left"><input type="text" id="author" name="author"
					value="${book.author}" size="20" />
			</tr>

			<tr>

				<td align="right">ISBN:</td>
				<td align="left"><input type="text" id="isbn" name="isbn"
					value="${book.isbn}" size="20" />
			</tr>


			<tr>

				<td align="right">Publish Date:</td>
				<td align="left"><input type="text" id="publishDate"
					name="publishDate"
					value="<fmt:formatDate pattern="MM/dd/yyyy" value='${book.publishDate }' />"
					size="20" /></td>
			</tr>

			<tr>
				<td align="right">Book Image:</td>
				<td align="left">
					<input type="file" id="bookImage" name="bookImage" size="20" /><br/>
					<img id="thumbnail" alt="Image Preview" style="width:20%; margin-top: 10px"
						src="data:image/jpg;base64,${book.base64Image}"
					 />
				</td>
			</tr>

			<tr>
				<td align="right">Price:</td>
				<td align="left"><input type="text" id="price" name="price" size="20" value="${book.price}" /></td>
			</tr>

			<tr>

				<td align="right">Description:</td>
				<td align="left"><textarea rows="5" cols="50"
						name="description" id="description">${book.description}</textarea>
				</td>
			</tr>


			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>


				<td colspan="2" align="center">
					<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
					<Button id="buttonCancel">Cancel</Button>
				</td>

			</tr>

		</table>
	</form>

	</div>


	<jsp:include page="footer.jsp"></jsp:include>

</body>

<script type="text/javascript">

	$(document).ready(function() {
		$('#publishDate').datepicker();
		$('#description').richText();
		
		$('#bookImage').change(function() {
			showImageThumbnail(this);
		});
		
		
		$("#bookForm").validate({
			rules: {
				catagory: "required",
				title: "required",
				author: "required",
				isbn: "required",
				publishDate: "required",
				
				<c:if test="${book == null}">
				bookImage: "required",
				</c:if>
				
				price: "required",
				description: "required",
			},
			
			messages: {
				catagory: "Please select a category for the book",
				title: "Please enter title of the book",
				author: "Please enter author of the book",
				isbn: "Please enter ISBN of the book",
				publishDate: "Please enter publish date of the book",
				bookImage: "Please choose an image of the book",
				price: "Please enter price of the book",
				description: "Please enter description of the book"
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});
	
	function showImageThumbnail(fileInput) {
		var file = fileInput.files[0];
		
		var reader = new FileReader();
		
		reader.onload = function(e) {
			$('#thumbnail').attr('src', e.target.result);
		};
		
		reader.readAsDataURL(file);
	}
</script>

</html>