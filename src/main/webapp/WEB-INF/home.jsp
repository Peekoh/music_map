<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="index.css">
        <script defer src="/javascripts/app.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="navbar">
	
	 <c:choose>
    <c:when test="${currentUser == null}">
        <a href="/login">Login</a>
        <a href="/register">Register</a>
    </c:when>
    <c:otherwise><div id="userName">
    <span>Hello, </span>
    <c:out value="${currentUser.firstName}"/>
    <a href="/logout">Logout</a>
    </div>
    </c:otherwise>
    </c:choose>
        
        	<div class="dropdown">
            	<button class="dropbtn">Genre Music
                    <i class="fa fa-caret-down"></i>
                </button>
                  <div class="dropdown-content">
                    <a href="#">Country</a>
                    <a href="#">Rock</a>
                    <a href="#">Jazz</a>
                    <a href="#">Hip Hop</a>
                    <a href="#">Blues</a>
                    <a href="#">Heavy Metal</a>
                    <a href="#">Pop</a>
                  </div>
                </div> 
              </div>
              <video id="myVideo"  autoplay loop muted playsinline>
                    <source id="mp4" src="Live-Music.mp4" type="video/mp4">
                       
                  </video>
                  
                   	 <form action="/search" class="search-form" method="get">
                        <div class="search">
                                <i class="fa fa-search" aria-hidden="true"></i>
                      				<input class="form-control transparent-input form-control-sm ml-3 w-75" type="text" placeholder="Search Artist..."
                                  	 name ="search" aria-label="Search">
                                  	 </div>
                    </form>
     			  

</body>
</html>