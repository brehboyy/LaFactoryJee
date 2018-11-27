package fr.origami.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import fr.origami.model.Origami;


public interface IDAOOrigami extends JpaRepository<Origami, Integer>{
	
	/*@Query("select o from Origami o left join fetch origami_categorie oc where oc.categorie = :categorie")
	public List<Origami> getOrgigamiByIdCat(@Param("categorie") Categorie categorie);*/
	
}
