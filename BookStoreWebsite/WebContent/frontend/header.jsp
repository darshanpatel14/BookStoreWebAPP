 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">

	<div >
			 
			 <img src="images/BookstoreLogo.png"/>
	
	</div>
	
	<div>
	
			<input type="text" name="keyword" size="50"/>
			<input type="button"  value="search" />
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<a href="login">SignIn</a> |
			<a href="register">Register</a> |
			<a href="view_cart">Cart</a>
	</div>
	
	<div>&nbsp</div>
	
	<div>
	
		<c:forEach var="catagory" items="${listCatagory}" varStatus="status">
			<a href="view_catagory?id="${catagory.catagoryId}">
			
			<font size="+1"><b><c:out value="${catagory.name}" /> </b></font>
			</a>
			<c:if test="${not status.last }">
			&nbsp; | &nbsp;
			</c:if>
		</c:forEach>
	
	</div>

</div>