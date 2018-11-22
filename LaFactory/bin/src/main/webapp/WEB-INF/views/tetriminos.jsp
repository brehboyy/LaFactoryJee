<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<!doctype html>
<html>
	<head>
		<title>Liste des pièces</title>
		<meta charset="UTF-8" />
		<base href="/tetris-back/" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	</head>
	
	
	<body>
		<jsp:include page="navigation.jsp" />
		
		<div class="container">
			<h1>Liste des pièces (Tetrimino)</h1>
			
			<a class="btn btn-success mb-5" href="tetrimino/ajouter">Ajouter un tetrimino</a>
			
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Nom</th>
						<th>Couleur</th>
						<th>Actions</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${ tetriminos }" var="tetrimino">
						<tr>
							<td>${ tetrimino.nom }</td>
							<td>${ tetrimino.couleur }</td>
							<td>
								<a class="btn btn-warning" href="tetrimino/editer?id=${ tetrimino.id }">Modifier</a>
								<a class="btn btn-danger" href="tetrimino/supprimer?id=${ tetrimino.id }">Supprimer</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>