<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!doctype html>
<html>
<head>
<title>Liste des origamis</title>
<meta charset="UTF-8" />
<base href="/LaFactory/" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
</head>


<body>
	<jsp:include page="navigation.jsp" />

	<div class="container">
		<h1>Liste des pièces (Origami)</h1>

		<a class="btn btn-success mb-5" href="origami/ajouter">Ajouter un
			origami</a>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>Numéro</th>
					<th>Nom</th>
					<th>Level</th>
					<th>Nombre de feuilles</th>
					<c:if test="${ administrateur != null }">
						<th>Nombre de vues</th>
					</c:if>
					<th>Actions</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${ origamis }" var="origami">
					<tr>
						<td>${ origami.id }</td>
						<td>${ origami.nom }</td>
						<td>${ origami.level }</td>
						<td>${ origami.nbFeuilles }</td>
						<c:if test="${ administrateur != null }">
							<td>${ nbvueorigami.get(origami) }</td>
						</c:if>

						<c:if test="${ administrateur != null }">
							<td><a class="btn btn-warning"
								href="origami/afficher?id=${ origami.id }">Afficher</a> <a
								class="btn btn-warning" href="origami/editer?id=${ origami.id }">Modifier</a>
								<a class="btn btn-danger"
								href="origami/supprimer?id=${ origami.id }">Supprimer</a></td>
						</c:if>
						<c:if test="${ administrateur == null }">
							<td><a class="btn btn-warning"
								href="origami/afficher?id=${ origami.id }">Afficher</a></td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>