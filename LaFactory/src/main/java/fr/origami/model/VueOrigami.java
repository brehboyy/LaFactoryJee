package fr.origami.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.print.attribute.standard.DateTimeAtCompleted;
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
	private Origami origami;
	@Column(name="VUE_DATE", nullable=false)
	private Timestamp date;
	
	@Override
	public String toString() {
		return "VueOrigami [id=" + id + ", origami=" + origami + ", date=" + date + "]";
	}

	public VueOrigami() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public VueOrigami(int id, Origami org, Timestamp date) {
		super();
		this.id = id;
		this.origami = org;
		this.date = date;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Origami getOrigami() {
		return origami;
	}

	public void setOrigami(Origami origami) {
		this.origami = origami;
	}

	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
}
