<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="search.css">
        <script defer src="/javascripts/app.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>Music Map</title>
</head>
<body>
	<%-- <header>
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
	</header> --%>
	
	<nav class="navbar navbar-inverse sidebar navbar-fixed-top" role="navigation">
            <div class="nav-side-menu">
                <div class="brand">Music Map</div>
                <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
                <div class="menu-list" style="margin-left: 10px;">
                    <ul id="menu-content" class="menu-content collapse out">
                        <li data-toggle="collapse" data-target="#service" class="collapsed">
                            <a href="#">

                                <!-- <i class="fa fa-user fa-lg"></i> Logout
                                <span class="arrow"></span> -->

                                <i class="fa fa-user fa-lg"></i> Logout 
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
                     <li data-toggle="collapse" data-target="#user" >
                        <a href="/user">
                            <i class="fa fa-user"></i>
                          
                            <c:out value="${user.firstName}"/>
                            
                        </a>
                    </li>
                    </a>
                    </li>
                </div>
            </div>

            <div class="main">
            </div>
    </div>
    </nav>
	<h1>
		Results for
		<c:out value="${search}" />
	</h1>
<!-- TEST -->
<!-- TEST -->
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