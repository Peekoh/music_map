<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <script defer src="/javascripts/app.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="reg.css">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link
        href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
<title>Registration Page</title>
</head>
<body>

	<p>
		<form:errors path="user.*" />
	</p>
	<div class="navbar">
        <a href="/">Home</a>
        <a href="/register">Register</a>
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

	<div class="page-wrapper bg-gra-01 p-t-180 p-b-100 font-poppins">
	
        <div class="wrapper wrapper--w780">
            <div class="card card-3">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">Registration Info</h2>
                    <form:form method="POST" action="/registration" modelAttribute="user">
                        <div class="input-group">
                            <input class="input--style-3" path="firstName" type="text" placeholder="First Name" name="firstName">
                        </div>
                        <div class="input-group">
                            <input class="input--style-3 js-datepicker" path="lastName" type="text" placeholder="Last Name"
                                name="lastName">
                        </div>
                        <div class="input-group">
                            <input class="input--style-3 js-datepicker" path="email" type="email" placeholder="Email" name="email">
                        </div>
                        <div class="input-group">
                            <input class="input--style-3 js-datepicker" path="password" type="password" placeholder="Password"
                                name="password">
                        </div>
                        <div class="input-group">
                            <input class="input--style-3 js-datepicker" path="passwordConfirmation" type="password"
                                placeholder="Password Confirmation" name="passwordConfirmation">
                        </div>
                        <!-- <div class="input-group">
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="gender">
                                    <option disabled="disabled" selected="selected">Gender</option>
                                    <option>Male</option>
                                    <option>Female</option>
                                    <option>Other</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div> -->
                        
                        <div class="p-t-10">
                            <button class="btn btn--pill btn--green" type="submit">Submit</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>
</body>
</html>