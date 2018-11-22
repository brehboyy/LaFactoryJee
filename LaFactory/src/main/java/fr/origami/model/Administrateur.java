package fr.origami.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="administrateur")
public class Administrateur {
	public Administrateur() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ADM_ID")
	private int id;
	
	@Column(name="ADM_USERNAME", length=50, nullable=false, unique=true)
	@NotEmpty
	protected String username;
	
	@Column(name="ADM_PASSWORD", length=50, nullable=false)
	@NotEmpty
	protected String password;
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
