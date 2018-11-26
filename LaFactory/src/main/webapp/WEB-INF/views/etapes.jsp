<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<!doctype html>
<html>
	<head>
		<title>Ajouter / modifier un Origami</title>
		<meta charset="UTF-8" />
		<base href="/LaFactory/" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="assets/css/origami.css" />
	</head>
	
	
	<body>
		<jsp:include page="navigation.jsp" />
		
		<div class="container">
			<h1>
				<c:if test="${ etapes != null }">Modifier</c:if>
				<c:if test="${ etapes == null }">Ajouter</c:if>
				les étapes
			</h1>
			
			
			<form method="POST" action="etapes">
			<div>
				<h1> origami : ${ origami.nom }</h1>
			</div>
			
				<c:forEach items="${ etapes }" var="etape">
					<div class="form-group row">
						<input readonly type="number" class="form-control" id="description" name="numero" value="${ etape.numero }" />
					</div>
					
					<div class="form-group row">
						<label for="text" class="col-sm-2 col-form-label">Description</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="description" name="description" placeholder="Plier une feuille en 2..." value="${ etape.description }" />
						</div>
					</div>
					<div class="form-group row">
						<label for="text" class="col-sm-2 col-form-label">Url de l'image</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="urlImg" name="urlImg" placeholder="Plier une feuille en 2..." value="${ etape.urlImg }" />
						</div>
					</div>
					<!--  
					<div class="form-group row">
						<label for="number" class="col-sm-2 col-form-label">IdOrigami</label>
						<div class="col-sm-10">
							<input readonly type="number" class="form-control" id="description" name="idOrigami" value="${ etape.origami.id }" />
						</div>
					</div>
					-->
					
								
				</c:forEach>	
					<div class="form-group row">
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary">Valider</button>
						</div>
					</div>
			</form>
		</div>
	</body>
</html>