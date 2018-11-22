<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<!doctype html>
<html>
	<head>
		<title>Liste des categories</title>
		<meta charset="UTF-8" />
		<base href="/LaFactory/" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	</head>
	
	
	<body>
		<jsp:include page="navigation.jsp" />
		
		<div class="container">
			<h1>Liste des Catégories</h1>
			
			<a class="btn btn-success mb-5" href="categorie/ajoutercategorie">Ajouter une catégorie</a>
			
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Nom</th>
						<th>Actions</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${ categories }" var="categorie">
						<tr>
							<td>${ categorie.nom }</td>
							
							<c:if test="${ utilisateur != null }">
								<td>
									<a class="btn btn-warning" href="categorie/affichercategories?id=${ categorie.id }">Afficher</a>
									<a class="btn btn-warning" href="categorie/editercategories?id=${ categorie.id }">Modifier</a>
									<a class="btn btn-danger" href="categorie/supprimercategorie?id=${ categorie.id }">Supprimer</a>
								</td>
							</c:if>
							<c:if test="${ utilisateur == null }">
								<td>
									<a class="btn btn-warning" href="categorie/affichercategories?id=${ categorie.id }">Afficher</a>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>