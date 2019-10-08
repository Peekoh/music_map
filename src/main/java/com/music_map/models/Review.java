package com.music_map.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "reviews")
public class Review {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;
@Size(min = 1, max = 500)
private String reviewBody;
private String artistId;
@Size(min = 1, max = 5)
private String rating;
@Column(updatable = false)
private Date createdAt;
private Date updatedAt;
public Review() {}
public Long getId() {
	return id;
}

public String getRating() {
	return rating;
}
public void setRating(String rating) {
	this.rating = rating;
}
public void setId(Long id) {
	this.id = id;
}

public String getReviewBody() {
	return reviewBody;
}

public void setReviewBody(String reviewBody) {
	this.reviewBody = reviewBody;
}

public String getArtistId() {
	return artistId;
}

public void setArtistId(String artistId) {
	this.artistId = artistId;
}

public Date getCreatedAt() {
	return createdAt;
}

public void setCreatedAt(Date createdAt) {
	this.createdAt = createdAt;
}

public Date getUpdatedAt() {
	return updatedAt;
}

public void setUpdatedAt(Date updatedAt) {
	this.updatedAt = updatedAt;
}

@PrePersist
protected void onCreate() {
	this.createdAt = new Date();
}

@PreUpdate
protected void onUpdate() {
	this.updatedAt = new Date();
}
}
