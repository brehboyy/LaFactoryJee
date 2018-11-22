<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="#">Origami</a>

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item <c:if test="${ isPageHomeActive }">active</c:if>"><a
				class="nav-link" href="home">Accueil</a></li>
			<li
				class="nav-item <c:if test="${ isPageCategorieActive }">active</c:if>"><a
				class="nav-link" href="categorie">Catégorie d'Origami</a></li>
			<li
				class="nav-item <c:if test="${ isPageOrigamiActive }">active</c:if>"><a
				class="nav-link" href="origami">Origamis</a></li>

			<c:if test="${ administrateur == null }">
				<li class="nav-item"><a class="nav-link" href="login">Se
						connecter</a></li>
			</c:if>
			<c:if test="${ administrateur != null }">

				<li class="nav-item"><a class="nav-link" href="logout">Se
						déconnecter</a></li> 
			</c:if>
		</ul>
	</div>
</nav>