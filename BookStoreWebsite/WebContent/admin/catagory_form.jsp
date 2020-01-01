<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<title>
<c:if test="${catagory != null }">
Edit New Catagory</c:if>
<c:if test="${catagory == null }">

create new Catagory
</c:if>
</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include><br/><br/>
	
	<div align="center">
	<h2 class="pageheading">
		<c:if test="${catagory != null }">
			Edit Catagory
		
		</c:if>
		<c:if test="${catagory == null }">
			Create New Catagory
		
		</c:if>
	
	</div>
	
	<div align="center">
	
	<c:if test="${catagory != null }">
		<form action="update_catagory" method="post" id = "catagoryForm">
		<input type="hidden" name="catagoryId" value="${catagory.catagoryId}">
	</c:if>
	
	<c:if test="${catagory == null }">
		<form action="create_catagory" method="post" id = "catagoryForm">
	</c:if>
		
		<table class="form">
		
				
				<tr>
				
						<td align="right">Name:</td>
						<td align="left"><input type="text" id="name" name="name" value="${catagory.name}" size="20"/>
				
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
	
	$("#catagoryForm").validate({
		
		rules : {
			
			name : "required",
		},
		
		messages : {
		
			name : "Please Enter Catagory Name"
		}
		
	});
	
	$("#buttonCancel").click(function(){
		history.go(-1);
	})
	
	
});
	
	/* function validateFormInput(){
		
		var fieldName = document.getElementById("name");
		
		
		if(fieldName.value.length == 0){
			
			alert("Catagory Name  Is Required");
			
			fieldName.focus();
			
			return false;
			
		}
		
		
		
		return true;
		
		
	} */
	
</script>

</html>