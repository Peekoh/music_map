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
		<img src="" alt="profile-img" />
		<p>
			User Since:
			<fmt:formatDate dateStyle="short" value="${viewedUser.createdAt}"></fmt:formatDate>
		</p>
	</div>
	<div id="user-reviews">
	<h2>Reviews</h2>
	<c:forEach items="${viewedUser.reviews}" var="review">
	<c:out value="${review.reviewBody}"/>
	<c:forEach items="${reviewedArtists}" var="artist">
	<c:out value="Review of: ${artist.name}"/>
	</c:forEach>
	</c:forEach>
	</div>
</body>
</html>