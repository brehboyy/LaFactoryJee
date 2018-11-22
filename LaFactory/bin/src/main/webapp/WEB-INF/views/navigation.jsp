<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="#">Tetris</a>
	
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item <c:if test="${ isPageHomeActive }">active</c:if>"><a class="nav-link" href="home">Accueil</a></li>
			<li class="nav-item <c:if test="${ isPageTetriminoActive }">active</c:if>"><a class="nav-link" href="tetrimino">Tetriminos</a></li>
			<li class="nav-item <c:if test="${ isPageJoueurActive }">active</c:if>"><a class="nav-link" href="joueur">Joueurs</a></li>
			<li class="nav-item"><a class="nav-link" href="logout">Se déconnecter</a></li>
		</ul>
	</div>
</nav>