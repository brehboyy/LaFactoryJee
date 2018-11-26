package fr.origami.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.hql.internal.ast.util.SessionFactoryHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.origami.dao.IDAOCategorie;
import fr.origami.model.*;

@Controller
@RequestMapping("/categorie")
public class CategorieController {
	@Autowired
	public IDAOCategorie idaocategorie;

	@GetMapping
	public String findAll(Model model, HttpSession session) {
		model.addAttribute("categories", idaocategorie.findByCatparent(null));
		
		return "categories";
	}
	
	@GetMapping("/ajoutercategorie")
	public String add(Model model) {
		List<Categorie> categories = idaocategorie.findAll();
		model.addAttribute("categories", categories);
		return "edit-categorie";
	}
	
	@GetMapping("/editercategories")
	public String edit(@RequestParam int id, Model model) {
		List<Categorie> categories = idaocategorie.findAll();
		Categorie categorie = idaocategorie.findById(id).get();
		model.addAttribute("categories", categories);
		model.addAttribute("categorie", categorie);
		return "edit-categorie";
	}
	
	@PostMapping("/ajoutercategorie")
	public String add(@ModelAttribute Categorie categorie, Model model, HttpServletRequest request) {
		Categorie categ;
		try {
			categ = idaocategorie.findById(Integer.parseInt(request.getParameter("categorie"))).get();
			categorie.setCategorie_parent(categ);
		}catch(NumberFormatException nbEx){
		}
		idaocategorie.save(categorie);
		
		return "redirect:.";
	}
	
	@GetMapping("/affichercategories")
	public String displaycategories(@RequestParam int id, Model model) {
		Categorie categorie = idaocategorie.findById(id).get();
		List<Categorie> categories = idaocategorie.findByCatparent(categorie);
		Hibernate.initialize(categorie.getOrigamis());
		model.addAttribute("categorie", categorie);
		model.addAttribute("categories", categories);
		return "affichercat";
	}
	
	
	@GetMapping("/supprimercategorie")
	public String delete(@RequestParam int id) {
		idaocategorie.deleteById(id);
		return "redirect:.";
	}
}
