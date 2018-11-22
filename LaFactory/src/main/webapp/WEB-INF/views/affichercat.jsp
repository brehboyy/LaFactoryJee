<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!doctype html>
<html>
<head>
<title>Catégorie : ${ categorie.nom }</title>
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
		<h1>Catégorie : ${ categorie.nom }</h1>

		<h2>Catégories filles :</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Nom</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ categories }" var="categ">
					<tr>
						<td>${ categ.nom }</td>
						<td><a class="btn btn-warning" href="categorie/affichercategories?id=${ categ.id }">Afficher</a>
							<c:if test="${ utilisateur != null }">
								<a class="btn btn-warning" href="categorie/editercategories?id=${ categ.id }">Modifier</a>
								<a class="btn btn-danger" href="categorie/supprimercategories?id=${ categ.id }">Supprimer</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<h2>Origamis de cette categories:</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Nom origami</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ origamis }" var="orig">
					<tr>
						<td>${ orig.nom }</td>
						<td>
							<a class="btn btn-warning" href="categorie/affichercategories?id=${ categ.id }">Afficher</a>
							<c:if test="${ utilisateur != null }">
								<a class="btn btn-warning" href="categorie/editercategories?id=${ categ.id }">Modifier</a> 
								<a class="btn btn-danger" href="categorie/supprimercategories?id=${ categ.id }">Supprimer</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>