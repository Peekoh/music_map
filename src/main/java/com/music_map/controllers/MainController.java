package com.music_map.controllers;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.music_map.models.User;
import com.music_map.services.MainService;
import com.music_map.validator.UserValidator;


@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	@Autowired 
	private UserValidator userValidator;


	/* VIEW HOME */
	@RequestMapping("/")
	public String viewHome() {
		return "home.jsp";
	}

	/* VIEW PROFILE */
	@RequestMapping("/profile/{id}")
	public String viewProfile(Model model, @PathVariable("id") Long id) {
		return "profile.jsp";
	}
	
	/* VIEW REGISTRATION */
	@RequestMapping("/register")
	public String registerForm(@ModelAttribute("user") User user) {
		return "registration.jsp";
	}

	/* VIEW LOGIN */
	@RequestMapping("/login")
	public String login() {
		return "login.jsp";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
	userValidator.validate(user, result);
		if (result.hasErrors()) {
			return "";
		}
		User u = mainService.registerUser(user);
		session.setAttribute("userId", u.getId());
		return "redirect:/";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, @ModelAttribute("user") User user,
			HttpSession session, Model model) {
		boolean isAuthenticated = mainService.authenticateUser(email, password);
		if (isAuthenticated) {
			User u = mainService.findByEmail(email);
			session.setAttribute("userId", u.getId());
			return "redirect:/";
		} else {
			model.addAttribute("error", "Invalid Credenttials. Please try again.");
			return "";
		}
	}


}
