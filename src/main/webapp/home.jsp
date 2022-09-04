<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>GP | Home Page</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  <link rel="icon" type="icon" href="img/3em.png">



</head>

<body>

  <nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
      <a class="navbar-brand text-primary" href="#">Gestione Persona</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="index.html">Inserisci</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Visualizza?page=1">Visualizza</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <header class="py-5 bg-image-full" style="background-image: url('https://source.unsplash.com/wfh8dDlNFOk/1600x900')">
    <div class="text-center my-5">
      <img class="img-fluid rounded-circle mb-4" src="img/3em.png" alt="3em" />
      <h1 class="text-white fs-3 fw-bolder">Gestione Persona</h1>
      <p class="text-white-50 mb-0">3EM Engineering</p>
    </div>
  </header>

  <section class="py-5">
    <div class="container my-5">
      <div class="row justify-content-center">
        <div class="col-lg-6">
          <h2>Come Funziona?</h2>
          <p class="lead">L'app si occupa di gestire un database di persone, sulle quali è possibile effettuare diverse
            operazioni come l'inserimento, la modifica e la visualizzazione delle persone.</p>
          <p class="mb-0">Puoi selezionare l'operazione da svolgere dalla barra superiore: Inserisci ti farà inserire
            una nuova persona tramite i campi nome, cognome ed età. <br>Visualizza ti mostrerà una tabella con tutte le
            persone già inserite e ti da la possibilità di eliminarle o modificare una persona a tua scelta.</p>
        </div>
      </div>
    </div>
  </section>

  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; 3EM - Dante Davidde</p>
    </div>
  </footer>

  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="js/main.js"></script>


  <script type="text/javascript">
			var Msg ='<%=session.getAttribute("inserimento")%>';
			    if (Msg == "true") {
					 function alertName(){
						 Swal.fire(
				    		'Inserimento Riuscito!',
				    		'Persona inserita correttamente!',
				    		 'success'
				    		    )	
			 		 } 
			 	}
			    <%session.setAttribute("inserimento", false);%>
		</script> 
			    	 	
    	 <script type="text/javascript"> window.onload = alertName; </script>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
    crossorigin="anonymous"></script>
</body>

</html>