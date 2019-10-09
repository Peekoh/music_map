package com.music_map.controllers;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

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
	public String viewHome(Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId != null) {
			User user = mainService.findUserById(userId);
			model.addAttribute("currentUser", user);
		} else {
			model.addAttribute("currentUser", null);
		}
		return "home.jsp";
	}

	/* VIEW PROFILE */
	@RequestMapping("/profile/{id}")
	public String viewProfile(Model model, @PathVariable("id") Long id, HttpSession session) {
		return "profile.jsp";
	}
	
	/* VIEW REGISTRATION */
	@RequestMapping("/register")
	public String registerForm(@ModelAttribute("user") User user, HttpSession session) {
		return "register.jsp";
	}

	/* VIEW LOGIN */
	@RequestMapping("/login")
	public String login(HttpSession session) {
		return "login.jsp";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
	userValidator.validate(user, result);
		if (result.hasErrors()) {
			return "register.jsp";
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
			System.out.println("SUCCESS");
			return "redirect:/";
		} else {
			model.addAttribute("error", "Invalid Credenttials. Please try again.");
			return "login.jsp";
		}
	}
}
