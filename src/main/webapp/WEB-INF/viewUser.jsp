<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css" rel="stylesheet" media="screen">
<meta charset="UTF-8">
<title>Music Map</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../viewUser.css">
<script src="../viewUser.js"></script>
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
 <nav class="navbar navbar-inverse sidebar navbar-fixed-top" role="navigation">
            <div class="nav-side-menu">
                <div class="brand">Music Map</div>
                <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
                <div class="menu-list" style="margin-left: 10px;">
                 <li data-toggle="collapse" data-target="#user" >
                        <a href="/">
                            <i class="fa fa-home"></i>
                          	Home
                          	  
                        </a>
                    </li>
                     <li data-toggle="collapse" data-target="#user" >
                        
                          
                          <form action="/search" class="search-form" method="get">
                        <div class="search">
                                <!-- <i class="fa fa-search" aria-hidden="true"></i> -->
                      				<input class="form-control transparent-input form-control-sm ml-3 w-75" type="text" placeholder="Search Artist..."
                                  	 name ="search" aria-label="Search">
                                  	 </div>
                    </form>
                          	  
                        
                    </li>
                <c:choose>
					<c:when test="${currentUser != null }">
                    <ul id="menu-content" class="menu-content collapse out">
                        <li data-toggle="collapse" data-target="#service" class="collapsed">
                            <a href="#">
								
                                <i class="fa fa-sign-out fa-lg"></i> Logout 
                                <span class="arrow"></span>

                            </a>
                        </li>
                        <ul class="sub-menu collapse" id="service">
                            <ul class="right">

                                <li>
                                    <a href="/logout">
                                        <i class="material-icons left"></i>Logout</a>
                                </li>
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
                        <a href="#">
                            <i class="fa fa-music"></i> Genre
                            <span class="arrow"></span>
                        </a>
                    </li>
                    <ul class="sub-menu collapse" id="team">
                        <li>
                            <a href="#" class="team">Country</a>
                        </li>
                        <li>
                            <a href="#" class="team">Rock</a>
                        </li>
                        <li>
                            <a href="#" class="team">Pop</a>
                        </li>
                         <li>
                            <a href="#" class="team">Hip Hop</a>
                        </li>
                        <li>
                            <a href="#" class="team">Heavy Metal</a>
                        </li>
                        <li>
                            <a href="#" class="team">Jazz</a>
                        </li>
                    </ul>
                    <c:choose>
                    <c:when test="${currentUser != null}">
                     <li data-toggle="collapse" data-target="#user" >
                        <a href="/user/${currentUser.id }">
                            <i class="fa fa-user"></i>
                          	Welcome, 
                          	<c:out value="${currentUser.firstName}"/>
                          	  
                        </a>
                    </li>
                    </c:when>
                    </c:choose>
                    
                </div>
            </div>

            <div class="main">
            </div>
   
    </nav> 
 <div class="container">
    <div class="row user-menu-container square">
        <div class="col-md-7 user-details">
            <div class="row coralbg white">
                <div class="col-md-6 no-pad">
                    <div class="user-pad">
                        <h3><c:out value="${currentUser.firstName } ${currentUser.lastName }"/></h3>
                        
                        <h4 class="white"><i class="fa fa-envelope-o"></i> <c:out value="${currentUser.email }"/></h4>
                        <button type="button" class="btn btn-labeled btn-info" href="#">
                            <span class="btn-label"><i class="fa fa-pencil"></i></span>Update</button>
                    </div>
                </div>
                <div class="col-md-6 no-pad">
                    <div class="user-image">
                        <img src="" class="img-responsive thumbnail">
                    </div>
                </div>
            </div>
           <!--  <div class="row overview">
                <div class="col-md-4 user-pad text-center">
                    <h3>FOLLOWERS</h3>
                    <h4>2,784</h4>
                </div>
                <div class="col-md-4 user-pad text-center">
                    <h3>FOLLOWING</h3>
                    <h4>456</h4>
                </div>
                <div class="col-md-4 user-pad text-center">
                    <h3>APPRECIATIONS</h3>
                    <h4>4,901</h4>
                </div>
            </div> -->
        </div>
        <div class="col-md-1 user-menu-btns">
            <div class="btn-group-vertical square" id="responsive">
                <a href="#" class="btn btn-block btn-default active">
                  <i class="fa fa-headphones fa-3x"></i>
                </a>
                <a href="#" class="btn btn-default">
                  <i class="fa fa-comment fa-3x"></i>
                </a>
                <a href="#" class="btn btn-default">
                  <i class="fa fa-laptop fa-3x"></i>
                </a>
                <a href="#" class="btn btn-default">
                  <i class="fa fa-cloud-upload fa-3x"></i>
                </a>
            </div>
        </div>
        <div class="col-md-4 user-menu user-pad">
            <div class="user-menu-content active">
                <h3>
                    Recent Artist Searched
                </h3>
                <ul class="user-menu-list">
                    <li>
                        <h4><i class="fa fa-user coral"></i> Rihanna</h4>
                    </li>
                    <li>
                        <h4><i class="fa fa-heart-o coral"></i> Drake</h4>
                    </li>
                    <li>
                        <h4><i class="fa fa-paper-plane-o coral"></i> Justin Bieber</h4>
                    </li>
                    <li>
                        <button type="button" class="btn btn-labeled btn-success" href="#">
                            <span class="btn-label"><i class="fa fa-bell-o"></i></span>View all activity</button>
                    </li>
                </ul>
            </div>
            <div class="user-menu-content">
                <h3>
                    Your Review
                </h3>
                <ul class="user-menu-list">
                    <li>
                        <h4>From Roselyn Smith <small class="coral"><strong>NEW</strong> <i class="fa fa-clock-o"></i> 7:42 A.M.</small></h4>
                    </li>
                    <li>
                        <h4>From Jonathan Hawkins <small class="coral"><i class="fa fa-clock-o"></i> 10:42 A.M.</small></h4>
                    </li>
                    <li>
                        <h4>From Georgia Jennings <small class="coral"><i class="fa fa-clock-o"></i> 10:42 A.M.</small></h4>
                    </li>
                    <li>
                        <button type="button" class="btn btn-labeled btn-danger" href="#">
                            <span class="btn-label"><i class="fa fa-envelope-o"></i></span>View All Messages</button>
                    </li>
                </ul>
            </div>
            <div class="user-menu-content">
                <h3>
                    Trending
                </h3>
                <div class="row">
                    <div class="col-md-6">
                        <div class="view">
                            <div class="caption">
                                <p>47LabsDesign</p>
                                <a href="" rel="tooltip" title="Appreciate"><span class="fa fa-heart-o fa-2x"></span></a>
                                <a href="" rel="tooltip" title="View"><span class="fa fa-search fa-2x"></span></a>
                            </div>
                            <img src="http://24.media.tumblr.com/273167b30c7af4437dcf14ed894b0768/tumblr_n5waxesawa1st5lhmo1_1280.jpg" class="img-responsive">
                        </div>
                        <div class="info">
                            <p class="small" style="text-overflow: ellipsis">An Awesome Title</p>
                            <p class="small coral text-right"><i class="fa fa-clock-o"></i> Posted Today | 10:42 A.M.</small>
                        </div>
                        <div class="stats turqbg">
                            <span class="fa fa-heart-o"> <strong>47</strong></span>
                            <span class="fa fa-eye pull-right"> <strong>137</strong></span>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="view">
                            <div class="caption">
                                <p>47LabsDesign</p>
                                <a href="" rel="tooltip" title="Appreciate"><span class="fa fa-heart-o fa-2x"></span></a>
                                <a href="" rel="tooltip" title="View"><span class="fa fa-search fa-2x"></span></a>
                            </div>
                            <img src="http://24.media.tumblr.com/282fadab7d782edce9debf3872c00ef1/tumblr_n3tswomqPS1st5lhmo1_1280.jpg" class="img-responsive">
                        </div>
                        <div class="info">
                            <p class="small" style="text-overflow: ellipsis">An Awesome Title</p>
                            <p class="small coral text-right"><i class="fa fa-clock-o"></i> Posted Today | 10:42 A.M.</small>
                        </div>
                        <div class="stats turqbg">
                            <span class="fa fa-heart-o"> <strong>47</strong></span>
                            <span class="fa fa-eye pull-right"> <strong>137</strong></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="user-menu-content">
                <h2 class="text-center">
                    START SHARING
                </h2>
                <center><i class="fa fa-cloud-upload fa-4x"></i></center>
                <div class="share-links">
                    <center><button type="button" class="btn btn-lg btn-labeled btn-success" href="#" style="margin-bottom: 15px;">
                            <span class="btn-label"><i class="fa fa-bell-o"></i></span>A FINISHED PROJECT
                    </button></center>
                    <center><button type="button" class="btn btn-lg btn-labeled btn-warning" href="#">
                            <span class="btn-label"><i class="fa fa-bell-o"></i></span>A WORK IN PROGRESS
                    </button></center>
                </div>
            </div>
        </div>
    </div>
</div> 

	<div class="reviewUser">
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
	</div>
	<script src="/script/photoUpload.js"></script> 
</body>
</html>