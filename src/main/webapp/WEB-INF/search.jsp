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
		Results for
		<c:out value="${search}" />
	</h1>

	<c:forEach items="${results.items}" var="result">
		<h2>
			<c:out value="${result.name}" />
		</h2>
		<img src="${result.images[0].url}" alt="" width="100px;" />
	<a href="/view/${result.id}">View</a>
	<a href="/explore/${result.id}">Explore</a>
	</c:forEach>
</body>
</html>