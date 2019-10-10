<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="stylesheet" type="text/css" href="../viewArtist.css">
<script src="/..viewArtist.js"></script>
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

	<nav class="navbar navbar-inverse sidebar navbar-fixed-top"
		role="navigation">
		<div class="nav-side-menu">
			<div class="brand">Music Map</div>
			<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
				data-target="#menu-content"></i>
			<div class="menu-list" style="margin-left: 10px;">
				<li data-toggle="collapse" data-target="#user"><a href="/">
						<i class="fa fa-home"></i> Home

				</a></li>
				<li data-toggle="collapse" data-target="#user">


					<form action="/search" class="search-form" method="get">
						<div class="search">
							<!-- <i class="fa fa-search" aria-hidden="true"></i> -->
							<input
								class="review-form-control transparent-input form-control-sm ml-3 w-75"
								type="text" placeholder="Search Artist..." name="search"
								aria-label="Search">
						</div>
					</form>


				</li>
				<c:choose>
					<c:when test="${currentUser != null }">
						<ul id="menu-content" class="menu-content collapse out">
							<li data-toggle="collapse" data-target="#service"
								class="collapsed"><a href="#"> <i
									class="fa fa-sign-out fa-lg"></i> Logout <span class="arrow"></span>

							</a></li>
							<ul class="sub-menu collapse" id="service">
								<ul class="right">

									<li><a href="/logout"> <i class="material-icons left"></i>Logout
									</a></li>


								</ul>
							</ul>
					</c:when>
				</c:choose>
				<!--   <li data-toggle="collapse" data-target="#new" class="collapsed">
                            <a href="#">
                                <i class="fa fa-music fa-lg"></i> Genre
                                <span class="arrow"></span>
                            </a>
                           
                        </li>
                        
                        <ul class="sub-menu collapse" id="new">
                            <li>
                            </li>
                        </ul> -->
				</ul>
				<li data-toggle="collapse" data-target="#team" class="collapsed">
					<a href="#"> <i class="fa fa-music"></i> Genre <span
						class="arrow"></span>
				</a>
				</li>
				<ul class="sub-menu collapse" id="team">
					<li><a href="#" class="team">Country</a></li>
					<li><a href="#" class="team">Rock</a></li>
					<li><a href="#" class="team">Pop</a></li>
					<li><a href="#" class="team">Hip Hop</a></li>
					<li><a href="#" class="team">Heavy Metal</a></li>
					<li><a href="#" class="team">Jazz</a></li>
				</ul>
				<c:choose>
					<c:when test="${currentUser != null}">
						<li data-toggle="collapse" data-target="#user"><a
							href="/user/${currentUser.id }"> <i class="fa fa-user"></i>
								Welcome, <c:out value="${currentUser.firstName}" />

						</a></li>
					</c:when>
				</c:choose>

			</div>
		</div>

		<div class="main"></div>
	</nav>
	<h1 class="name">
		<c:out value="${artist.name}" />
	</h1>
	<img class="artistImg" src="${artist.images[0].url}" alt="artist-pic"
		width=55% height=500px />
		<a href="${artist.externalUrls.externalUrls.spotify}">Listen on Spotify</a>
	<div class="album text-muted">
		<div class="container">
			<div class="row">
				<h1>Albums</h1>

				<c:forEach items="${albums.items}" var="album">
					<div class="card">
						<img src="${album.images[0].url}" alt="album" width="200px"
							height="200px" />
						<p>
							<c:out value="${album.name}" />
						</p>
					</div>
				</c:forEach>
			</div>


		</div>
	</div>

	<h2 class="review-header">Reviews</h2>
	<div class="review my-4">
		<div class="review-body">
			<c:choose>
				<c:when test="${currentUser == null}">
					<div class="reviewLogin">
						<h5>You must be logged in to review.</h5>
					</div>
				</c:when>

				<c:otherwise>

					<form:form action="/review/${artist.id}" modelAttribute="newReview"
						method="post">
						<form:textarea class="review form-control" rows="3"
							path="reviewBody" placeholder="Leave a Review"
							style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 54px;" />
						<form:errors path="reviewBody" />
						<form:input path="artistId" type="hidden" value="${artist.id}" />
						<form:input path="user" type="hidden" value="${currentUser.id}" />
						<form:errors path="user" msg="Must be logged in" />
					
						<form:select class="custom-select" style="width:150px; height:32px;" path="rating">
							<form:option value="1" />
							<form:option value="2" />
							<form:option value="3" />
							<form:option value="4" />
							<form:option value="5" />
						</form:select>
						
						<input class="btn btn-success btn-green" type="submit"
							value="Post" />
					</form:form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
		<div class="rowReview text-center">
			<div class="col-sm-6 col-md-4">
				<div class="testimonial-box">
					<div class="reviews">
						<c:forEach items="${reviews}" var="review">
							<div>
								<h4>
									<c:out value="${review.user.firstName} ${review.user.lastName}" />
								</h4>
								<a href="/user/${review.user.id}"> <%-- <img
									src="${review.user.file}" alt="user-img" /> --%>
								</a>
							</div>
							<c:out value="${review.reviewBody} ${review.rating }" />
							<div class="reviewDate">
								Posted:
								<fmt:formatDate type ="date" dateStyle="short" value="${review.createdAt}"></fmt:formatDate>
							</div>
						</c:forEach>
						<h4>
							<c:out value="${review.user.firstName} ${review.user.lastName}" />
						</h4>
						<%-- <p>
							<c:out value="${review.reviewBody}" />
						</p> --%>
					</div>
				</div>

			</div>
			<!-- End Col -->
		</div>
	</div>
	<!-- <div class="text-right">
		<a style="display: inline-block;" href="#reviews-anchor"
			id="open-review-box" class="btn btn-success btn-green">Leave a
			Review</a>
	</div> -->
	<div class="row" id="post-review-box" style="display: none;">
		<div class="col-md-12">
			<form:form action="/review/${artist.id}" modelAttribute="newReview"
				method="post">
				<%-- 
				<form:hidden id="ratings-hidden" path="rating" />
				<form:hidden path="product.id" /> --%>


				<div class="col-md-12" style="margin-top: 2rem;">
					<%-- <form:textarea class="review form-control" rows="3"
							path="reviewBody" placeholder="Leave a Review"
						style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 54px;"
						 class="form-control animated" 
						  ></form:textarea>  --%>
				</div>
				<div class="text-right">
					<div class="stars starrr" data-rating="0"></div>
					<a href="#" class="btn btn-danger btn-sm" id="close-review-box"
						style="margin-right: 10px; display: none;"> <span
						class="glyphicon glyphicon-remove"></span>Cancel
					</a>
					<button class="btn btn-success btn-lg" type="submit">Save</button>
				</div>
			</form:form>
		</div>
	</div>
	<!--popup-->
	<div id="popup" class="popup-wrapper" style="display: none;">
		<div class="popup-content">
			<div class="popup-title">
				<button type="button" class="popup-close">×</button>
				<h3></h3>
			</div>
			<div class="popup-body">Popup body</div>
		</div>
	</div>


	
	


	<%-- <div class="reviews">
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
					</div> --%>


</body>
</html>