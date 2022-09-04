<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

<link rel="icon" type="icon" href="img/3em.png">
<title>GP | Visualizza Persone</title>
</head>
<body>



	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand text-primary" href="#">Gestione Persona</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="index.html">Inserisci</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="Visualizza?page=1">Visualizza</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="m-4">

			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th scope="col">Nome</th>
						<th scope="col">Cognome</th>
						<th scope="col">Eta'</th>
						<th scope="col">Elimina</th>
						<th scope="col">Modifica</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${listaPersone}" var="listaPersone">
						<tr>
							<td>${listaPersone.nome}</td>
							<td>${listaPersone.cognome}</td>
							<td>${listaPersone.eta}</td>
							<td><a
								href="Cancellazione?page=${page}&id=${listaPersone.id}"
								class="link-danger">Elimina</a></td>
							<td><a class="link-info"
								href="Modifica?id=${listaPersone.id}&nome=${listaPersone.nome}&cognome=${listaPersone.cognome}&eta=${listaPersone.eta}">Modifica</a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

			<nav class="m-4">
				<ul class="pagination justify-content-center">

					<c:if test="${page > 1}">
						<li class="page-item"><a class="page-link"
							href="Visualizza?page=1">Frist</a></li>
						<li class="page-item"><a class="page-link"
							href="Visualizza?page=${page - 1}">Previous</a></li>
					</c:if>
					
					
					
					<c:if test="${totPag <= 10}">
						<c:forEach begin="0" end="${totPag}" step="1" var="i">
							<li class="page-item"><a class="page-link" href="Visualizza?page=${i + 1}"> ${(i + 1)}</a></li>
					</c:forEach>
					</c:if>
					
					
					<c:if test="${totPag > 10}">
						<c:choose>
							    
							    <c:when test="${page <= 4}">
							        <c:forEach begin="1" end="8" step="1" var="i">
										<li class="page-item"><a class="page-link" href="Visualizza?page=${i}"> ${i}</a></li>
									</c:forEach>
							    </c:when>
							    
							    <c:when test="${page > 4 && page < totPag - 4}">
							    	<li class="page-item disabled"><a class="page-link" href="#">...</a></li>
							    	
							        <c:forEach begin="${page - 2}" end="${page + 2}" step="1" var="i">
										<li class="page-item"><a class="page-link" href="Visualizza?page=${i}"> ${i}</a></li>
									</c:forEach>
									
									<li class="page-item disabled"><a class="page-link" href="#">...</a></li>
							    </c:when>    
							    
							    <c:otherwise>
							       <c:forEach begin="${totPag - 6}" end="${totPag}" step="1" var="i">
										<li class="page-item"><a class="page-link" href="Visualizza?page=${i}"> ${i}</a></li>
									</c:forEach>
									
									<c:if test="${totPagFloat % 1 != 0}">
										<li class="page-item"><a class="page-link" href="Visualizza?page=${totPag +1}"> ${totPag +1}</a></li>
									</c:if>
							    </c:otherwise>
							</c:choose>
					</c:if>


					
					<c:if test="${totPagFloat % 1 != 0}">
						
						<c:if test="${page < (totPag + 1) && page == totPag}">
							<li class="page-item"><a class="page-link" href="Visualizza?page=${page + 1}">Next</a></li>
							<li class="page-item"><a class="page-link" href="Visualizza?page=${totPag + 1}">Last</a></li>	
						</c:if>
						
					</c:if>

					<c:if test="${page < totPag}">
						<li class="page-item"><a class="page-link"
							href="Visualizza?page=${page + 1}">Next</a></li>
						
							<c:choose>
							    <c:when test="${totPagFloat % 1 != 0}">
							        <li class="page-item"><a class="page-link" href="Visualizza?page=${totPag + 1}">Last</a></li>
							    </c:when>    
							    <c:otherwise>
							        <li class="page-item"><a class="page-link" href="Visualizza?page=${totPag}">Last</a></li>
							    </c:otherwise>
							</c:choose>
					</c:if>



					<%
					/*int tot = (int) request.getAttribute("totPag");
					float totFlot = (float) request.getAttribute("totPagFloat");

					if(pagec > 1){
						out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"Visualizza?page=1\">Frist</a></li>");	
						out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"Visualizza?page=" + (pagec-1) + "\">Previous</a></li>");			
					}

					for (int i = 0; i < tot; i++) {

						out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"Visualizza?page=" + (i + 1) + "\">" + (i + 1)
						+ "</a></li>");
					}


					if(totFlot != (int) totFlot){
						out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"Visualizza?page=" + (tot + 1) + "\">" + (tot + 1) + "</a></li>");	
						if(pagec < tot+1 && pagec == tot){
							out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"Visualizza?page=" + (pagec + 1) + "\">Next</a></li>");
							out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"Visualizza?page=" + (tot+1) + "\">Last</a></li>");	
						}
					}
					if(pagec < tot){
						out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"Visualizza?page=" + (pagec + 1) + "\">Next</a></li>");
						
						if(totFlot != (int) totFlot){
							out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"Visualizza?page=" + (tot+1) + "\">Last</a></li>");	
						}else{
							out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"Visualizza?page=" + (tot) + "\">Last</a></li>");	
						}
					}*/
					%>
				</ul>
			</nav>

		</div>
	</div>
</body>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>

</html>