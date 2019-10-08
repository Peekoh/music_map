<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Music Map</title>
</head>
<body>
<header>
	<form action="/search" class="search-form" method="get">
		<label for="search">Search For Artist</label> <input type="text"
			name="search" /> <input type="submit" value="Search" />
	</form>
	<form action="/login" class="login-form">
		<label for="email">Email:</label> <input type="email" name="email" />
		<label for="password">Password:</label> <input type="password"
			name="password" id="" /> <input type="submit" value="Login" />
	</form>
	<form action="/register">
		<input type="submit" value="Register" />
	</form>
</header>
	<h1>
		<c:out value="${artist.name}" />
	</h1>
	<img src="${artist.images[0].url}" alt="artist-img" />
	<c:forEach items="${relatedArtists}" var="r">
		<div>
			<c:out value="${r.name}" />
			<a href="/view/${r.id}">
			<img src="${r.images[0].url}" alt="" width="100px"/>		
			</a>
			<a href="/explore/${r.id}">Explore</a>
		</div>
	</c:forEach>
</body>
</html>