package com.music_map.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.music_map.models.ProfilePic;
@Repository
public interface ProfilePicRepository extends CrudRepository<ProfilePic, String>{

}
