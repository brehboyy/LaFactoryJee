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
			<div class="col-sm-4">
				<h2>Tree</h2>
				<div id="treeview-checkable" class="treeview">
					<ul class="list-group">
						<li class="list-group-item node-treeview-checkable"
							data-nodeid="0"
							style="color: undefined; background-color: undefined;"><span
							class="icon expand-icon glyphicon glyphicon-minus"></span><span
							class="icon check-icon glyphicon glyphicon-unchecked"></span>Parent
							1</li>
						<li class="list-group-item node-treeview-checkable"
							data-nodeid="1"
							style="color: undefined; background-color: undefined;"><span
							class="indent"></span><span
							class="icon expand-icon glyphicon glyphicon-minus"></span><span
							class="icon check-icon glyphicon glyphicon-unchecked"></span>Child
							1</li>
						<li class="list-group-item node-treeview-checkable"
							data-nodeid="2"
							style="color: undefined; background-color: undefined;"><span
							class="indent"></span><span class="indent"></span><span
							class="icon glyphicon"></span><span
							class="icon check-icon glyphicon glyphicon-unchecked"></span>Grandchild
							1</li>
						<li class="list-group-item node-treeview-checkable"
							data-nodeid="3"
							style="color: undefined; background-color: undefined;"><span
							class="indent"></span><span class="indent"></span><span
							class="icon glyphicon"></span><span
							class="icon check-icon glyphicon glyphicon-unchecked"></span>Grandchild
							2</li>
						<li class="list-group-item node-treeview-checkable"
							data-nodeid="4"
							style="color: undefined; background-color: undefined;"><span
							class="indent"></span><span class="icon glyphicon"></span><span
							class="icon check-icon glyphicon glyphicon-unchecked"></span>Child
							2</li>
						<li class="list-group-item node-treeview-checkable"
							data-nodeid="5"
							style="color: undefined; background-color: undefined;"><span
							class="icon glyphicon"></span><span
							class="icon check-icon glyphicon glyphicon-unchecked"></span>Parent
							2</li>
						<li class="list-group-item node-treeview-checkable"
							data-nodeid="6"
							style="color: undefined; background-color: undefined;"><span
							class="icon glyphicon"></span><span
							class="icon check-icon glyphicon glyphicon-unchecked"></span>Parent
							3</li>
						<li class="list-group-item node-treeview-checkable"
							data-nodeid="7"
							style="color: undefined; background-color: undefined;"><span
							class="icon glyphicon"></span><span
							class="icon check-icon glyphicon glyphicon-unchecked"></span>Parent
							4</li>
						<li class="list-group-item node-treeview-checkable"
							data-nodeid="8"
							style="color: undefined; background-color: undefined;"><span
							class="icon glyphicon"></span><span
							class="icon check-icon glyphicon glyphicon-unchecked"></span>Parent
							5</li>
					</ul>
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
					<input type="checkbox" class="form-check-input" name="enable"
						value="${ origami.enable }" id="enable"> <label
						class="form-check-label">Afficher</label>
				</div>
			</div>

			<div class="form-group row">
				<label for="nom" class="col-sm-2 col-form-label">URL video</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="urlVideo"
						name="urlVideo" placeholder="Url video"
						value="${ origami.urlVideo}" />
				</div>
			</div>

			<div class="form-group row">
				<label for="nom" class="col-sm-2 col-form-label">URL image</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="urlImg" name="urlImg"
						placeholder="Url image" value="${ origami.urlImg}" />
				</div>
			</div>
			<label for="nom" class="col-sm-2 col-form-label">Etapes</label>
			<c:forEach items="${ etapes }" var="etape">
				<div class="form-group row">
					<input readonly type="number" class="form-control" id="description"
						name="numero${ etape.numero }" value="${ etape.numero }" />
				</div>

				<div class="form-group row">
					<label for="text" class="col-sm-2 col-form-label">Description</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="description"
							name="description${ etape.numero }"
							placeholder="Plier une feuille en 2..."
							value="${ etape.description }" />
					</div>
				</div>
				<div class="form-group row">
					<label for="text" class="col-sm-2 col-form-label">Url de
						l'image</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="urlImg"
							name="urlImg${ etape.numero }"
							placeholder="Plier une feuille en 2..." value="${ etape.urlImg }" />
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
				<label for="number" class="col-sm-2 col-form-label">Nombre
					d'étapes</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" id="nbEtapes"
						name="nbEtapes" placeholder="3" value="" />
				</div>
				<button type="submit" name="action" value="ajouter"
					class="btn btn-primary">Ajouter</button>
			</div>

			<div class="form-group row">
				<div class="col-sm-10">
					<button type="submit" name="action" value="valider"
						class="btn btn-primary">Valider</button>
				</div>
			</div>


		</form>
	</div>
</body>
</html>