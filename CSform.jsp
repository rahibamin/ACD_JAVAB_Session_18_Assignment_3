    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Info</title>
</head>
<body>
	<% 
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String numStr = request.getParameter("phone");
		if (name == null || address == null || numStr == null) {
			request.setAttribute("name", "");
			request.setAttribute("address", "");
			request.setAttribute("phone", "");
		} else {
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("phone", numStr);
		}
	%>
	<form action="CSform.jsp" method="get">
	<h2>Customer Information Form</h2>
		<label>Name</label>
		<input type='text' name='name' value='<%=request.getAttribute("name")%>'><br />
		<label>Address</label>
		<input type='text' name='address' value='<%=request.getAttribute("address")%>'> <br />
		<label>Mobile No.</label>
		<input type='text' name='phone' value='<%=request.getAttribute("phone")%>'><br />
		<input type='submit' value='submit'>
	</form>
	<%
		String message = "Customer Information is not valid.";
		boolean valid = false;
		boolean start = false;
		if (name == null || address == null || numStr == null) {
		} else if (name.isEmpty() || address.isEmpty() || numStr.isEmpty()){
			start = true;
		}
		else {
			start = true;
			try{
				int num = Integer.parseInt(numStr);
				valid = true;
				out.println("<h1>Validated Customer Information</h1><br />"+
					"Customer Name: " + name +
					"<br />Customer address: " + address + 
					"<br />Customer number: " + num);
			}catch (Exception e){
				message = "Error! Please try Again!";
			}
		}
		
		if (!valid && start){
			out.println("<h3 style='color:black'> " + message + "</h3>");
		}
		
	%>
</body>
</html>