<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.board.model.vo.*" %>
<%

ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
PageInfo pi = (PageInfo)request.getAttribute("pi");

int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.area {
	width: 300px;
	height: 100px;
	font-size: 50px;
	color: black;
	background-color: white;
	border: 1px solid black;
	position: absolute;
}

.question {
	font-size: 30px;
	color: blue;
}

.questiontext {
	width: 700px;
	height: 100px;
}

.questioninput {
	width: 700px;
	height: 35px;
}

.grey {
	font-size: 15px;
	color: grey;
}

.answer {
	font-size: 22px;
	color: green;
}

.outer {
	min-width: 1800px;
}

.black {
	color: black;
	font-size: 15px;
}

.blacktool {
	width: 700px;
	height: 120px;
	background-color: white;
	border: 1px solid black;
	font-size: 15px;
	color: black;
}
</style>
</head>

<body>
<%@ include file="../menubarIm.jsp" %>
	<!-- <div  style="position: fixed";> -->

	<div class="outer">
	
		<form style="margin-left: 13%;">
			<div style="width: 100%; height: 1000px; overflow: auto;">
			<br>
			<h1 class="h3 text-gray-900 mb-4">펀딩결제현황</h1>
			<div class="card shadow mb-4" style="width: 500px;">
                <div class="card-header py-3">
	                  <h6 class="m-0 font-weight-bold text-primary">나의 펀딩현황</h6>
                </div>
                <div class="card-body">
	                 	<h1 class="black">
						1) 1,300,000원목표
						</h1>
						<h1 class="black">
						2) 2018.05.02~2018.06.03 자정마감
						</h1>
                </div>
            </div>
			
	
	
		
            <br> <br>
		 <div class="row" style="width: 100%;">
			 <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="h5 font-weight-bold text-primary text-uppercase mb-1">총펀딩 결제 예약금액</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">164,000원</div>
                      <div class="h6 mb-0 font-weight-grey text-gray-800">오늘 5,000원</div>
                    </div>
                  
                  </div>
                </div>
              </div>
            </div>
			 <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="h5 font-weight-bold text-primary text-uppercase mb-1">총펀딩 달성률</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">12%</div>
                      <div class="h6 mb-0 font-weight-grey text-gray-800">오늘 0.7%</div>
                    </div>
                  
                  </div>
                </div>
              </div>
            </div>
			 <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="h5 font-weight-bold text-primary text-uppercase mb-1">총펀딩 건수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">11건</div>
                      <div class="h6 mb-0 font-weight-grey text-gray-800">오늘 1건</div>
                    </div>
                  
                  </div>
                </div>
              </div>
            </div>
		</div>
		<br><br>
		  <div class="card shadow mb-4" style="width: 1000px; height: 500px; margin-left: 13%;">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">수익현황</h6>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myAreaChart"></canvas>
                  </div>
                  <hr>
                
                </div>
              </div>
		 <br>
		 <h1 class="h3 text-gray-900 mb-4">펀딩내역</h1>
		 <table class="table-bordered table-hover table-sm listArea" style="width:1300px; height: 500px;" cellspacing="0">
            <thead>
              <tr>
                <th width="50px" style="text-align: center;">
                  <div>
                    <label><input class="checkbox " type="checkbox" name="" value="" style="vertical-align: middle; transform: scale(1.4);"></label>
                  </div>
                </th>
                <th width="100px">이름</th>
                <th width="400px">선택 리워드</th>
                <th width="200px">금액</th>
                <th width="100px">갯수</th>
                <th width="150px">펀딩일</th>
                <th width="150px">펀딩상태</th>
                <th width="150px">펀딩총액</th>
              </tr>
            </thead>
            <tbody>
            
			<% if(list.isEmpty()){ 	// 리스트가 비어있을 경우 %>	
			<tr>
				<td colspan="6">존재하는 공지사항이 없습니다.</td>
			</tr>
			<% } else {	// 리스트가 비어있지 않을 경우 %>
			
				<% for(Notice n : list){ %>
				<tr>
					<td class="firsttd" style="text-align: center;"><div class="" >
					
                    <label>
                    <input class="checkbox " type="checkbox" name="" value="" style="vertical-align: middle; transform: scale(1.4);"></label>
                  </div></td>
					<td><%= n.getNoticeNo() %></td>
					<td><%= n.getNoticeTitle() %></td>
					<td><%= n.getNoticeWriter() %></td>
					<td><%= n.getNoticeCount() %></td>
					<td><%= n.getNoticeDate() %></td>
					<td><%= n.getNoticeCount() %></td>
					<td><%= n.getNoticeDate() %></td>
				</tr>	
				<% } %>
				
			<% } %>
            </tbody>
          </table>
             

   	<br><br>
   	
 							<div class="" style="margin-right: 40%;">
					            <ul class="pagination justify-content-center">
						        <% if(currentPage!=1) {%>
						              <li class="paginate_button page-item previous" id="">
						                <a href="<%=contextPath%>/bmNoticeList.qb?currentPage=1" class="page-link">FIRST</a>
						              </li>
						 		      <li class="paginate_button page-item previous" id="">
					                  <a href="<%=contextPath%>/bmNoticeList.qb?currentPage=<%=currentPage-1%>" class="page-link">&lt;</a>
					                  </li>
						        <% } %>
								  <%for(int p=startPage; p<=endPage; p++){ %>
										<% if(currentPage != p){%>
										<li class="paginate_button page-item" id="">
					              				<a href="<%=contextPath%>/bmNoticeList.qb?currentPage=<%=p%>" class="page-link"><%=p%></a>
					             		</li>
										<% }else { %>
										<li class="paginate_button page-item" id="">
					              				<a href="#" class="page-link" style="none"><%=p%></a>
					             		</li>	
										<% } %>
								  <%} %>
						  		<% if(currentPage!=maxPage) {%>
					              <li class="paginate_button page-item next" id="">
					                <a href="<%=contextPath%>/bmNoticeList.qb?currentPage=<%=currentPage+1%>" class="page-link">&gt;</a>
					              </li>

						 		  <li class="paginate_button page-item next" id="">
					                <a href="<%=contextPath%>/bmNoticeList.qb?currentPage=<%=maxPage%>" class="page-link">LAST</a>
					              </li>
						  		<% } %>
					            </ul>
					          </div>				
			</div>

		</form>
	</div>
 
 
	     



	<script>
		$(function(){
			$("table>tbody>tr").click(function(){
				
				//console.log("클릭");
		
				// 현재 클릭했을 때의 해당 공지사항 번호
				var nno = $(this).children().eq(1).text();
				
				// 쿼리스트링을 이용해서 전달값 전달
				 location.href="<%=contextPath%>/adDetail.no?nno=" + nno;
			});
		});
		
		
		
		
		// Set new default font family and font color to mimic Bootstrap's default styling
		Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#858796';

		function number_format(number, decimals, dec_point, thousands_sep) {
		  // *     example: number_format(1234.56, 2, ',', ' ');
		  // *     return: '1 234,56'
		  number = (number + '').replace(',', '').replace(' ', '');
		  var n = !isFinite(+number) ? 0 : +number,
		    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
		    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
		    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
		    s = '',
		    toFixedFix = function(n, prec) {
		      var k = Math.pow(10, prec);
		      return '' + Math.round(n * k) / k;
		    };
		  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
		  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
		  if (s[0].length > 3) {
		    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
		  }
		  if ((s[1] || '').length < prec) {
		    s[1] = s[1] || '';
		    s[1] += new Array(prec - s[1].length + 1).join('0');
		  }
		  return s.join(dec);
		}

		// Area Chart Example
		var ctx = document.getElementById("myAreaChart");
		var myLineChart = new Chart(ctx, {
		  type: 'line',
		  data: {
		    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
		    datasets: [{
		      label: "Earnings",
		      lineTension: 0.3,
		      backgroundColor: "rgba(78, 115, 223, 0.05)",
		      borderColor: "rgba(78, 115, 223, 1)",
		      pointRadius: 3,
		      pointBackgroundColor: "rgba(78, 115, 223, 1)",
		      pointBorderColor: "rgba(78, 115, 223, 1)",
		      pointHoverRadius: 3,
		      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
		      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
		      pointHitRadius: 10,
		      pointBorderWidth: 2,
		      data: [0, 10000, 5000, 15000, 10000, 20000, 15000, 25000, 20000, 30000, 25000, 40000],
		    }],
		  },
		  options: {
		    maintainAspectRatio: false,
		    layout: {
		      padding: {
		        left: 10,
		        right: 25,
		        top: 25,
		        bottom: 0
		      }
		    },
		    scales: {
		      xAxes: [{
		        time: {
		          unit: 'date'
		        },
		        gridLines: {
		          display: false,
		          drawBorder: false
		        },
		        ticks: {
		          maxTicksLimit: 7
		        }
		      }],
		      yAxes: [{
		        ticks: {
		          maxTicksLimit: 5,
		          padding: 10,
		          // Include a dollar sign in the ticks
		          callback: function(value, index, values) {
		            return '$' + number_format(value);
		          }
		        },
		        gridLines: {
		          color: "rgb(234, 236, 244)",
		          zeroLineColor: "rgb(234, 236, 244)",
		          drawBorder: false,
		          borderDash: [2],
		          zeroLineBorderDash: [2]
		        }
		      }],
		    },
		    legend: {
		      display: false
		    },
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      titleMarginBottom: 10,
		      titleFontColor: '#6e707e',
		      titleFontSize: 14,
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: false,
		      intersect: false,
		      mode: 'index',
		      caretPadding: 10,
		      callbacks: {
		        label: function(tooltipItem, chart) {
		          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
		          return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
		        }
		      }
		    }
		  }
		});

	</script>
</body>
</html>