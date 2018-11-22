package fr.origami.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fr.origami.model.Administrateur;


public interface IDAOAdmin extends JpaRepository<Administrateur, Integer> {
	@Query("select a from Administrateur a where a.username = :username and a.password = :password")
	public Administrateur auth(@Param("username") String username, @Param("password") String password);
}


