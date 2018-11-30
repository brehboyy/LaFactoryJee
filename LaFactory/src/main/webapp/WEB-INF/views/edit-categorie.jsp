<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<!doctype html>
<html>
	<head>
		<title>Ajouter / modifier un Catégorie</title>
		<meta charset="UTF-8" />
		<base href="/LaFactory/" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="assets/css/origami.css" />
	</head>
	
	
	<body>
		<jsp:include page="navigation.jsp" />
		
		<div class="container">
			<h1>
				<c:if test="${ categorie != null }">Modifier</c:if>
				<c:if test="${ categorie == null }">Ajouter</c:if>
				une categorie
			</h1>
			
			<form method="POST">
				<div class="form-group row">
					<label for="nom" class="col-sm-2 col-form-label">Nom</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="nom" name="nom" placeholder="Nom" value="${ categorie.nom }" />
					</div>
				</div>
				
  				<select name="categorie">
  						<option value="">Principal</option>
					<c:forEach items="${ categories }" var="cat">
    					<option ${categorie.catparent.id == cat.id ? 'selected' : ''} value="${ cat.id }">${ cat.nom }</option>
					</c:forEach>
  				</select>
  				
  				
								
				<div class="form-group row">
					<div class="col-sm-10">
						<button type="submit" class="btn btn-primary">Valider</button>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>