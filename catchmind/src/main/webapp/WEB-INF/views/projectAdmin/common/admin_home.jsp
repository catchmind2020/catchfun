<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%
String contextPath = request.getContextPath();


%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="../../resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../../resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- ------------------------------------------------------------------------------------------------------------- -->

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
              <a  href="<%= contextPath %>/logout.me" class="btn btn-primary" >logout</a>
            </li>
          </ul>
        </nav>
        <!-- End of Topbar -->
      </div>
      <!-- End of Content Wrapper -->
   </div>
<!-- ------------------------------------------------------------------------------------------------------------------------- -->
      
<!-- ------------------------------------------------------------------------------------------------------------------------ -->
    
<div class="container justify-content-center">
<div class="row justify-content-center">
  <div class="col-md-6" style="text-align: center;">
   <img src="../../resources/admin/img/browser.svg" style="transform: scale(0.6);"> <br>
 <% if(loginUser != null && loginUser.getUserType() == 3){ %>
   <button class="btn btn-danger" onclick="menubar_im();">통합관리자</button><%} %>
  </div>

 

  <div class="col-md-6" style="text-align: center;">
    <img src="../../resources/admin/img/browser_blue.svg" style="transform: scale(0.6);">
   <% if(loginUser != null && loginUser.getUserType() ==2){ %>
   <button class="btn btn-info" onclick="menubar_bm();">지점관리자</button><%} %>

  </div>
</div>

</div>




  
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  


<script >
function menubar_im(){
	location.href="<%= request.getContextPath() %>/menubarIm.ad";
}

function menubar_bm(){
	location.href="<%= request.getContextPath() %>/bmMain.bm";
	

}
</script>



  <!-- Bootstrap core JavaScript-->
  <script src="../../resources/admin/vendor/jquery/jquery.min.js"></script>
  <script src="../../resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../../resources/admin/js/sb-admin-2.min.js"></script>



</body>

</html>
