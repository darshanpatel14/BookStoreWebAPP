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
		Register as a Customer
	
	</h2>
	</div>
	
	<div align="center">
	
		<form action="register_customer" method="post" id="customerForm">
	
		
		<table class="form">
		
				
				
		
				<tr>
				
						<td align="right">E-mail:</td>
						<td align="left"><input type="text" id="email" name="email"  size="45"/>
				
				</tr>
				
				<tr>
				
						<td align="right">Full Name:</td>
						<td align="left"><input type="text" id="fullName" name="fullName" size="45"/>
				
				</tr>
				
				<tr>
				
						<td align="right">Password:</td>
						<td align="left"><input type="password" id="password" name="password"  size="45"/>
				
				</tr>
				
				<tr>
				
						<td align="right"> Confirm Password:</td>
						<td align="left"><input type="password" id="confirmPassword" name="confirmPassword"  size="45"/>
				
				</tr>
				
			<tr>
				
						<td align="right">Phone Number:</td>
						<td align="left"><input type="text" id="phone" name="phone"  size="45"/>
				
				</tr>
				
				<tr>
				
						<td align="right">Address:</td>
						<td align="left"><input type="text" id="address" name="address"  size="45"/>
				
				</tr>
				
				<tr>
				
						<td align="right">City:</td>
						<td align="left"><input type="text" id="city" name="city"  size="45"/>
				
				</tr>
				
				<tr>
				
						<td align="right">Zip Code:</td>
						<td align="left"><input type="text" id="zipcode" name="zipcode"  size="45"/>
				
				</tr>
				
				<tr>
				
						<td align="right">Country:</td>
						<td align="left"><input type="text" id="country" name="country" " size="45"/>
				
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
				password : "required",
				confirmPassword : {
					required:true,
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
				password : "please enter password",
				confirmPassword : {
					required :"please confirm password",
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