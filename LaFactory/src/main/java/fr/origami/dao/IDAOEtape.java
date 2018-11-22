package fr.origami.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fr.origami.model.Etape;
import fr.origami.model.Origami;

public interface IDAOEtape extends JpaRepository<Etape, Integer>{
	public List<Etape> findByOrigami(Origami origami);

}
