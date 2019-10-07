package com.music_map.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.music_map.models.User;

@Repository
public interface UserRepository extends CrudRepository <User, Long>{
	User findByEmail(String email);
}
