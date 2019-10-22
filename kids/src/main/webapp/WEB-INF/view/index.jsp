<%@page import="lab.spring.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="utf-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>엄마의지도</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
   href="resources/vendors/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
   href="resources/vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
   href="resources/vendors/themify-icons/css/themify-icons.css">
<link rel="stylesheet"
   href="resources/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
   href="resources/vendors/selectFX/css/cs-skin-elastic.css">
<link rel="stylesheet"
   href="resources/vendors/jqvmap/dist/jqvmap.min.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/index.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gaegu:700&display=swap" rel="stylesheet">
<link
   href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
   rel='stylesheet' type='text/css'>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
   src="resources/vendors/bootstrap/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<body>

   <!-- Left Panel -->
	 <%@ include file="./widget.jsp" %>
	 
     <!--  map -->
	<%@ include file="./map.jsp" %>

   <!-- Right Panel -->
   
   <script src="resources/vendors/jquery/dist/jquery.min.js"></script>
   <script src="resources/vendors/popper.js/dist/umd/popper.min.js"></script>
   <script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
   <script src="resources/assets/js/main.js"></script>

   <script src="resources/vendors/jqvmap/dist/jquery.vmap.min.js"></script>
   <script
      src="resources/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
   <script src="resources/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>

</body>

</html>