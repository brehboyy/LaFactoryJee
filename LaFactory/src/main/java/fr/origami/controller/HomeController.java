package fr.origami.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	@GetMapping({ "/", "/home" })
	public String home(HttpSession session) {
		if (session.getAttribute("utilisateur") == null) {
			return "login";
		}
		return "home";
	}
	
	
	
	@PostMapping({ "/", "/home" })
	public String login(@RequestParam String username, HttpSession session) {
		session.setAttribute("utilisateur", username);
		return "redirect:home";
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
