package fr.origami.model;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;

@Entity
@Table(name="etape")
public class Etape {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ETA_ID")
	private int id;
	
	@Column(name="ETA_NUMBER", length=5, nullable=false)
	@PositiveOrZero
	private int numero; //place dans le tutoriel
	@Column(name="ETA_DESCRIPTION", length=5000, nullable=false)
	@NotEmpty
	private String description;
	@Column(name="ETA_URLIMG", length=500, nullable=false)
	@NotEmpty
	private String urlImg;
	
	@ManyToOne
	@JoinColumn(name="ETA_ORG_ID", nullable=false)
	private Origami origami;
	
	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImageUrl() {
		return urlImg;
	}
	public void setImagesUrl(String imageUrl) {
		this.urlImg = imageUrl;
	}
	
	public Etape() {
		super();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUrlImg() {
		return urlImg;
	}
	public void setUrlImg(String urlImg) {
		this.urlImg = urlImg;
	}
	
	public Origami getOrigami() {
		return origami;
	}
	public void setOrigami(Origami origami) {
		this.origami = origami;
	}
	public Etape(int numero, String description, String imageUrl, Origami org) {
		super();
		this.numero = numero;
		this.description = description;
		this.urlImg = imageUrl;
		this.origami = org;
	}
	
	
}
