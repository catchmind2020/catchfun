<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.member.model.vo.*, com.kh.board.model.vo.PageInfo" %>
<%

ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
PageInfo pi = (PageInfo)request.getAttribute("pi");

int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();

%>

<%--회원전체조회 화면 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script
    src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>

 .area{
 
	            width: 300px;
	            height: 100px;
	            font-size: 50px;
	            color: black;
	             background-color: white;
	          border: 1px solid black;
	           position: absolute;
  }
       
  .question{
	font-size: 30px;
    color: blue;
   }
   
  .questiontext{
	width: 700px;
	height: 100px;
   }
   .grey{
	font-size: 15px;
    color: grey;
   }
   .answer{
	font-size: 22px;
    color: green;
   }
   .black{
	color: black; 
	font-size: 15px;
   }
     .blackmodal{
	color: black; 
	font-size: 18px;
   }
    .outer{
	min-width: 1920px;
   }
   
   .blacktool{
     /* vertical-align: middle; */
   width: 700px;
	height: 120px;
	  background-color: white;
	          border: 1px solid black;
	          	font-size: 15px;
    color: black;
   }
   
</style>

  <link href="<%=request.getContextPath()%>/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="<%=request.getContextPath()%>/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
  <!-- Custom styles for this page -->
  <link href="<%=request.getContextPath()%>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
</head>

<body>
<!-- <div  style="position: fixed";> -->
<%@ include file="../menubarIm.jsp" %>


	<div class="outer">
		<form style="margin-left: 13%;">
			<div style="width: 100%; height: 1000px; overflow: auto;">
			<br>
			<h1 class="h3 text-gray-900 mb-4">아이템설계</h1>
			
					<h1 class="black">서포터에게 제공할 아이템 내용을 입력하세요. 서포터가 쉽게 펀딩할 수 있는 저렴한 리워드부터<br> 서포터의 보다 빠른 펀딩을 유도할 수 있는 얼리버드 아이템까지 다양한 아이템 구성하세요.</h1>
				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">리워드 설계 조건</h6>
					</div>
					<div class="card-body" >
						<p>판매할 아이템을 등록해주세요
					</div>
				</div>

				<br>
				
				<div class="btns">
					<button type="button" class="btn btn-success btn-user btn-block" style="width: 120px;" id="modal_show" >+ 추가하기</button>
				</div>
				
				<br>
					 <div class="row" style="width: 100%; ">
						<div class="card mb-5" style="width: 300px;  margin-left: 1%;">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">빨간우산</h6>
							</div>
							<div class="card-body py-1" >
								<h1 class="black"><br>
							특징: 빨간우산임</h1>
							<br>
							</div>
						</div>
						<div class="card  mb-5" style="width: 300px;  margin-left: 1%;">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">파랑우산</h6>
							</div>
							<div class="card-body py-1" >
								<h1 class="black"><br>
							특징: 파랑우산임</h1>
							<br>
							</div>
						</div>
					</div>


				<br><br><br>
			<h1 class="h3 text-gray-900 mb-4">리워드설계</h1>
			
					<h1 class="black">서포터에게 제공할 리워드 내용을 입력하세요. 서포터가 쉽게 펀딩할 수 있는 저렴한 리워드부터<br> 서포터의 보다 빠른 펀딩을 유도할 수 있는 얼리버드 리워드까지 다양한 리워드를 구성하세요.</h1>
				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">리워드 설계 조건</h6>
					</div>
					<div class="card-body" >
						<p>정렬 순서: 혜택이 높은 순으로 나오도록 정렬 순서를 등록하세요.<br>
제한 수량: 생산 및 제공할 수 있는 리워드의 총 수량으로 해당 수량이 모두 펀딩되면 더 이상 펀딩 불가합니다.<br>
발송 시작일: 프로젝트 종료일 이후부터 3개월 이내로 설계 가능합니다.<br>
옵션 조건: 옵션(사이즈, 색상 등)이 필요한 경우, 옵션을 추가하세요. 옵션은 선택형과 직접 텍스트를
               입력하는 직접 입력형으로 설계 가능합니다.리워드 옵션 2개 이상 설계 방법 알아보기</p>
					</div>
				</div>
	


				<br>
				<div class="btns">
					<button type="button" class="btn btn-success btn-user btn-block" style="width: 120px;" id="modal_show2" >+ 추가하기</button>
				</div>
				
				<br>
					 <div class="row" style="width: 100%; ">
						<div class="card mb-5" style="width: 300px;  margin-left: 1%;">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">빨간우산x1, 파랑우산x1</h6>
							</div>
							<div class="card-body py-1" >
								<h1 class="black"><br>
							가격:5000원<br>
							아주 좋은 우산이랍니다<br>
							배송비:5000원<br>
							리워드 발송 시작일 : 2020년5월 말</h1>
							<br>
							</div>
						</div>
						<div class="card  mb-5" style="width: 300px;  margin-left: 1%;">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">빨간우산x5, 파랑우산x3</h6>
							</div>
							<div class="card-body py-1" >
								<h1 class="black"><br>
							가격:30000원<br>
							아주 좋은 우산이랍니다<br>
							배송비:5000원<br>
							리워드 발송 시작일 : 2020년5월 말</h1>
							<br>
							</div>
						</div>
					</div>	
					
					
				<div class="btns">
					<button class="btn btn-primary btn-user btn-block" style="width: 200px;" >저장하기</button>
				</div>
			</div>

		</form>
		
		
		
		  <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">아이템 추가</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                
                
                	<table style= "margin-top:6px;">
						<tr>
							<td class="blackmodal" width="400px" height="50px">아이템</td>
							<td><input type="text" name="userId" id="userId" required></td>
						
						</tr>
				
						<tr>
							<td class="blackmodal" height="50px">아이템설명</td>
							<td><input class="blackmodal"  type="text" name="userPassword" id="userPassword" required></td>
							
						</tr>

						
					</table>

					</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary">아이템추가</button>
                   <!--  <button type="button" class="btn btn-primary" id="close_modal">다른 방식으로 모달 닫기</button> -->
                </div>
            </div>
        </div>
    </div>

	  <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">리워드 추가</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                
                
                	<table style= "margin-top:6px;">
						<tr>
							<td class="blackmodal" width="400px" height="50px">금액</td>
							<td><input type="text" name="userId" id="userId" required></td>
						
						</tr>
				
						<tr>
							<td class="blackmodal" height="50px">리워드명</td>
							<td><input class="blackmodal"  type="text" name="userPassword" id="userPassword" required></td>
							
						</tr>

						<tr>
							<td class="blackmodal"  height="50px">상세설명</td>
							<td><input  class="blackmodal" type="text" id="conPassword" required></td>
							<td></td>
						</tr>
			
						<tr>
							<td class="blackmodal"  height="50px">배송비</td>
							<td><input  class="blackmodal" type="text" name="userNick" required></td>
							<td></td>
						</tr>
						<tr>
							<td  class="blackmodal" height="50px">제한수량</td>
							<td><input class="blackmodal"  type="text" name="userPhone" placeholder="수량입력"></td>
							<td></td>
						</tr>
						
						
					</table>

					</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary">아이템추가</button>
                   <!--  <button type="button" class="btn btn-primary" id="close_modal">다른 방식으로 모달 닫기</button> -->
                </div>
            </div>
        </div>
    </div>	

	</div>
	<script>


	function checkAll(){
		if($("#th_checkAll").is(':checked')){
			$("input[name=uNo]").prop("checked",true);
			
		}else{
			$("input[name=uNo]").prop("checked",false);
		}
	}
	
	
	  $(document).ready(function() {
          $("#modal_show").click(function() {
              $("#exampleModal").modal("show");
          });

          $("#close_modal").click(function() {
              $("#exampleModal").modal("hide");
          });
      });

	  $(document).ready(function() {
          $("#modal_show2").click(function() {
              $("#exampleModal2").modal("show");
          });

          $("#close_modal2").click(function() {
              $("#exampleModal2").modal("hide");
          });
      });
	
</script>
  
</body>
</html>