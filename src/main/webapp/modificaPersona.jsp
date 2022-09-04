<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GP | Modifica Persona</title>
<link rel="icon" type="icon" href="img/3em.png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

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
					<li class="nav-item"><a class="nav-link" href="Visualizza">Visualizza</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>






	<div class="m-4 row">
		<div class="col-4"></div>
		<div class="col-4">

			<form action="Modifica" method="post" name="form"
				onsubmit="return controllo()">
				<div class="mb-3">
					<label for="exampleInputEmail1" class="form-label">Nome</label> <input
						type="text" name="nome" class="form-control"
						id="exampleInputEmail1" aria-describedby="emailHelp"
						value="${nome}" required placeholder="Nome">
				</div>
				<div class="mb-3">
					<label for="exampleInputPassword1" class="form-label">Cognome</label>
					<input type="text" name="cognome" class="form-control"
						id="exampleInputPassword1" value="${cognome}" required
						placeholder="Cognome">
				</div>
				<div class="mb-3">
					<label for="exampleInputPassword1" class="form-label">Età</label> <input
						type="number" name="eta" class="form-control"
						id="exampleInputPassword1" value="${eta}" required
						placeholder="Eta">
				</div>
				<div class="mb-3">
					<label for="exampleInputPassword1" class="form-label">ID</label> <input
						type="number" name="id" class="form-control"
						id="exampleInputPassword1" value="${id}" readonly>
				</div>
				<button type="submit" class="btn btn-primary">Modifica</button>
			</form>
		</div>
	</div>
</body>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<script src="js/main.js"></script>
</html>