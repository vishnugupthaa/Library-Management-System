<%@page import="Beans.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="MVC.Model"%>
<%
	if (request.getParameter("Patron") != null) {
		List<Transaction> list = Model.getInstance().viewActiveTransactions();

		if (list.size() == 0) {
%>
		<div class="container">
			<h2 class="text-info"> No Active Transactions </h2>
		</div>
<%
		}

		else {
%>
<div class="container-fluid text-center" style="margin-top: 10px">
	<div class="container">
		<h2 class="text-info">Active Transactions of <%=request %></h2>
	</div>
	<hr />
	<div class="table-responsive">
		<table class="table table-bordered table-striped">
			<tr class="info">
				<th class="text-center">Book Name</th>
				<th class="text-center">Patron Name</th>
				<th class="text-center">Time</th>
			</tr>
			<%
				for (Transaction t : list) {
			%>
			<tr>
				<td><%=t.getBook_name()%></td>
				<td><%=t.getTime().toLocalDateTime().toLocalDate().toString()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>

</div>

<%
		}
	}
	
else {
%>

<div class="container">
	<h2>Error Occurred</h2>
</div>

<%
	}
%>