<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Music Map</title>
</head>
<body>
<header>
		<form action="/search" class="search-form" method="get">
			<label for="search">Search For Artist</label> 
			<input type="text" name="search" />
				<input type="submit" value="Search" />
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
		<form:form action="/review/${artist.id}" modelAttribute="newReview" method="post">
			<form:textarea path="reviewBody" />
			<form:errors path="reviewBody" />
			<form:input path="artistId" type="hidden" value="${artist.id}"/>
<%-- 			<form:input path="user" type="hidden" value="1"/>
			<form:errors path="user" msg="Must be logged in"/>  --%>
			<form:select path="rating">
				<form:option value="1" />
				<form:option value="2" />
				<form:option value="3" />
				<form:option value="4" />
				<form:option value="5" />
			</form:select>
			<input type="submit" value="Post" />
		</form:form>
	<div id="reviews">
	<c:forEach items="${reviews}" var="review">
	<div>
	<div>	</div>
	<span>User:</span>
	<a href="/user/${review.user.id }"></a>
	<img src="" alt="" />
	</div>
	<c:out value="${review.reviewBody}"/>
	<p>
	Posted: <fmt:formatDate dateStyle="short" value="${review.createdAt}"></fmt:formatDate>
	</p>
	
	</div>
	
	</c:forEach>
	</div>
	
</body>
</html>