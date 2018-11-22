package fr.origami.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import fr.origami.model.Categorie;
@Service
public interface IDAOCategorie extends JpaRepository<Categorie, Integer>{
	
	//public List<Categorie> findByIdCategorie_parent(Categorie parent);

	//@Query("select c from Categorie c where c.categorie_parent is NULL")
	//public List<Categorie> getSuperCategories();
	
	public List<Categorie> findByCatparent(Categorie catparent);
}
