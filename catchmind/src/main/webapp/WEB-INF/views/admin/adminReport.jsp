<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
    .outer {
        text-align: left;
        /* padding: 70px; */

        margin-left: 250px;
        margin-top: 50px;
        min-width: 1050px;
    }
    .tb{
        text-align: center;
    
    
    }
    
    #projectReport{
        display:none;
    }
    .mybtn {

      background:linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
      background-color:#79bbff;
      border-radius:5px;
      border:1px solid #337bc4;
      display:inline-block;
      cursor:pointer;
      color:#ffffff;
      font-family:Arial;
      font-size:14px;
      font-weight:bold;
      padding:5px 15px;
      text-decoration:none;

      }
      .mybtn:hover {
      background:linear-gradient(to bottom, #378de5 5%, #79bbff 100%);
      background-color:#378de5;
      }
      .mybtn:active {
      position:relative;
      top:1px;
      }

</style>
</head>
<body>
 
<jsp:include page="../common/admin.jsp"/>
<div class="outer">
  <h2>신고관리</h2><br>
  <button class="mybtn" onclick="userReport();">댓글신고</button>&nbsp;<button class="mybtn" onclick="projectReport();">프로젝트신고</button><br>
  <br>
      <!-- 댓글신고 -->
      <div id="userReport">
          <form>
              <div class="k_btn">
                <input type="text" name="keyword" placeholder="키워드 입력"> <button class="mybtn" type="button">조회</button>
              </div>
              <br>
              신고리스트 수 : <input type="text" style="border:unset" value="30" >
          </form>
          <br>
          <table class="tb" border="1">
              <tr>
                
                <th width="100px">회원번호</th>
                <th width="200px">아이디</th>
                <th width="50px">구분</th>
                <th width="100px">회원명</th>
                <th width="150px">연락처</th>
                <th width="150px">이메일</th>                  
                <th width="150px">가입일</th>
                <th width="100px">신고수</th>
                <th width="70px">상태</th>
              </tr>
              <tr>
            
                <td>3</td>
                <td>reporthaha</td>
                <td>A</td>
                <td>악성댓글러</td>
                <td>010-1234-1234</td>
                <td>admin@admin.ad</td>                 
                <td>2020.05.17</td>
                <td>14</td>
                <td>
                  <select>
                    <option>변경하기</option>
                    <option>블랙리스트</option>
                  </select>
                </td>
              </tr>
            </table>
      </div>  

      <!-- 프로젝트신고 -->
      <div id="projectReport">
          <form>
              <div class="k_btn">
                <input type="text" name="keyword" placeholder="키워드 입력"> <button class="mybtn" type="button">조회</button>
              </div>
              <br>
              신고리스트 수 : <input type="text" style="border:unset" value="24" > 
          </form>
          <br>
          <table class="tb" border="1">
              <tr>
                
                <th width="120px">프로젝트번호</th>
                <th width="200px">프로젝트이름</th>
                <th width="150px">프로젝트 시작일</th>
                <th width="130px">등록자명</th>
                <th width="150px">등록자 연락처</th>
                <th width="170px">이메일</th>
                <th width="70px">신고수</th>
                <th width="70px">프로젝트 달성률</th>
                <th width="70px">변경하기</th>
              </tr>
              <tr>
            
                <td>21</td>
                <td>아무거나다판다</td>
                <td>2020.05.17</td>
                <td>악성댓글러</td>
                <td>010-1234-1234</td>
                <td>admin@admin.ad</td>
                <td>4,500</td>
                <td>300%</td>
                <td>
                  <select>
                    <option>변경하기</option>
                    <option>프로젝트삭제</option>
                  </select>
                </td>
              </tr>
            </table>
      </div>  
</div>
<script>
  function userReport(){
    if($("#userReport").is(":visible")){
        $("#userReport").slideDown(0);
  }else if($("#projectReport").is(":visible")){
            $("#projectReport").slideUp(0);
            $("#userReport").slideDown(0);
    }
  }

  function projectReport(){
    if($("#projectReport").is(":visible")){
        $("#projectReport").slideDown(0);
  }else if($("#userReport").is(":visible")){
            $("#userReport").slideUp(0);
            $("#projectReport").slideDown(0);
    }
  }
</script>


</body>
</html>