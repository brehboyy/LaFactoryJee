package fr.origami.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.springframework.transaction.annotation.Transactional;

@Entity
@Table(name="categorie")
@Transactional
public class Categorie {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="CAT_ID")
	private int id;
	@Column(name="CAT_NOM", length=100, nullable=false)
	@NotEmpty
	private String nom;
	
	@ManyToOne
	@JoinColumn(name="CAT_PARENT_ID")
	private Categorie catparent;
	
	@ManyToMany(mappedBy = "categories")
	private List<Origami> origamis = new ArrayList<Origami>();
	
	public Categorie getCategorie_parent() {
		return catparent;
	}
	public void setCategorie_parent(Categorie categorie_parent) {
		this.catparent = categorie_parent;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public List<Origami> getOrigamis() {
		return origamis;
	}
	public void addOrigami(Origami o) {
		this.origamis.add(o);
	}
	
	
	
	public Categorie getCatparent() {
		return catparent;
	}
	public void setCatparent(Categorie catparent) {
		this.catparent = catparent;
	}
	
	public void getOrigamis(List<Origami> origamis) {
		this.origamis = origamis;
	}
	public Categorie() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Categorie(String nom, Categorie categorie_parent) {
		super();
		this.nom = nom;
		this.catparent = categorie_parent;
		this.origamis = new ArrayList<Origami>();
	}
}
