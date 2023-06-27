<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
 <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<!------ Include the above in your HEAD tag ---------->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@600&display=swap" rel="stylesheet">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Responsive sidebar template with sliding effect and dropdown menu based on bootstrap 3">
    <title>DashBoard</title>
    <!-- page-wrapper -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        crossorigin="anonymous">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
 	<link rel="stylesheet" href="css/admin/main.css" />
 	 <link rel="icon" href="images/logo.ico" type="image/x-icon">
 	 <script src="admin/movie/movie.js"></script>
<style>
</style>
</head>
<script>
	window.history.forward(); function noBack() {
		window.history.forward();
	}
</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">

<div class="page-wrapper chiller-theme toggled">
  <div class='admin-header'>
    <div class='header-text'>
      <h3></h3>
      <div class='header-greet'>
        <span><i class="fa">&#xf007;</i>&nbsp;&nbsp;Hello Admin!&nbsp;&nbsp;</span>
        <a href='logout' class='logout-btn'><i class="fa">&#xf011;</i></a>
      </div>
    </div>
  </div>
  <div class="purple-box"></div>

  <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
    <i class="fas fa-bars"></i>
  </a>
  <nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content">
      <div class="sidebar-brand">
        <a href="#">MOVIE HOLIC</a>
        <div id="close-sidebar">
          <i class="fas fa-times"></i>
        </div>
      </div>
      <div class="sidebar-menu">
        <ul>
          <li class="header-menu">
            <span>General</span>
          </li>
          <!-- 사이드 바 항목 -->
          <li class="sidebar-dropdown">
            <a href="adminPage">
              <i class="fas fa-home"></i>
              <span>Home</span>
            </a>
          </li>
          <!-- 사이드 바 항목 -->
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="fas fa-video"></i>
              <span>Movie</span>
            </a>
            <div class="sidebar-submenu">
              <ul>
                <li>
                  <a href="movieInsertForm">Add Movie</a>
                </li>
                <li>
                  <a href="admin_movie_list">View Movies</a>
                </li>
              </ul>
            </div>
          </li>
          
          <!-- 사이드 바 항목 -->
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="far fa-calendar-alt"></i>
              <span>Schedule</span>
            </a>
            <div class="sidebar-submenu">
              <ul>
                <li>
                  <a href="insert_schedule_form">Add Schedule</a>
                </li>
                <li>
                  <a href="admin_theater_list">View Schedules</a>
                </li>
              </ul>
            </div>
          </li>
          
          <!-- 사이드 바 항목 -->
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="fas fa-film"></i>
              <span>Theater</span>
            </a>
            <div class="sidebar-submenu">
              <ul>
                <li>
                  <a href="insert_theater_form">Add Theater</a>
                </li>
                <li>
                  <a href="admin_theater_list_view">View Theaters</a>
                </li>
              </ul>
            </div>
          </li>
          
          
          <!-- 사이드 바 항목 -->
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="fas fa-ticket-alt"></i>
              <span>Ticketing</span>
            </a>
            <div class="sidebar-submenu">
              <ul>
                <li>
                  <a href="get_all_ticketing_list">View Ticketings</a>
                </li>
              </ul>
            </div>
          </li>

          <!-- 사이드 바 항목 -->
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="fas fa-users"></i>
              <span>User</span>
            </a>
            <div class="sidebar-submenu">
              <ul>
                <li>
                  <a href="member_admin_list">View Users</a>
                </li>
               </ul>
            </div>
          </li>

          <!-- 사이드 바 항목 -->
          <li class="sidebar-dropdown">
            <a href="#">
             <i class="far fa-bell"></i>
              <span>Notice</span>
            </a>
            <div class="sidebar-submenu">
              <ul>
                <li>
                  <a href="notice_write_form">Add Notice</a>
                </li>
                <li>
                  <a href="notice_list_admin">View Notices</a>
                </li>
              </ul>
            </div>
          </li> 

          <!-- 사이드 바 항목 -->
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="far fa-question-circle"></i>
              <span>Q&A</span>
            </a>
            <div class="sidebar-submenu">
              <ul>
                <li>
                  <a href="list_admin_qna">View Q&As</a>
                </li>
              </ul>
            </div>
          </li>
                  
        <!-- 사이드 바 로그아웃 -->
          <li>
            <a href="index">
              <i class="fas fa-book"></i>
              <span>Main</span>
            </a>
          </li>
        </ul>
      </div>
      <!-- sidebar-menu  -->
    </div>
  </nav>
  <!-- sidebar-wrapper  -->

  <!-- page-content" -->
    <script>
    jQuery(function ($) {

        $(".sidebar-dropdown > a").click(function() {
      $(".sidebar-submenu").slideUp(200);
      if (
        $(this)
          .parent()
          .hasClass("active")
      ) {
        $(".sidebar-dropdown").removeClass("active");
        $(this)
          .parent()
          .removeClass("active");
      } else {
        $(".sidebar-dropdown").removeClass("active");
        $(this)
          .next(".sidebar-submenu")
          .slideDown(200);
        $(this)
          .parent()
          .addClass("active");
      }
    });

    $("#close-sidebar").click(function() {
      $(".page-wrapper").removeClass("toggled");
    });
    $("#show-sidebar").click(function() {
      $(".page-wrapper").addClass("toggled");
    });
    });
    </script>
</body>

</html>