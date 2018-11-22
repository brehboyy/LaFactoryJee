<%@ page contentType="text/html; charset=UTF-8" %>


<!doctype html>
<html>
	<head>
		<title>Se connecter</title>
		<meta charset="UTF-8" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	</head>
	
	<body>
		<header class="text-center mb-4">
	        <h1 class="h3 mb-3 font-weight-normal">Connexion</h1>
		</header>
      
		<div class="container">
			<form method="POST">
				<div class="form-group row">
					<label for="username" class="col-sm-2 col-form-label">Nom d'utilisateur</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="username" name="username" placeholder="Nom d'utilisateur" required />
					</div>
				</div>
				
				<div class="form-group row">
					<label for="password" class="col-sm-2 col-form-label">Mot de passe</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="password" name="password" placeholder="Mot de passe" required />
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-10">
						<button type="submit" class="btn btn-primary">C'est parti !</button>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>