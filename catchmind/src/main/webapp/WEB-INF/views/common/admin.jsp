<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<!-- Custom fonts for this template-->
  <link href="<%= contextPath %>/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<%= contextPath %>/resources/admin/css/sb-admin-2.css" rel="stylesheet">

</head>
<body>


<body id="page-top">

<!-- ------------------------------------------------------------------------------------------------------------- -->

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" style="float: left;">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="Main.ad">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3" >${ loginUser.userId }<sup></sup></div>
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
       ${ loginUser.userName }님<br>
            환영합니다.
            
          </div>
        </a>
      </li>
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="Main.ad">
          <span>Home</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Menu
      </div>
      <!--Nav Item - 관리자 사이드바 -->
     

      <!-- 회원관리-->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-user"></i>
          <span>회원관리</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="member.ad?currentPage=1">회원리스트</a>
              <a class="collapse-item" href="black.ad?currentPage=1">블랙리스트</a>
              <a class="collapse-item" href="report.ad">댓글신고 리스트</a>
              <a class="collapse-item" href="#">프로젝트신고 리스트</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - 게시판관리 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-list"></i>
          <span>게시판 관리</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="question.ad?currentPage=1">1:1 문의관리</a>
            <a class="collapse-item" href="notice.ad?currentPage=1">공지사항</a>
            <a class="collapse-item" href="#">자주하는질문(FAQ)</a>
            <a class="collapse-item" href="#">이벤트관리</a>
          </div>
        </div>
      </li>

      <!-- 카테고리 -->
      <!-- data-target, div id="collapsePages1" aria-controls 맞춰주기-->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages1" aria-expanded="true" aria-controls="collapsePages1">
          <i class="fas fa-fw fa-list"></i>
          <span>카테고리</span>
        </a>
        <div id="collapsePages1" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="category.ad">카테고리</a>
            <a class="collapse-item" href="#">등록</a>
          </div>
        </div>
      </li>

    <!-- 프로젝트관리-->
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsediv1" aria-expanded="true" aria-controls="collapseUtilities1">
        <i class="fas fa-fw fa-list"></i>
        <span>프로젝트관리</span>
      </a>
      <div id="collapsediv1" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <a class="collapse-item" href="#">펀딩리스트</a>
          <a class="collapse-item" href="#">보류(결제내역)</a>
        </div>
      </div>
    </li>

    <!-- 결제관리-->
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsediv2" aria-expanded="true" aria-controls="collapseUtilities2">
        <i class="fas fa-fw fa-list"></i>
        <span>결제관리(보류)</span>
      </a>
      <div id="collapsediv2" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <a class="collapse-item" href="adminProjectPayTotal.ad">결제내역</a>
          <a class="collapse-item" href="#">보류</a>
        </div>
      </div>
    </li>

    <!-- 통계-->
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsediv" aria-expanded="true" aria-controls="collapseUtilities">
        <i class="fas fa-fw fa-cube"></i>
        <span>통계</span>
      </a>
      <div id="collapsediv" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <a class="collapse-item" href="sales.ad">매출통계</a>
          <a class="collapse-item" href="#">접속통계</a>
        </div>
      </div>
    </li>






        <!-- Nav Item - FAQ -->
   
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->
<!-- ------------------------------------------------------------------------------------------------------------- -->
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar button logout-->
          <ul class="navbar-nav ml-auto">
            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <button class="btn btn-primary" onclick="location.href='logout.me'">logout</button>
            </li>
          </ul>
        </nav>
        <!-- End of Topbar -->
      </div>
      <!-- End of Content Wrapper -->
   </div>
<!-- ------------------------------------------------------------------------------------------------------------------------- -->
      
<!-- ------------------------------------------------------------------------------------------------------------------------ -->
    

  
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="<%= contextPath %>/resources/admin/vendor/jquery/jquery.min.js"></script>

  <!-- ë©ë´ ì´ê³  ë«ê¸° -->
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