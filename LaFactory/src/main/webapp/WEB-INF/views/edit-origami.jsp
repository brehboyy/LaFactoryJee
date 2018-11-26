<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<title>Ajouter / modifier un Origami</title>
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
		<h1>
			<c:if test="${ origami != null }">Modifier</c:if>
			<c:if test="${ origami == null }">Ajouter</c:if>
			un origami
		</h1>

		<form method="POST">
			<div class="form-group row">
				<label for="nom" class="col-sm-2 col-form-label">Nom</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="nom" name="nom"
						placeholder="Nom" value="${ origami.nom }" />
				</div>
			</div>

			<div class="form-group row">
				<label for="number" class="col-sm-2 col-form-label">Temps en
					minute de réalisation</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" id="timeMinute"
						name="timeMinute" placeholder="5" value="${ origami.timeMinute }" />
				</div>
			</div>

			<select name="level">
				<option value="1">Occasionnel</option>
				<option value="2">Normal</option>
				<option value="3">Avancé</option>
				<option value="4">Expert</option>
			</select>

			<div class="form-group row">
				<label for="number" class="col-sm-2 col-form-label">Nombre
					de feuilles A4 nécessaire</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" id="nbFeuilles"
						name="nbFeuilles" placeholder="3" value="${ origami.nbFeuilles }" />
				</div>
			</div>
			
			<div class="form-group row">
				<div class="form-check">
					<input type="checkbox" class="form-check-input"  name="enable" value="${ origami.enable }" id="enable">
					<label class="form-check-label">Afficher</label>
				</div>
			</div>

			<div class="form-group row">
				<label for="nom" class="col-sm-2 col-form-label">URL video</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="urlVideo" name="urlVideo"
						placeholder="Url video" value="${ origami.urlVideo}" />
				</div>
			</div>
			
			<div class="form-group row">
				<label for="nom" class="col-sm-2 col-form-label">URL image</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="urlImg" name="urlImg"
						placeholder="Url image" value="${ origami.urlImg}" />
				</div>
			</div>

			<div class="form-group row">
				<label for="number" class="col-sm-2 col-form-label">Nombre
					d'étapes</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" id="nbEtapes"
						name="nbEtapes" placeholder="3" value="" />
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