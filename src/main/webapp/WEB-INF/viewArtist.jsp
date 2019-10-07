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

	<div id="reviews">
		<form:form action="/review" modelAttribute="newReview">
			<form:input path="reviewBody" />
			<form:errors path="reviewBody" />
			<form:input path="artistId" type="hidden" value="${artist.id}"/>
	<%-- 		<form:input path="user" type="hidden"/>
			<form:errors path="user" msg="Must be logged in"/> --%>
			<form:select>
				<form:option value="1" />
				<form:option value="2" />
				<form:option value="3" />
				<form:option value="4" />
				<form:option value="5" />
			</form:select>
			<input type="submit" value="Post" />
		</form:form>
	</div>
</body>
</html>