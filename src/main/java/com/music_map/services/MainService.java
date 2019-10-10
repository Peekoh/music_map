package com.music_map.services;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.music_map.exceptions.StorageException;
import com.music_map.exceptions.StorageFileNotFoundException;
import com.music_map.models.History;
import com.music_map.models.ProfilePic;
import com.music_map.models.Review;
import com.music_map.models.User;
import com.music_map.repositories.HistoryRepository;
import com.music_map.repositories.ProfilePicRepository;
import com.music_map.repositories.UserRepository;

@Service
public class MainService {
	UserRepository userRepository;
	ProfilePicRepository profilePicRepository;
	HistoryRepository historyRepository;

	public MainService(UserRepository userRepository, ProfilePicRepository profilePicRepository,
			HistoryRepository historyRepository) {
		this.userRepository = userRepository;
		this.profilePicRepository = profilePicRepository;
		this.historyRepository = historyRepository;
	}

	public User registerUser(User user) {
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		return userRepository.save(user);
	}

	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	public User findUserById(Long id) {
		Optional<User> u = userRepository.findById(id);
		if (u.isPresent()) {
			return u.get();
		} else {
			return null;
		}
	}

	public List<Review> getUserReviews(User u) {
		return u.getReviews();
	}

	public boolean authenticateUser(String email, String password) {
		User user = userRepository.findByEmail(email);
		if (user == null) {
			return false;
		} else {
			if (BCrypt.checkpw(password, user.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}

	// UPLOAD FILE
	public ProfilePic storeFile(User u, MultipartFile file) {
		// Normalize file name
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());

		try {
			// Check if the file's name contains invalid characters
			if (fileName.contains("..")) {
				throw new StorageException("Sorry! Filename contains invalid path sequence " + fileName);
			}

			System.out.println("FILE" + fileName + "\n TYPE" + file.getContentType() + "\n BYTES" + file.getBytes());
			ProfilePic dbFile = new ProfilePic(fileName, file.getContentType(), file.getBytes(), u);
			ProfilePic p = profilePicRepository.save(dbFile);

			return p;
		} catch (IOException ex) {
			throw new StorageException("Could not store file " + fileName + ". Please try again!", ex);
		}
	}

	// ADD TO HISTORY
	public void addHistory(String id, User u) {
		History h = new History();
		h.setArtistId(id);
		h.setUser(u);
		List<History> hl = u.getHistory();
		for (int i = 0; i < hl.size(); i++) {
			System.out.println(hl.get(i).getArtistId());
			System.out.println(h.getArtistId());

			if (h.getArtistId().equals(hl.get(i).getArtistId())) {
			//historyRepository.save(hl.get(i));
			System.out.println("ALREADY VIEWED");
			return;
			}
		}
		// hl.add(h);
		historyRepository.save(h);
		return;
	}

	/*
	 * public ProfilePic getPic(String fileId) { return
	 * profilePicRepository.findById(fileId) .orElseThrow(() -> new
	 * StorageFileNotFoundException("File not found with id " + fileId)); } public
	 * ProfilePic savePic(ProfilePic p) { return profilePicRepository.save(p); }
	 */

}
