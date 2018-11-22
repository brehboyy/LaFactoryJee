<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<!doctype html>
<html>
	<head>
		<title>Liste des joueurs</title>
		<meta charset="UTF-8" />
		<base href="/tetris-back/" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	</head>
	
	
	<body>
		<jsp:include page="navigation.jsp" />
		
		<div class="container">
			<h1>Liste des joueurs</h1>
			
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Pseudo</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${ joueurs }" var="joueur">
						<tr>
							<td>${ joueur.pseudo }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>