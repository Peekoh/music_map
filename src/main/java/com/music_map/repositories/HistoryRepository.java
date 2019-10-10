package com.music_map.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.music_map.models.History;
import com.music_map.models.User;

public interface HistoryRepository extends CrudRepository<History, Long>{
List<History> findLast5ByUser(User u);
}
