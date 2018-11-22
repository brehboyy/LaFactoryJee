package fr.origami.model;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.PositiveOrZero;


@Entity
@Table(name="Origami")
public class Origami {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ORG_ID")
	private int id;
	@Column(name="ORG_NOM", length=50, nullable=false)
	@NotEmpty
	private String nom;
	@Column(name="ORG_TIMEMINUTE", length=50, nullable=false)
	@PositiveOrZero
	private int timeMinute;
	@Column(name="ORG_LEVEL", length=11, nullable=false)
	@NotEmpty
	private String level;
	@Column(name="ORG_NBFEUILLE", length=4, nullable=false)
	@PositiveOrZero
	private int nbFeuilles;
	@Column(name="ORG_NOTE", length=1, nullable=false)
	@PositiveOrZero
	private float note;
	@Column(name="ORG_ENABLE", length=1, nullable=false)
	private boolean enable;
	@Column(name="ORG_URLVIDEO", length=500, nullable=false)
	@NotEmpty
	private String urlVideo;
	
	@Column(name="ORG_URLIMG", length=500, nullable=false)
	@NotEmpty
	private String urlImg;
	
	
	@ManyToMany(cascade = {CascadeType.ALL})
	@JoinTable(
			joinColumns = {@JoinColumn(name = "ORG_ID" , nullable = false)},
			inverseJoinColumns = {@JoinColumn(name = "CAT_ID", nullable = false)})
	private List<Categorie> categories = new ArrayList<Categorie>(0);
	
	
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

	public int getTimeMinute() {
		return timeMinute;
	}

	public void setTimeMinute(int timeMinute) {
		this.timeMinute = timeMinute;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public int getNbFeuilles() {
		return nbFeuilles;
	}

	public void setNbFeuilles(int nbFeuilles) {
		this.nbFeuilles = nbFeuilles;
	}

	public float getNote() {
		return note;
	}

	public void setNote(float note) {
		this.note = note;
	}

	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

	public Origami() { super();}

	public String getUrlVideo() {
		return urlVideo;
	}

	public void setUrlVideo(String urlVideo) {
		this.urlVideo = urlVideo;
	}

	public String getUrlImg() {
		return urlImg;
	}

	public void setUrlImg(String urlImg) {
		this.urlImg = urlImg;
	}

	public List<Categorie> getCategories() {
		return categories;
	}

	public void setCategories(List<Categorie> categories) {
		this.categories = categories;
	}

	public Origami(String nom, int timeMinute, String level, int nbFeuilles) {
		super();
		this.nom = nom;
		this.timeMinute = timeMinute;
		this.level = level;
		this.nbFeuilles = nbFeuilles;
		
	}
}
