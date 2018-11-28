package fr.origami.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.origami.dao.*;
import fr.origami.model.Administrateur;
import fr.origami.model.Commentaire;
import fr.origami.model.Etape;
import fr.origami.model.Origami;
import fr.origami.model.VueOrigami;

@Controller
@RequestMapping("/origami")
public class OrigamiController {
	@Autowired
	private IDAOOrigami idaoorigami;
	@Autowired
	private IDAOEtape idaoetape;
	@Autowired
	private IDAOCommentaire idaocommentaire;
	@Autowired
	private IDAOVueOrigami idaovueorigami;
	@Autowired
	private IDAOAdmin idaoadmin;
	
	private static List<Etape> etapes = new ArrayList<Etape>();

	@GetMapping
	public String findAll(Model model, HttpSession session) {
		List<Origami> origamis = new ArrayList<Origami>(this.idaoorigami.findAll());
		model.addAttribute("origamis", origamis);
		model.addAttribute("administrateur", session.getAttribute("administrateur"));
		HashMap<Origami, Integer> nbvueorigami = new HashMap<Origami, Integer>();
		for (Origami or : origamis) {
			nbvueorigami.put(or, idaovueorigami.countByOrigami(or));
		}
		model.addAttribute("nbvueorigami",nbvueorigami);
		return "origamis";
	}

	@GetMapping("/ajouter")
	public String add(Model model) {
 		model.addAttribute("etapes",etapes);
		return "edit-origami";
	}

	@PostMapping("/ajouter")
	public String add(@ModelAttribute Origami origami, Model model, HttpServletRequest request) {
		try {
		String action = request.getParameter("action");
		if ("ajouter".equals(action)) {
		    // Invoke FirstServlet's job here.
			int nbEtapes = Integer.parseInt(request.getParameter("nbEtapes"));
			for (Etape e : etapes) {
				e.setDescription(request.getParameter("description" + e.getNumero()));
				e.setImagesUrl(request.getParameter("urlImg" + e.getNumero()));
				e.setOrigami(origami);
			}
			for (int i = 0; i < nbEtapes; i++) {
				Etape e = new Etape();
				e.setNumero(etapes.size() + 1);
				etapes.add(e);
			}
			model.addAttribute("etapes",etapes);
			return "edit-origami";
		} else {
		    // Invoke SecondServlet's job here.
			origami.setLevel(request.getParameter("level"));
			origami.setEnable(request.getParameter("enable") != null);
			origami.setNbFeuilles(Integer.parseInt(request.getParameter("nbFeuilles")));
			origami.setNote(0);
			origami.setNom(request.getParameter("nom"));
			origami.setUrlImg(request.getParameter("urlImg"));
			origami.setUrlVideo(request.getParameter("urlVideo"));
			origami.setTimeMinute(Integer.parseInt(request.getParameter("timeMinute")));
			this.idaoorigami.save(origami);
			for (Etape e : etapes) {
				e.setDescription(request.getParameter("description" + e.getNumero()));
				e.setImagesUrl(request.getParameter("urlImg" + e.getNumero()));
				e.setOrigami(origami);
				this.idaoetape.save(e);
			}
			model.addAttribute("origami", origami);
			model.addAttribute("etapes", idaoetape.findByOrigami(origami));
			model.addAttribute("commentaires", idaocommentaire.findByOrigami(origami));
			etapes.clear();
			
			return "afficher";
		}
		}catch(Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("etapes",etapes);
			return "edit-origami";
		}
		
		
	}
	
	@GetMapping("/etapes")
	public String add_etapes(@ModelAttribute Origami origami,Model model, HttpServletRequest request) {
		List<Etape> etapes = new ArrayList<Etape>();
		int nbEtapes = Integer.parseInt(request.getParameter("nbEtapes"));
		

		for (int i = 0; i < nbEtapes; i++) {
			Etape etape = new Etape();
			etape.setNumero(i + 1);
			etape.setOrigami(origami);
			etapes.add(etape);
		}
		model.addAttribute("etapes", etapes);
		model.addAttribute("origami", origami);
		return "etapes";
	}

	@PostMapping("/etapes")
	public String edit_etapes() {
		return "afficher";
	}

	@GetMapping("/editer")
	public String edit(@RequestParam int id, Model model) {
		model.addAttribute("origami", idaoorigami.findById(id).get());
		model.addAttribute("etapes", idaoetape.findByOrigami(idaoorigami.findById(id).get()));
		return "edit-origami";
	}
	
	/*
	@GetMapping("/ajouteretapes")
	public String ajouteretapes(@ModelAttribute List<Etape> etapes) {
		Etape etape = new Etape();
		etape.setNumero(i + 1);
		etape.setOrigami(origami);
		etapes.add(etape);
		return null;
		
	}*/

	@PostMapping("/editer")
	public String edit(@ModelAttribute Origami origami, Model model, HttpServletRequest request) {
		return this.add(origami, model, request);
	}

	@GetMapping("/afficher")
	public String display(@RequestParam int id, Model model) {
		Origami origami = this.idaoorigami.findById(id).get();
		model.addAttribute("origami", origami);
		model.addAttribute("etapes", idaoetape.findByOrigami(origami));
		model.addAttribute("commentaires", idaocommentaire.findByOrigami(origami));
		VueOrigami vue = new VueOrigami();
		vue.setDate(new Timestamp(System.currentTimeMillis()));
		vue.setOrigami(origami);

		this.idaovueorigami.save(vue);
			
		return "afficher";
	}

	@PostMapping("/afficher")
	public String commenter(@ModelAttribute Commentaire commentaire, Model model, HttpServletRequest request) {
		Origami origami = this.idaoorigami.findById(Integer.parseInt(request.getParameter("id"))).get();

		commentaire.setOrigami(origami);
		this.idaocommentaire.save(commentaire);
		model.addAttribute("origami", origami);
		model.addAttribute("etapes", idaoetape.findByOrigami(origami));
		model.addAttribute("commentaires", idaocommentaire.findByOrigami(origami));
		
		
		return "afficher";
	}

	@GetMapping("/supprimer")
	public String delete(@RequestParam int id) {
		idaoorigami.deleteById(id);
		return "redirect:.";
	}

	@ModelAttribute("isPageOrigamiActive")
	public boolean isPageOrigamiActive() {
		return true;
	}
}
