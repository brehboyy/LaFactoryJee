package fr.origami.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fr.origami.model.Commentaire;
import fr.origami.model.Origami;


public interface IDAOCommentaire extends  JpaRepository<Commentaire, Integer>{
	
	public List<Commentaire> findByOrigami(Origami origami);

}
