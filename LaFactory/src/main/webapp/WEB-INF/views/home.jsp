<%@ page contentType="text/html; charset=UTF-8" %>


<!doctype html>
<html>
	<head>
		<title>Accueil</title>
		<meta charset="UTF-8" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	</head>
	
	
	<body>
		<jsp:include page="navigation.jsp" />
		<div class="container">
			<h1>Accueil</h1>
			<p>Bonjour ${ administrateur } !</p>
		</div>
	</body>
</html>