<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Music Map</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="\index.css">
<script defer src="/javascripts/app.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
</head>
<body>
	<div class="navbar">
		<c:choose>
			<c:when test="${currentUser == null}">
				<a href="/login">Login</a>
				<a href="/register">Register</a>
			</c:when>
			<c:otherwise>
				<span>Hello, </span>
				<c:out value="${currentUser.firstName}" />
			</c:otherwise>
		</c:choose>
		<div class="dropdown">
			<button class="dropbtn">
				Genre Music <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="#">Country</a> <a href="#">Rock</a> <a href="#">Jazz</a> <a
					href="#">Hip Hop</a> <a href="#">Blues</a> <a href="#">Heavy
					Metal</a> <a href="#">Pop</a>
			</div>
		</div>
	</div>
	<h1>
		<c:out value="${viewedUser.firstName} ${viewedUser.lastName}" />
	</h1>
	<div id="user-info">
		<img src="/download/${pic}" alt="profile-img" />
		<c:choose>
			<c:when test="${currentUser == viewedUser}">
				<div id="photo-upload-container-closed">
					<button id="change-photo">Change Photo</button>
				</div>
				<div id="photo-upload-container-open">
					<form action="/upload" method="post" enctype="multipart/form-data">
						Select image to upload: <input type="file" name="file"
							id="fileToUpload"> <input type="submit"
							value="Upload Image" name="submit">
					</form>

				</div>
			</c:when>
		</c:choose>
		<p>
			User Since:
			<fmt:formatDate dateStyle="short" value="${viewedUser.createdAt}"></fmt:formatDate>
		</p>
	</div>
	<div id="user-reviews">
		<h2>Reviews</h2>
		<c:forEach items="${viewedUser.reviews}" var="review">
			<c:out value="${review.reviewBody}" />
			<c:forEach items="${reviewedArtists}" var="artist">
				<p>
					<c:out value="Review of: ${artist.name}" />
				</p>
				<p>
					Posted:
					<fmt:formatDate dateStyle="short" value="${review.createdAt}"></fmt:formatDate>

				</p>
			</c:forEach>
		</c:forEach>
	</div>
	<script src="/script/photoUpload.js"></script>
</body>
</html>