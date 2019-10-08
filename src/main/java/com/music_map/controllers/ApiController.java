package com.music_map.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.music_map.models.*;
import com.music_map.services.ApiService;
import com.music_map.services.MainService;
import com.music_map.services.ReviewService;
import com.wrapper.spotify.model_objects.specification.AlbumSimplified;
import com.wrapper.spotify.model_objects.specification.Artist;
import com.wrapper.spotify.model_objects.specification.Paging;

@Controller
public class ApiController {
	ApiService api = new ApiService();
	public final ReviewService reviewService;
	public final MainService mainService;
	public ApiController(ApiService api, ReviewService reviewService, MainService mainService) {
		this.reviewService = reviewService;
		this.mainService = mainService;
		this.api = api;
	}

	@RequestMapping("/search")
	public String findArtists(Model model, @RequestParam(value = "search", required = false) String artist,
			HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		System.out.println("USER ID" + userId);
		if (userId != null) {
			User user = mainService.findUserById(userId);
			model.addAttribute("currentUser", user);
		} else {
			model.addAttribute("currentUser", null);
		}
		ApiService.clientCredentials_Async();
		if (artist != null) {
			Paging<Artist> results = api.searchArtist(artist);
			model.addAttribute("results", results);
		} else {
			model.addAttribute("results", null);
		}
		model.addAttribute("search", artist);
		return "search.jsp";
	}

//VIEW ARTIST
	@GetMapping("/view/{artistId}")
	public String viewArtist(Model model, @PathVariable("artistId") String artistId,
			@ModelAttribute("newReview") Review newReview, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		System.out.println("USER ID" + userId);
		if (userId != null) {
			User user = mainService.findUserById(userId);
			model.addAttribute("currentUser", user);
		} else {
			model.addAttribute("currentUser", null);
		}
		ApiService.clientCredentials_Async();
		Artist selected = api.findArtistById(artistId);
		Paging<AlbumSimplified> albums = api.findAlbums(artistId);
		List<Review> reviews = reviewService.getAllReview(artistId);
		model.addAttribute("reviews", reviews);
		model.addAttribute("albums", albums);
		model.addAttribute("artist", selected);
		return "viewArtist.jsp";
	}

//CREATE REVIEW
	@PostMapping("/review/{artistId}")
	public String reviewArtist(Model model, @PathVariable("artistId") String artistId,
			@Valid @ModelAttribute("newReview") Review review, BindingResult result) {
		if (result.hasErrors()) {
			ApiService.clientCredentials_Async();
			Artist selected = api.findArtistById(artistId);
			Paging<AlbumSimplified> albums = api.findAlbums(artistId);
			List<Review> reviews = reviewService.getAllReview(artistId);
			model.addAttribute("reviews", reviews);
			model.addAttribute("albums", albums);
			model.addAttribute("artist", selected);
			return "viewArtist.jsp";
		} else {
			reviewService.createReview(review);
			return "redirect:/view/{artistId}";
		}
	}

	// ARTIST EXPLORE
	@GetMapping("/explore/{artistId}")
	public String artistExplore(Model model, @PathVariable("artistId") String artistId, HttpSession session) {
		Artist[] related = api.findRelated(artistId);
		Artist artist = api.findArtistById(artistId);
		model.addAttribute("artist", artist);
		model.addAttribute("relatedArtists", related);
		return "exploreArtist.jsp";
	}

	// VIEW USER
	@RequestMapping("/user/{viewId}")
	public String viewUser(Model model, @PathVariable("viewId") Long viewId, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId != null) {
			User user = mainService.findUserById(userId);
			model.addAttribute("currentUser", user);
		} else {
			model.addAttribute("currentUser", null);
		}
		//gets user of profile
		User viewedUser = mainService.findUserById(viewId);
		model.addAttribute("viewedUser", viewedUser);
		//get artists that are reviewed
		List<Review> reviews = mainService.getUserReviews(viewedUser);
		List<Artist> reviewedArtists = api.findReviewArtists(reviews);
		model.addAttribute("reviewedArtists", reviewedArtists);
		return "viewUser.jsp";
	}
}
