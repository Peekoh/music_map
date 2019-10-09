package com.music_map.payload;

import com.music_map.models.User;

public class UploadFileResponse {
	private final String fileName;
	private final String fileDownloadUri;
	private final String fileType;
	private final Long size;
	private final User user;

	public UploadFileResponse(String fileName, String fileDownloadUri, String fileType, Long size, User user) {
		super();
		this.fileName = fileName;
		this.fileDownloadUri = fileDownloadUri;
		this.fileType = fileType;
		this.size = size;
		this.user = user;
	}

	public String getFileName() {
		return fileName;
	}

	public String getFileDownloadUri() {
		return fileDownloadUri;
	}

	public String getFileType() {
		return fileType;
	}

	public Long getSize() {
		return size;
	}

	public User getUser() {
		return user;
	}
	

}