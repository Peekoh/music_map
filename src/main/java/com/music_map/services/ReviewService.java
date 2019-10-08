package com.music_map.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.music_map.models.Review;
import com.music_map.repositories.ReviewRepository;
@Service
public class ReviewService {
private final ReviewRepository reviewRepo;

public ReviewService(ReviewRepository reviewRepo) {
	this.reviewRepo = reviewRepo;
}

//CREATE REVIEW
public Review createReview(Review r) {
	return reviewRepo.save(r);
}
//GET REVIEW
public List<Review> getAllReview(String id){
	List<Review> reviews = reviewRepo.findByArtistId(id);
	return reviews;
}


}
