<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<!doctype html>
<html>
	<head>
		<title>Origami : ${ origami.nom }</title>
		<meta charset="UTF-8" />
		<base href="/LaFactory/" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="assets/css/origami.css" />
	</head>
	
	
	<body>
		<jsp:include page="navigation.jsp" />
		
		<div class="container">
			<h1>
				Origami : ${ origami.nom }
				Lien Video : ${ origami.urlVideo }
				Lien Video : ${ origami.urlVideo }
			</h1>
			
			<h2>Temps en minutes de réalisation : ${ origami.timeMinute }</h2>
			<h2>Niveau : ${ origami.level }</h2>
			<h2>Nombre de feuilles A4 nécessaire : ${ origami.nbFeuilles }</h2>
			
			<h2>Etapes :</h2>
			<c:forEach items="${ etapes }" var="etape">
				Numéro d'étape : ${ etape.numero } <br>
				Description : ${ etape.description }<br>
				Image aide : ${ etape.imageUrl }<br>
			</c:forEach>
			<h2>Categories :</h2>
			<c:forEach items="${ categories }" var="categorie">
				${ categorie.nom } <br>
			</c:forEach>					
			<c:forEach items="${ commentaire }" var="commentaires">
					${ commentaire.pseudo }
					<p>${ commentaire.message }</p>
			</c:forEach>
			<form Method="POST">
				<div class="form-group row">
					<label name="pseudo" class="col-sm-2 col-form-label">pseudo</label>
					<input readonly type="text" class="form-control" id="pseudo" name="pseudo"/>
				</div>
				<div class="form-group row">
					<label for="text" class="col-sm-2 col-form-label">Message</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="message" name="message" placeholder="message" />
					</div>
				</div>
				<div class="form-group row">
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary">Valider</button>
						</div>
					</div>
			</form>
		</div>
	</body>
</html>