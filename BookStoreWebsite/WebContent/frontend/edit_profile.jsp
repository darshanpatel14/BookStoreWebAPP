<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register As a  Customer</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include><br/><br/>
	
	<div align="center">
	<h2 class="pageheading">
		Edit My Profile
	
	</h2>
	</div>
	
	<div align="center">
	
		<form action="update_profile" method="post" id="customerForm">
	
		
		<table class="form">
		
				
				
		
				<tr>
				
						<td align="right">E-mail:</td>
						<td align="left">${loggedCustomer.email} (Can't be changed.)</td>
				
				</tr>
				
				<tr>
				
						<td align="right">Full Name:</td>
						<td align="left"><input type="text" id="fullName" name="fullName" value="${loggedCustomer.fullname}" size="45"/>
				
				</tr>
				
				
				
			<tr>
				
						<td align="right">Phone Number:</td>
						<td align="left"><input type="text" id="phone" name="phone" value="${loggedCustomer.phone}" size="45"/>
				
				</tr>
				
				<tr>
				
						<td align="right">Address:</td>
						<td align="left"><input type="text" id="address" name="address" value="${loggedCustomer.address}" size="45"/>
				
				</tr>
				
				<tr>
				
						<td align="right">City:</td>
						<td align="left"><input type="text" id="city" name="city" value="${loggedCustomer.city}" size="45"/>
				
				</tr>
				
				<tr>
				
						<td align="right">Zip Code:</td>
						<td align="left"><input type="text" id="zipcode" name="zipcode" value="${loggedCustomer.zipcode}"  size="45"/>
				
				</tr>
				
				<tr>
				
						<td align="right">Country:</td>
						<td align="left"><input type="text" id="country" name="country" value="${loggedCustomer.country}" size="45"/>
				
				</tr>
				
				<tr>
				
					<td colspan="2" align="center">
					<i>Leave Password Field Blank.If you dont wan't to change password</i>
					</td>
				
				<tr>
				
						<td align="right">Password:</td>
						<td align="left"><input type="password" id="password" name="password"  size="45"/>
				
				</tr>
				
				<tr>
				
						<td align="right"> Confirm Password:</td>
						<td align="left"><input type="password" id="confirmPassword" name="confirmPassword"  size="45"/>
				
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
		
		$("#customerForm").validate({
			
			rules : {
				email :{
				
					required:true,
					email:true
					
				},
				fullName: "required",
			
				confirmPassword : {
					
					equalTo :"#password"
				},
				phone : "required",
				
				address : "required",
				city : "required",
				zipcode : "required",
				country : "required",
			},
			
			messages : {
				email :{
					required : "Please enter an email",
					email:"please enter valid email "	
				},
				fullName: "please enter full name",
				
				confirmPassword : {
					
					equalTo : "confirn password does not match"
				},
				phone : "please enter phone number",
				
				address : "please enter address",
				city : "please enter city",
				zipcode : "please enter zipcode",
				country : "please enter country",
				
			}
			
		});
		
		$("#buttonCancel").click(function(){
			history.go(-1);
		});
		
	});
	
	
	
</script>

</html>