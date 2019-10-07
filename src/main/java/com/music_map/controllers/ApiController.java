package com.music_map.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.music_map.models.Review;
import com.music_map.services.ApiService;
import com.wrapper.spotify.model_objects.specification.AlbumSimplified;
import com.wrapper.spotify.model_objects.specification.Artist;
import com.wrapper.spotify.model_objects.specification.Paging;

@Controller
public class ApiController {
	ApiService api = new ApiService();

	public ApiController(ApiService api) {
		this.api = api;
	}
	
@RequestMapping("/search")
public String findArtists(Model model, @RequestParam(value="search", required=false) String artist) {
	ApiService.clientCredentials_Async();
	if(artist != null) {
	Paging<Artist> results =  api.searchArtist(artist);
	model.addAttribute("results", results);		
	}else {
		model.addAttribute("results", null);
	}
	model.addAttribute("search", artist);
	return "search.jsp";
}
@GetMapping("/view/{id}")
//@ResponseBody
public String viewArtist(Model model, @PathVariable("id") String artistId, @ModelAttribute("newReview") Review newReview) {
	ApiService.clientCredentials_Async();
	Artist selected = api.findArtistById(artistId);
	Paging<AlbumSimplified> albums = api.findAlbums(artistId);
	model.addAttribute("albums", albums);
	model.addAttribute("artist", selected);
	return "viewArtist.jsp";
}
	
}
