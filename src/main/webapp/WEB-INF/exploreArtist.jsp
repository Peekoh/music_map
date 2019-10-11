<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://d3js.org/d3.v5.min.js"></script>
	<script src="\script\explore.js"></script>
	

<meta charset="UTF-8">
<title>Music Map</title>
</head>
<style>
svg {
transform:rotate(90deg); 
margin:auto;
display:block;
z-index: -100000;
position: relative;
}




.node--leaf {
	border-raidus: 30%;
}

h1 {
	text-align: center;
}
.viewArtist {
	text-align: center;
}
image{
	border-radius: 50%;
}
.node circle {
  fill: #fff;
  stroke: steelblue;
  stroke-width: 3px;
  transform:rotate(270deg);
  
  
  
}
filter{
width:100%;
height:100%;
}

.node text { font: 12px sans-serif; transform: rotate(270deg);  }

.link {
  fill: none;
  stroke: #ccc;
  stroke-width: 2px;
}
#explore{
margin-left:;

}
 
 node .defs {
 	border-radius: 25px;
 }


</style>
<body>


	<h1>
		<c:out value="${artist.name}" />
	</h1>
	<div class="viewArtist">
	<a href="/view/${artist.id}">View Artist</a>
	</div>
<div id="explore"></div>
<%-- 	<c:forEach items="${relatedArtists}" var="r">
		<div>
			<c:out value="${r.name}" />
			<a href="/view/${r.id}">
			<img src="${r.images[0].url}" alt="" width="100px"/>		
			</a>
			<a href="/explore/${r.id}">Explore</a>
		</div>
	</c:forEach> --%>
</body>
</html>