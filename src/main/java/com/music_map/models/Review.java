package com.music_map.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "reviews")
public class Review {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY )
private Long id;
@Size(min = 1, max = 500)
private String reviewBody;
private String artistId;

@Column(updatable = false)
private Date createdAt;
private Date updatedAt;


public Review() {}

public Long getId() {
	return id;
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


}
