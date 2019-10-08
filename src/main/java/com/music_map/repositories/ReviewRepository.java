package com.music_map.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.music_map.models.Review;
@Repository
public interface ReviewRepository extends CrudRepository<Review, Long> {

List<Review> findByArtistId(String id);
}
