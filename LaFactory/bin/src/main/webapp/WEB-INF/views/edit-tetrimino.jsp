<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<!doctype html>
<html>
	<head>
		<title>Ajouter / modifier un Tetrimino</title>
		<meta charset="UTF-8" />
		<base href="/tetris-back/" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="assets/css/tetrimino.css" />
	</head>
	
	
	<body>
		<jsp:include page="navigation.jsp" />
		
		<div class="container">
			<h1>
				<c:if test="${ tetrimino != null }">Modifier</c:if>
				<c:if test="${ tetrimino == null }">Ajouter</c:if>
				un Tetrimino
			</h1>
			
			<form method="POST">
				<div class="form-group row">
					<label for="nom" class="col-sm-2 col-form-label">Nom</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="nom" name="nom" placeholder="Nom" value="${ tetrimino.nom }" />
					</div>
				</div>
				
				<div class="form-group row">
					<label for="couleur" class="col-sm-2 col-form-label">Couleur</label>
					<div class="col-sm-10">
						<input type="color" class="form-control" id="couleur" name="couleur" placeholder="Couleur" value="${ tetrimino.couleur }" />
					</div>
				</div>
				
				<div class="form-group row">
					<label for="couleur" class="col-sm-2 col-form-label">Forme</label>
					<div class="col-sm-10">
						<table class="forme-tetrimino">
							<c:forEach var="i" begin="0" end="3" step="1">
								<tr>
									<c:forEach var="j" begin="0" end="3" step="1">
										<td>
											<input id="points-${ i }-${ j }" type="checkbox" name="points-${ i }-${ j }" <c:if test="${ tetrimino.points[i][j] }">checked</c:if> />
											<label for="points-${ i }-${ j }"></label>
										</td>
									</c:forEach>
								</tr>
							</c:forEach>
						</table>
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