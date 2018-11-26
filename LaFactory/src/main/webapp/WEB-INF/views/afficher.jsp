<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!doctype html>
<html>
<head>
<title>Origami : ${ origami.nom }</title>
<meta charset="UTF-8" />
<base href="/LaFactory/" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="assets/css/origami.css" />
</head>


<body>
	<jsp:include page="navigation.jsp" />
	<div class="container">
		<div class="col-ms-12" style="display:flex; height:150px; margin: 10px;">
			<div class="col-ms-3" style ="margin-top:30px; margin-left:20px;">
				<h1>${ origami.nom }</h1>
			</div>
			<div class="col-ms-6" style="margin-left:20px;">
				<img style="height:150px; "; src="${ origami.urlImg }" />
			</div>
		</div>
		<iframe src="${ origami.urlVideo }">
			<p>Your browser does not support iframes.</p>
		</iframe>

		<h4>Pour cet origami il faudrait environ ${ origami.timeMinute } minutes.</h4>
		<h4 class ="col-md-6">Niveau : </h4>
		<div class="col-md-6">${ origami.level }</div>
		<h2>Nombre de feuilles A4 nécessaire : ${ origami.nbFeuilles }</h2>

		<h2>Etapes :</h2>
		<c:forEach items="${ etapes }" var="etape">
				Numéro d'étape : ${ etape.numero } <br>
				Description : ${ etape.description }<br>
				Image aide : ${ etape.imageUrl }<br>
		</c:forEach>

		<c:forEach items="${ commentaire }" var="commentaires">
					${ commentaire.pseudo }
					<p>${ commentaire.message }</p>
		</c:forEach>
		<form Method="POST">
			<div class="form-group row">
				<label name="pseudo" class="col-sm-2 col-form-label">pseudo</label>
				<input readonly type="text" class="form-control" id="pseudo"
					name="pseudo" />
			</div>
			<div class="form-group row">
				<label for="text" class="col-sm-2 col-form-label">Message</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="message" name="message"
						placeholder="message" />
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