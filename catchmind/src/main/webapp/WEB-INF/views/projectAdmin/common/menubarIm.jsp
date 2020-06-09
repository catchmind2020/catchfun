<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%
 	String contextPath = request.getContextPath();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합관리자</title>




<!-- Custom fonts for this template-->
  <link href="<%=contextPath%>/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<%=contextPath%>/resources/admin/css/sb-admin-2.css" rel="stylesheet">

</head>
<body>


<body id="page-top">

<!-- ------------------------------------------------------------------------------------------------------------- -->

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" style="float: left;">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=contextPath%>/menubarIm.ad">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3" >프로젝트관리자 : ${  projectUser.projectName }<sup></sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">
      <li class="nav-item active">
        <a class="nav-link" href="#">
          <div align="center">
            <svg class="bi bi-people-circle" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 008 15a6.987 6.987 0 005.468-2.63z"/>
              <path fill-rule="evenodd" d="M8 9a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"/>
              <path fill-rule="evenodd" d="M8 1a7 7 0 100 14A7 7 0 008 1zM0 8a8 8 0 1116 0A8 8 0 010 8z" clip-rule="evenodd"/>
            </svg>
          </div>
          <div align="center" style="font-size: small;">
            <br>
           ${  projectUser.userNo }님<br>
            환영합니다.
            
          </div>
        </a>
      </li>
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="<%=contextPath%>/home.pa">
          <span>Home</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Menu
      </div>
      <!--Nav Item - 테마관리 사이드바 -->
 
      <!-- Nav Item -  회원관리 -->
      <li class="nav-item">
      
        <c:choose>
		<c:when test="${ project.projectStatus eq 'E' }">
     	  <a class="nav-link collapsed" href="<%=contextPath%>/home.pa">
          <i class="fas fa-fw fa-user"></i>
          <span>펀딩준비(제출)</span>
        </a>
        </c:when>
        <c:otherwise>
        
           <a class="nav-link collapsed" href="<%=contextPath%>/home.pa" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-user"></i>
          <span>펀딩준비</span>
        </a>
        </c:otherwise>
        </c:choose>
        
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<%= contextPath %>/basicSelect.pa">기본요건</a>
            <a class="collapse-item" href="<%= contextPath %>/story.pa">기본정보/스토리</a>
            <a class="collapse-item" href="<%= contextPath %>/itemList.pa">아이템설계</a>
            <a class="collapse-item" href="<%= contextPath %>/rewardList.pa">리워드설계</a>
         	<a class="collapse-item" href="<%= contextPath %>/selectMaker.pa">메이커정보</a>
         
          </div>
        </div>
      </li>

      <!-- Nav Item -  지점관리-->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-list"></i>
          <span>내펀딩</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<%=contextPath%>/fund.pa?currentPage=1">펀딩현황</a>
            <a class="collapse-item" href="<%=contextPath%>/news.pa?currentPage=1">새소식</a>
             
            <a class="collapse-item" href="<%=contextPath%>/adList.brno?currentPage=1">가맹점 공지사항</a> 
         	
          </div>
        </div>
      </li>
      <!-- Nav Item - 게시판관리 -->
      
<%--       
     <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages2" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-list"></i>
          <span>펀딩현황</span>
        </a>
        <div id="collapsePages2" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<%=contextPath%>/adList.no?currentPage=1">결제현황</a>
            <a class="collapse-item" href="<%=contextPath%>/adList.ev?currentPage=1">오픈현황</a>
            <a class="collapse-item" href="<%=contextPath%>/adList.fr?currentPage=1">새소식</a>          
            <a class="collapse-item" href="<%=contextPath%>/adList.brno?currentPage=1">서포터</a>
  
          </div>
        </div>
      </li> --%>


  <%--     <!-- Nav Item - 리뷰관리-->
      <li class="nav-item">
        <a class="nav-link" href="<%=contextPath%>/adList.rv?currentPage=1">
          <i class="fas fa-fw fa-comment"></i>
          <span>리뷰관리</span></a>
      </li>
        <!-- Nav Item - FAQ -->
      <li class="nav-item">
        <a class="nav-link" href="<%=contextPath%>/adList.faq?currentPage=1">
          <i class="fas fa-fw fa-question"></i>
          <span>FAQ관리</span></a>
      </li> --%>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->
<!-- ------------------------------------------------------------------------------------------------------------- -->
    <%-- <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" style=" width: 100%; height: 50px;">
        <div style=" width: 100%; height: 70px;">	  
                        <div class="col s4 parShowing show" style="transform: matrix(1,0,0,1,0,0); opacity:1;">
                        <img src="resources/images/logo.png" style=" width: 150px; height: 50px; margin-top: 10px ;" alt="">
                       
                    </div>
                        </div>
	
          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
          
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar button logout-->
          <ul class="navbar-nav ml-auto">
            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <button class="btn btn-primary" onclick="location.href='<%=contextPath%>/logout.me'">logout</button>
            </li>
            
          </ul>
        </nav>
        <!-- End of Topbar -->
      </div>
      <!-- End of Content Wrapper -->
   </div> --%>
<!-- ------------------------------------------------------------------------------------------------------------------------- -->
      
<!-- ------------------------------------------------------------------------------------------------------------------------ -->
    






  
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
<%--   <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" onclick="location.href='<%=contextPath%>/logout.me'">Logout</a>
        </div>
      </div>
    </div>
  </div> --%>
  <!--====== Javascripts & Jquery ======-->
	<script src="<%= contextPath %>/resources/js/jquery-3.2.1.min.js"></script>
	<script src="<%= contextPath %>/resources/js/bootstrap.min.js"></script>
	<script src="<%= contextPath %>/resources/js/owl.carousel.min.js"></script>
	<script src="<%= contextPath %>/resources/js/jquery.marquee.min.js"></script>
  <script src="<%= contextPath %>/resources/js/main.js"></script>

  <!-- Bootstrap core JavaScript-->

  <script src="<%= contextPath %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>




  <!-- Core plugin JavaScript-->
  <script src="<%= contextPath %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="<%= contextPath %>/resources/admin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="<%= contextPath %>/resources/admin/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="<%= contextPath %>/resources/admin/js/demo/chart-area-demo.js"></script>
  <script src="<%= contextPath %>/resources/admin/js/demo/chart-pie-demo.js"></script>


</body>
</html>