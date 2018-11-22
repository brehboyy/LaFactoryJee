package fr.origami.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.origami.dao.IDAOAdmin;
import fr.origami.model.Administrateur;

@Controller
public class HomeController {
	@Autowired
	private IDAOAdmin idaoadmin;

	@GetMapping({ "/", "/home" })
	public String home(HttpSession session) {
		return "home";
	}

	@PostMapping({ "/", "/login" })
	public String login(@RequestParam String username, @RequestParam String password, HttpSession session) {
		Administrateur admin = this.idaoadmin.auth(username, password);
		if (admin != null) {
			session.setAttribute("administrateur", admin.getUsername());
		}
		return "redirect:home";
	}

	@GetMapping("/login")
	public String login(HttpSession session) {
		return "login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}

	@ModelAttribute("isPageHomeActive")
	public boolean isPageHomeActive() {
		return true;
	}
}
