package fr.origami.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="vueorigami")
public class VueOrigami {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="VUEORG_ID")
	private int id;
	@ManyToOne
	@JoinColumn(name="VUEORG_IDORIGAMI", nullable=false)
	private int idOrigami;
	@Column(name="VUE_DATE", nullable=false)
	@NotEmpty
	private Date date;
	
	public VueOrigami() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public VueOrigami(int id, int idOrig, Date date) {
		super();
		this.id = id;
		this.idOrigami = idOrig;
		this.date = date;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdOrig() {
		return idOrigami;
	}
	public void setIdOrig(int idOrig) {
		this.idOrigami = idOrig;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
