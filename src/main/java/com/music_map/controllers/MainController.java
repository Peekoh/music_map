package com.music_map.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.music_map.services.ApiService;
import com.wrapper.spotify.model_objects.specification.Artist;
import com.wrapper.spotify.model_objects.specification.Paging;

@Controller
public class MainController {


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


}
