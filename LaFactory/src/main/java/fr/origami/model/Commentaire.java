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
import javax.validation.constraints.Size;
@Entity
@Table(name="commentaire")
public class Commentaire {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="COM_ID")
	private int Id;
	@Column(name="COM_PSEUDO", length=50, nullable=false)
	@NotEmpty
	private String pseudo;
	@Column(name="COM_MESSAGE", length=5000, nullable=false)
	@NotEmpty
	private String message;
    
	@ManyToOne
	@JoinColumn(name="COM_ORG_ID", nullable = false)
	private Origami origami;
	
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getPseudo() {
		return pseudo;
	}
	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public Commentaire () {
		super();
	}
	public Origami getOrigami() {
		return origami;
	}
	public void setOrigami(Origami origami) {
		this.origami = origami;
	}
	public Commentaire (String pseudo, String message, Origami org) {
		super();
		this.pseudo = pseudo;
		this.message = message;
		this.origami = org;
	}
	
		
}
