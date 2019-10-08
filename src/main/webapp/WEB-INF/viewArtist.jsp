<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Music Map</title>
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
	<form action="/search" class="search-form" method="get">
		<label for="search">Search For Artist</label> <input type="text"
			name="search" /> <input type="submit" value="Search" />
	</form>
	<h1>
		<c:out value="${artist.name}" />
	</h1>
	<img src="${artist.images[0].url}" alt="artist-pic" />
	<p>
		Genre(s):
		<c:forEach items="${artist.genres}" var="genre">
			<c:out value="${genre}" />
		</c:forEach>
	</p>
	<h2>Albums</h2>
	<div id="albums">
		<c:forEach items="${albums.items}" var="album">
			<div class="album-container">
				<h3>
					<c:out value="${album.name}" />
				</h3>
				<img src="${album.images[0].url}" alt="album" width="200px" />
			</div>
		</c:forEach>
	</div>
	<h2>Reviews</h2>
	<c:choose>
		<c:when test="${currentUser == null}">
			<p>You must be logged in to review.</p>
		</c:when>
		<c:otherwise>
			<form:form action="/review/${artist.id}" modelAttribute="newReview"
				method="post">
				<form:textarea path="reviewBody" />
				<form:errors path="reviewBody" />
				<form:input path="artistId" type="hidden" value="${artist.id}" />
				<form:input path="user" type="hidden" value="${currentUser.id}" />
				<form:errors path="user" msg="Must be logged in" />
				<form:select path="rating">
					<form:option value="1" />
					<form:option value="2" />
					<form:option value="3" />
					<form:option value="4" />
					<form:option value="5" />
				</form:select>
				<input type="submit" value="Post" />
			</form:form>
		</c:otherwise>
	</c:choose>

	<div id="reviews">
		<c:forEach items="${reviews}" var="review">
			<div>
				<span> <c:out
						value="${review.user.firstName} ${review.user.lastName}." />
				</span> <a href="/user/${review.user.id}"> <img
					src="${review.user.file}" alt="user-img" />
				</a>
			</div>
			<c:out value="${review.reviewBody}" />
			<p>
				Posted:
				<fmt:formatDate dateStyle="short" value="${review.createdAt}"></fmt:formatDate>
			</p>
		</c:forEach>
	</div>


</body>
</html>