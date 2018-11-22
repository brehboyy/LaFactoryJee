package fr.origami.controller;

import java.util.ArrayList;
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
import fr.origami.model.Commentaire;
import fr.origami.model.Etape;
import fr.origami.model.Origami;

@Controller
@RequestMapping("/origami")
public class OrigamiController {
	@Autowired
	private IDAOOrigami idaoorigami;
	@Autowired
	private IDAOEtape idaoetape;
	@Autowired
	private IDAOCommentaire idaocommentaire;
	

	@GetMapping
	public String findAll(Model model, HttpSession session) {
		
		List<Origami> origamis = new ArrayList<Origami>(this.idaoorigami.findAll());
		model.addAttribute("origamis", origamis);
		model.addAttribute("utilisateur", session.getAttribute("utilisateur"));
		return "origamis";
	}

	@GetMapping("/ajouter")
	public String add() {
		return "edit-origami";
	}

	@PostMapping("/ajouter")
	public String add(@ModelAttribute Origami origami, Model model, HttpServletRequest request) {

		List<Etape> etapes = new ArrayList<Etape>();
			origami.setLevel(request.getParameter("level"));
			origami.setEnable(request.getParameter("enable") != null);
			origami.setNbFeuilles(Integer.parseInt(request.getParameter("nbFeuilles")));
			origami.setNbVues(0);
			origami.setNote(0);
			origami.setNom(request.getParameter("nom"));
			origami.setUrlImg(request.getParameter("urlImg"));
			origami.setUrlVideo(request.getParameter("urlVideo"));
			origami.setTimeMinute(Integer.parseInt(request.getParameter("timeMinute")));
			
			int nbEtapes = Integer.parseInt(request.getParameter("nbEtapes"));
			this.idaoorigami.save(origami);

			for (int i = 0; i < nbEtapes; i++) {
				Etape etape = new Etape();
				etape.setNumero(i + 1);
				etape.setOrigami(origami);
				etapes.add(etape);
			}
			model.addAttribute("tabetapes", etapes);
/*
		} catch (Exception e) {
			String[] numeros = request.getParameterValues("numero");
			String[] descriptions = request.getParameterValues("description");
			String[] urlimages = request.getParameterValues("urlimages");
			String[] idOrigamis = request.getParameterValues("idOrigami");

			for (int i = 0; i < numeros.length; i++) {

				Origami origamiadd = this.idaoorigami.findById(Integer.parseInt(idOrigamis[i])).get();
				if (origamiadd != null) {
					idaoetape.save(new Etape(Integer.parseInt(numeros[i]), descriptions[i], urlimages[i], origamiadd));
				}

			}
			for (Etape etape : etapes) {
				etapes.add(etape);
			}
			return "redirect:.";
		}*/
		return "etapes";
	}
	
	

	@GetMapping("/editer")
	public String edit(@RequestParam int id, Model model) {
		model.addAttribute("origami", idaoorigami.findById(id));
		return "edit-origami";
	}

	@PostMapping("/editer")
	public String edit(@ModelAttribute Origami origami, Model model, HttpServletRequest request) {
		return this.add(origami, model, request);
	}

	@GetMapping("/afficher")
	public String display(@RequestParam int id, Model model) {
		Origami origami = this.idaoorigami.findById(id).get();
		model.addAttribute("origami", origami);
		model.addAttribute("categories", origami.getCategories());
		model.addAttribute("etapes" ,idaoetape.findByOrigami(origami) );
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
